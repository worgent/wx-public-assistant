package weixin.xigua.service.Impl;

import base.SystemGlobal;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import weixin.assistant.constants.WeixinConstant;
import weixin.base.file.fileUtil;
import weixin.base.html.SpiderHttpClient;
import weixin.xigua.constants.XiguaConstant;
import weixin.xigua.dao.WpwxArticleAssociationMapper;
import weixin.xigua.dao.WpwxArticleContentMapper;
import weixin.xigua.dao.WpwxArticleMapper;
import weixin.xigua.dao.WpwxUserArticleMapper;
import weixin.xigua.enums.DelFlagEnum;
import weixin.xigua.enums.UserArticleTypeEnum;
import weixin.xigua.model.*;
import weixin.xigua.service.WpwxUserArticleService;
import weixin.xigua.util.FileUtil;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by worgen on 2015/12/24.
 */
@Service
public class WpwxUserArticleServiceImpl implements WpwxUserArticleService {
    @Autowired
    private WpwxUserArticleMapper wpwxUserArticleMapper;
    @Autowired
    private WpwxArticleMapper wpwxArticleMapper;
    @Autowired
    private WpwxArticleContentMapper wpwxArticleContentMapper;
    @Autowired
    private WpwxArticleAssociationMapper wpwxArticleAssociationMapper;

    /**
     * 获取内容中第一张图片路径
     *
     * @param content
     *            字符串，活动或者文章内容
     * @return picIndex 第一张图片路径
     */
    private String getThumbnail(Element eleContent) {

        Elements eleImgs = eleContent.getElementsByTag("img");
        for(Element eleImg : eleImgs){
            String dataS = eleImg.attr("data-s");
            String dataType = eleImg.attr("data-type");
            String dataSrc = eleImg.attr("data-src");
//            String src = eleImg.attr("src");
            if(dataS.equals("300,640") &&
                    (dataType.equals("jpeg") || dataType.equals("png") )
                    ){
                String fileName = "article_thumb_"+ UUID.randomUUID()+"."+dataType;
                FileUtil.downloadPicture(dataSrc, fileName);
                return "http://"+ WeixinConstant.domain+
                        SystemGlobal.getPreference("xigua.articleThumbnailPathRelative")+
                        fileName;
            }
        }
        String defaultThumbnail = "http://"+ WeixinConstant.domain+"/images/article/thumbnail/640.webp.jpg";
        return defaultThumbnail;
    }

    //对指定字符串进行缩略显示
    private String getSummary(Element eleContent) {
        String content = eleContent.text();
        String summary = "";
        String p_str = "<[^>]+>";
//        summary = content.replaceAll(p_str, "").replaceAll("\\s*", "");
        int len = content.trim().length();
        if (len > 50) {
            summary = content.substring(0, 50) + "...";
        }
        return summary;
    }



    @Override
    public WpwxArticle importMaterial(String mpUrl) {
        //分解获得，标题，图片，时间，内容，摘要等等
        SpiderHttpClient spiderHttpClient = new SpiderHttpClient();
        //链接
        String link = null;
        try {
            link = URLDecoder.decode(mpUrl, "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
        String articleHtml  = spiderHttpClient.read_html(link);
//        Jsoup.clean()
        Document articleDoc = Jsoup.parse(articleHtml);
        articleDoc.outputSettings(new Document.OutputSettings().prettyPrint(false));
        //标题
        Elements eTitles = articleDoc.getElementsByTag("title");
        //缩略图
        Element elePage = articleDoc.getElementById("page-content");
        Element eleTitle = elePage.getElementById("activity-name");
        Element elePostDate = elePage.getElementById("post-date");
        Element elePostUser = elePage.getElementById("post-user");
        Element eleContent = elePage.getElementById("js_content");

        String title = eleTitle.text();
        DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd");
        DateTime postDate = DateTime.parse(elePostDate.text(), format);
        String postUser = elePostUser.text();
        Elements eImgs = eleContent.getElementsByTag("img");
        for(Element eImg : eImgs){

            if( eImg.hasAttr("src") == false ){
                eImg.attr("src", eImg.attr("data-src"));
            }
        }
        String content = eleContent.toString();
        //缩略图需要下载，摘要需要摘取；公众号信息需要读取
        String summary = getSummary(eleContent);
        String thumbnail = getThumbnail(eleContent);

        WpwxArticle wpwxArticle = new WpwxArticle();
        wpwxArticle.setCreatedTime(new Date());
        wpwxArticle.setUpdateTime(new Date());
        wpwxArticle.setTitle(title);
        wpwxArticle.setLink(link);
        wpwxArticle.setSummary(summary);
        wpwxArticle.setThumbnail(thumbnail);
        wpwxArticle.setSourceName(postUser);
        wpwxArticle.setPublishTime(postDate.toDate());

        wpwxArticleMapper.insertSelective(wpwxArticle);
        WpwxArticleContent wpwxArticleContent = new WpwxArticleContent();
        wpwxArticleContent.setArticleId(wpwxArticle.getId());
        wpwxArticleContent.setContent(content);
        wpwxArticleContentMapper.insertSelective(wpwxArticleContent);
        return wpwxArticle;
    }
    @Override
    public int collectMaterial(String userId, int articleId) {
        WpwxUserArticle wpwxUserArticle = getMaterial(userId, articleId);
        boolean bDel = false;
        if( wpwxUserArticle == null ){
            wpwxUserArticle = new WpwxUserArticle();
        }else if( wpwxUserArticle.getDelFlag() == DelFlagEnum.DELETE.getKey() ){
            bDel = true;
        }
        wpwxUserArticle.setUserId(userId);
        wpwxUserArticle.setArticleId(articleId);
        wpwxUserArticle.setType(UserArticleTypeEnum.MATERIAL.getKey());
        wpwxUserArticle.setDelFlag(DelFlagEnum.NORMAL.getKey());
        if( bDel == true ){
            wpwxUserArticle.setUpdatedTime(new Date());
            wpwxUserArticleMapper.updateByPrimaryKeySelective(wpwxUserArticle);
        }else{
            wpwxUserArticle.setCreatedTime(new Date());
            wpwxUserArticle.setUpdatedTime(new Date());

            wpwxUserArticleMapper.insertSelective(wpwxUserArticle);
        }
        return 0;
    }

    @Override
    public int cancelCollectMaterial(String userId, int articleId) {
        WpwxUserArticle wpwxUserArticle = getMaterial(userId, articleId);
        boolean bDel = false;
        if( wpwxUserArticle == null ){
            return 0;
        }

        wpwxUserArticle.setUserId(userId);
        wpwxUserArticle.setArticleId(articleId);
        wpwxUserArticle.setType(UserArticleTypeEnum.MATERIAL.getKey());
        wpwxUserArticle.setDelFlag(DelFlagEnum.DELETE.getKey());

        wpwxUserArticle.setUpdatedTime(new Date());
        wpwxUserArticleMapper.updateByPrimaryKeySelective(wpwxUserArticle);

        return 0;
    }

    @Override
    public boolean isMaterialCollect(String userId, int articleId) {

        return getMaterial(userId, articleId) != null;
    }

    @Override
    public WpwxUserArticle getMaterial(String userId, int articleId) {
        WpwxUserArticleExample wpwxUserArticleExample = new WpwxUserArticleExample();
        wpwxUserArticleExample.createCriteria().
                andUserIdEqualTo(userId).
                andArticleIdEqualTo(articleId).
                andTypeEqualTo(UserArticleTypeEnum.MATERIAL.getKey()).
                andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey());
        List<WpwxUserArticle> wpwxUserArticles = wpwxUserArticleMapper.selectByExample(wpwxUserArticleExample);
        if( wpwxUserArticles.size() > 0 ){
            return wpwxUserArticles.get(0);
        }else {
            return null;
        }
    }

    @Override
    public List<WpwxArticleAssociation> getUserMaterials(String userId) {
        WpwxUserArticleExample wpwxUserArticleExample = new WpwxUserArticleExample();
        wpwxUserArticleExample.createCriteria().
                andUserIdEqualTo(userId).
                andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey()).
                andTypeEqualTo(UserArticleTypeEnum.MATERIAL.getKey());

        wpwxUserArticleExample.setOrderByClause("WPWX_USER_ARTICLE.updated_time desc");
        WpwxArticleAssociationExample wpwxArticleAssociationExample = new WpwxArticleAssociationExample();
        wpwxArticleAssociationExample.setWpwxUserArticleExample(wpwxUserArticleExample);

        List<WpwxArticleAssociation> wpwxArticleAssociations =
                wpwxArticleAssociationMapper.selectMyMaterials(wpwxArticleAssociationExample);

        return wpwxArticleAssociations;
    }

    @Override
    public int getUserMaterialCount(String userId) {
        List<WpwxArticleAssociation> wpwxArticleAssociations = getUserMaterials(userId);

        return wpwxArticleAssociations.size();
    }

    @Override
    public WpwxUserArticle getUserArticle(int id) {
        return wpwxUserArticleMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateUserArticle(int id, WpwxUserArticle wpwxUserArticle) {
        wpwxUserArticle.setId(id);
        return wpwxUserArticleMapper.updateByPrimaryKeySelective(wpwxUserArticle);
    }

    @Override
    public int delUserArticle(int id) {
        WpwxUserArticle wpwxUserArticle = getUserArticle(id);
        wpwxUserArticle.setDelFlag(DelFlagEnum.DELETE.getKey());
        wpwxUserArticleMapper.updateByPrimaryKeySelective(wpwxUserArticle);
        return 0;
    }
}
