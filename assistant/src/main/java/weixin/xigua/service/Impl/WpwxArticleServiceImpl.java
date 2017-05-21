package weixin.xigua.service.Impl;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import weixin.assistant.util.TimeUtil;
import weixin.base.html.SpiderHttpClient;
import weixin.xigua.dao.WpwxArticleAssociationMapper;
import weixin.xigua.dao.WpwxArticleContentMapper;
import weixin.xigua.dao.WpwxArticleMapper;
import weixin.xigua.enums.DelFlagEnum;
import weixin.xigua.enums.UserArticleTypeEnum;
import weixin.xigua.model.*;
import weixin.xigua.service.WpwxArticleService;


import java.util.List;

/**
 * Created by worgen on 2015/12/24.
 */
@Service
public class WpwxArticleServiceImpl implements WpwxArticleService {
    private static Logger log = Logger.getLogger("Xigualog");

    @Autowired
    private WpwxArticleContentMapper wpwxArticleContentMapper;
    @Autowired
    private WpwxArticleMapper wpwxArticleMapper;
    @Autowired
    private WpwxArticleAssociationMapper wpwxArticleAssociationMapper;

    @Override
    public WpwxArticleContent getArticleContent(int articleId) {
        WpwxArticleContentExample wpwxArticleContentExample = new WpwxArticleContentExample();
        wpwxArticleContentExample.createCriteria().andArticleIdEqualTo(articleId);

        List<WpwxArticleContent> wpwxArticleContents = wpwxArticleContentMapper.selectByExampleWithBLOBs(wpwxArticleContentExample);
        if( wpwxArticleContents.size() >= 1 ){
            return wpwxArticleContents.get(0);
        }

        //如果不存在，需要根据link进行抓取
        WpwxArticle wpwxArticle = wpwxArticleMapper.selectByPrimaryKey(articleId);
        if( wpwxArticle == null ){
            return null;
        }
        System.out.println(System.getProperty("java.library.path"));
        System.out.println(System.getProperty("java.class.path"));
        SpiderHttpClient spiderHttpClient = new SpiderHttpClient();
        String articleHtml = spiderHttpClient.read_html(wpwxArticle.getLink());
//        String articleHtml = HtmlClientUnit.read_html(wpwxArticle.getLink());

        Document articleDoc = Jsoup.parse(articleHtml.toString());
        Element articleContent = articleDoc.getElementById("js_content");
        String content = "";
        try {
            content = articleContent.toString().replace(
                    "data-src", "src");
        } catch (Exception e) {
            e.printStackTrace();
            log.error("error,"+e.getMessage());
            return null;
        }
        WpwxArticleContent wpwxArticleContent = new WpwxArticleContent();
        wpwxArticleContent.setArticleId(articleId);
        wpwxArticleContent.setContent(content);
        wpwxArticleContentMapper.insertSelective(wpwxArticleContent);
        //logger.debug("文章标题" + title.text());
//        LogManager.getLogger("File").debug("文章内容" + articleContent.toString());
//        article.setSendTime(sendTime.text());
//        article.setSummary(summary.text());
//        article.setShowImgUrl(img.text());
        return wpwxArticleContent;
    }

    @Override
    public WpwxArticle getArticle(int id) {
        return wpwxArticleMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateArticle(int id, WpwxArticle wpwxArticle) {
        wpwxArticle.setId(id);
        return wpwxArticleMapper.updateByPrimaryKeySelective(wpwxArticle);
    }

    @Override
    public int delArticle(int id) {
        WpwxArticle wpwxArticle = getArticle(id);
        if( wpwxArticle == null ){
            return -1;
        }
        wpwxArticle.setDelFlag(DelFlagEnum.DELETE.getKey());
        wpwxArticleMapper.updateByPrimaryKeySelective(wpwxArticle);
        return 0;
    }

    @Override
    public int getRecentUpdateArticleCount() {
        WpwxArticleExample wpwxArticleExampleUpdate = new WpwxArticleExample();
        wpwxArticleExampleUpdate.createCriteria().andCreatedTimeGreaterThanOrEqualTo(TimeUtil.getTodayBegin());
        int updateCount = wpwxArticleMapper.countByExample(wpwxArticleExampleUpdate);

        return updateCount;
    }

    @Override
    public List<WpwxArticleAssociation> getMaterialGlobals(String userId, List<String> categoryIds,
                                                           int pageIndex, int pageSize) {
        WpwxUserArticleExample wpwxUserArticleExample = new WpwxUserArticleExample();
        wpwxUserArticleExample.createCriteria().
                andUserIdEqualTo(userId).
                andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey()).
                andTypeEqualTo(UserArticleTypeEnum.MATERIAL.getKey());
        WpwxArticleAssociationExample wpwxArticleAssociationExample = new WpwxArticleAssociationExample();
        wpwxArticleAssociationExample.setOrderByClause("WPWX_ARTICLE.id desc limit "+pageSize*(pageIndex-1)+","+pageSize);
        wpwxArticleAssociationExample.createCriteria().
                andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey()).
                andCategoryIdIn(categoryIds);
        wpwxArticleAssociationExample.setWpwxUserArticleExample(wpwxUserArticleExample);
//        wpwxArticleAssociationExample.setUserId(userId);

        List<WpwxArticleAssociation> wpwxArticleAssociations = wpwxArticleAssociationMapper.selectMaterialGlobals(wpwxArticleAssociationExample);

        return wpwxArticleAssociations;
    }

}
