package weixin.xigua.service.Impl;

import org.apache.log4j.Logger;
import org.jeewx.api.core.exception.WexinReqException;
import org.jeewx.api.wxbase.wxmedia.JwMediaAPI;
import org.jeewx.api.wxbase.wxmedia.model.WxDescription;
import org.jeewx.api.wxbase.wxmedia.model.WxMediaForMaterial;
import org.jeewx.api.wxsendmsg.JwSendMessageAPI;
import org.jeewx.api.wxsendmsg.model.SendMessageResponse;
import org.jeewx.api.wxsendmsg.model.WxArticle;
import org.jeewx.api.wxsendmsg.model.WxArticlesResponse;
import org.jeewx.api.wxsendmsg.model.WxMediaResponse;
import org.jeewx.api.wxshop.JwShopAPI;
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
import weixin.assistant.service.WeixinAuthService;
import weixin.base.file.fileUtil;
import weixin.base.html.SpiderHttpClient;
import weixin.xigua.constants.XiguaConstant;
import weixin.xigua.dao.*;
import weixin.xigua.enums.ArticleSyncStatusTypeEnum;
import weixin.xigua.enums.DelFlagEnum;
import weixin.xigua.model.*;
import weixin.xigua.service.WpwxMaterialService;
import weixin.xigua.util.FileUtil;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by worgen on 2015/12/24.
 */
@Service
public class WpwxMaterialServiceImpl implements WpwxMaterialService {
    private static Logger log = Logger.getLogger("Xigualog");

    @Autowired
    private WpwxMaterialMapper wpwxMaterialMapper;

    @Autowired
    private WpwxMaterialSyncMapper wpwxMaterialSyncMapper;
    @Autowired
    private WpwxMaterialSyncAssociationMapper wpwxMaterialSyncAssociationMapper;
    @Autowired
    private WpwxPublicMapper wpwxPublicMapper;
    @Autowired
    private WeixinAuthService weixinAuthService;



    @Override
    public int syncMaterial(int materialSyncId) throws WexinReqException{

        if( isSync(materialSyncId) == true ){
            log.error("material synced,"+materialSyncId);
            return -3;
        }
        WpwxMaterialExample wpwxMaterialExample = new WpwxMaterialExample();
        wpwxMaterialExample.createCriteria().andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey());

        WpwxMaterialSyncAssociationExample wpwxMaterialSyncAssociationExample = new WpwxMaterialSyncAssociationExample();
        wpwxMaterialSyncAssociationExample.createCriteria().andIdEqualTo(materialSyncId).
                andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey());
        wpwxMaterialSyncAssociationExample.setOrderByClause(" WPWX_MATERIAL.sequence_id asc ");
        wpwxMaterialSyncAssociationExample.setWpwxMaterialExample(wpwxMaterialExample);

        List<WpwxMaterialSyncAssociation> wpwxMaterialSyncAssociations =
                wpwxMaterialSyncAssociationMapper.selectAssociationByExample(wpwxMaterialSyncAssociationExample);

        if( wpwxMaterialSyncAssociations.size() < 1 ){
            log.error("material not exist,"+materialSyncId);
            return -4;
        }
        WpwxMaterialSyncAssociation wpwxMaterialSyncAssociation = wpwxMaterialSyncAssociations.get(0);

        return syncMaterial(wpwxMaterialSyncAssociation);
    }
    private String getThumbMediaId(String thumbnail, String accessToken){
//        String thumbnail = wpwxArticle.getThumbnail();
        if(thumbnail == null || thumbnail.isEmpty()){
            thumbnail = "http://localhost/images/article/thumbnail/640.webp.jpg";
        }
        if( FileUtil.downloadPicture(thumbnail, "baidu.jpg") != 0 ){
            return null;
        }
        String fileName = "baidu.jpg";
        String filePath = XiguaConstant.articleThumbnailPath;
//        String fileName = thumbnail.substring(thumbnail.lastIndexOf('\\')+1, thumbnail.length());
//        String filePath = thumbnail.substring(0, thumbnail.lastIndexOf('\\')+1);
        //先上传永久素材，用户删除
        WxMediaForMaterial wxMediaForMaterial = new WxMediaForMaterial();
        wxMediaForMaterial.setType("image");
        wxMediaForMaterial.setFileName(fileName);
        wxMediaForMaterial.setFilePath(filePath);
        WxDescription wxDescription = new WxDescription();
        wxDescription.setTitle("test pic");
        wxDescription.setIntroduction("test pic intro");
        wxMediaForMaterial.setWxDescription(wxDescription);
//			wxMediaForMaterial.setWxDescription("image");
//        String accessToken = weixinAuthService.getPublicAccessToken(wpwxPublic.getComponentGzhId());

        String thumbMediaId = null;
        try {
            thumbMediaId = JwMediaAPI.getMediaIdForMaterial(accessToken, wxMediaForMaterial);
        } catch (WexinReqException e) {
            e.printStackTrace();
            thumbMediaId = "fG1EyL6vIJsdAXEqEvtV8yQUGuLy4IDx6sHxTCrP06s";
        }

        return thumbMediaId;
    }
    private String getImgWxUrl(String url, String accessToken){
//        String thumbnail = wpwxArticle.getThumbnail();
        //先下载，后使用
        if(url == null || url.isEmpty()){
            return "";
        }
        String fileName = "";
        String filePath = XiguaConstant.articleThumbnailPath;
        if( url.indexOf("http") != 0 ) {
            url = "http://"+ WeixinConstant.domain + url;
        }
        if (FileUtil.downloadPicture(url, "baidu.jpg") != 0) {
            return null;
        }
        fileName = "baidu.jpg";
        filePath = XiguaConstant.articleThumbnailPath;
        String wxUrl = null;
        wxUrl = JwShopAPI.uploadImg(accessToken, filePath, fileName);

        return wxUrl;
    }
    private String changeWxImg(String content, String accessToken){
        Document doc = Jsoup.parse(content);
        doc.outputSettings(new Document.OutputSettings().prettyPrint(false));
        Elements eImgs = doc.getElementsByTag("img");
        for(Element eImg : eImgs){
            String src = eImg.attr("src");
            if(src.indexOf("mmbiz.qpic.cn") != -1)
                continue;

            String wxUrl = getImgWxUrl(src, accessToken);
            eImg.attr("src", wxUrl);
        }
        return doc.toString();
    }
    private int syncMaterial(WpwxMaterialSyncAssociation wpwxMaterialSyncAssociation) throws WexinReqException{

        int publicId = wpwxMaterialSyncAssociation.getPublicId();
        WpwxPublic wpwxPublic = wpwxMaterialSyncAssociation.getWpwxPublic();
        if( wpwxPublic == null ){
            log.error("public not exist,"+publicId);
            return -2;
        }
        //
        String accessToken = weixinAuthService.getPublicAccessToken(wpwxPublic.getComponentGzhId());
        if( accessToken == null ){
            log.error("accesstoken not exist,"+publicId);
            return -3;
        }
        List<WxArticle> wxArticles = new ArrayList<WxArticle>();
        List<WpwxMaterial> wpwxMaterials = wpwxMaterialSyncAssociation.getWpwxMaterials();
        for(WpwxMaterial wpwxMaterial : wpwxMaterials){
            WxArticle wxArticle = new WxArticle();
            wxArticle.setTitle(wpwxMaterial.getTitle());
            String thumbMediaId = getThumbMediaId(wpwxMaterial.getThumbnail(), accessToken);
            wxArticle.setThumb_media_id(thumbMediaId);
            wxArticle.setAuthor(wpwxMaterial.getAuthor());
            wxArticle.setDigest(wpwxMaterial.getDigest());
            wxArticle.setShow_cover_pic(wpwxMaterial.getShowCoverPic().toString());
            //处理图片链接问题

            wxArticle.setContent(changeWxImg(wpwxMaterial.getContent(), accessToken));
//            wxArticle.setContent(wpwxMaterial.getContent());
            wxArticle.setContent_source_url(wpwxMaterial.getContentSourceUrl());

            wxArticles.add(wxArticle);
        }
        if( wxArticles.size() <= 0 ){
            log.error("no material,"+wpwxMaterialSyncAssociation.getId());
            return -1;
        }

        WxArticlesResponse wxArticlesResponse = JwMediaAPI.uploadArticlesByMaterial(accessToken, wxArticles);

        //将返回的media_id更新到数据库中
        WpwxMaterialSync wpwxMaterialSync = (WpwxMaterialSync)wpwxMaterialSyncAssociation;
        //删除已同步素材
        String oldMediaId = wpwxMaterialSync.getMediaId();
        if( oldMediaId!=null && !oldMediaId.equals("") ){
            JwMediaAPI.deleteArticlesByMaterial(accessToken, oldMediaId);
        }
        wpwxMaterialSync.setMediaId(wxArticlesResponse.getMedia_id());
        wpwxMaterialSync.setStatus(ArticleSyncStatusTypeEnum.ALREADY_SYNC.getKey());
        wpwxMaterialSyncMapper.updateByPrimaryKeySelective(wpwxMaterialSync);

        wpwxMaterialSyncAssociation.setMediaId(wpwxMaterialSync.getMediaId());
        //删除素材
        for(WxArticle wxArticle: wxArticles){
            if( wxArticle.getThumb_media_id().equals("fG1EyL6vIJsdAXEqEvtV8yQUGuLy4IDx6sHxTCrP06s"))
                continue;
            JwMediaAPI.deleteArticlesByMaterial(accessToken, wxArticle.getThumb_media_id());
        }
        return 0;
    }

    @Override
    public boolean isSync(int materialSyncId) {
        WpwxMaterialSync wpwxMaterialSync = getMaterialSync(materialSyncId);
        if( wpwxMaterialSync != null &&
                wpwxMaterialSync.getMediaId() != null &&
                wpwxMaterialSync.getMediaId().equals("") != false ){
            return true;
        }
        return false;
    }
    @Override
    public WpwxMaterialSync getMaterialSync(int materialSyncId){
        WpwxMaterialSyncExample wpwxMaterialSyncExample = new WpwxMaterialSyncExample();
        wpwxMaterialSyncExample.createCriteria().andIdEqualTo(materialSyncId).andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey());
        List<WpwxMaterialSync> wpwxMaterialSyncs = wpwxMaterialSyncMapper.selectByExample(wpwxMaterialSyncExample);
        if( wpwxMaterialSyncs.size() < 1 ){
            return null;
        }
        return wpwxMaterialSyncs.get(0);
    }
    @Override
    public int updateSyncMaterial(int materialSyncId, WpwxMaterialSync wpwxMaterialSync){
        wpwxMaterialSync.setId(materialSyncId);
        wpwxMaterialSyncMapper.updateByPrimaryKeySelective(wpwxMaterialSync);

        return 0;
    }

    @Override
    public WpwxMaterialSyncAssociation getMaterialSyncAssociation(int materialSyncId){
        WpwxMaterialExample wpwxMaterialExample = new WpwxMaterialExample();
        wpwxMaterialExample.createCriteria().andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey());

        WpwxMaterialSyncAssociationExample wpwxMaterialSyncAssociationExample = new WpwxMaterialSyncAssociationExample();
        wpwxMaterialSyncAssociationExample.createCriteria().andIdEqualTo(materialSyncId).
                andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey());
        wpwxMaterialSyncAssociationExample.setWpwxMaterialExample(wpwxMaterialExample);

        wpwxMaterialSyncAssociationExample.setOrderByClause(" WPWX_MATERIAL.sequence_id asc ");

        List<WpwxMaterialSyncAssociation> wpwxMaterialSyncAssociations =
                wpwxMaterialSyncAssociationMapper.selectAssociationByExample(wpwxMaterialSyncAssociationExample);

        if( wpwxMaterialSyncAssociations.size() != 1 ){
            return null;
        }
        return wpwxMaterialSyncAssociations.get(0);
    }

    @Override
    public int delSyncMaterial(int materialSyncId) {
        WpwxMaterialSync wpwxMaterialSync = wpwxMaterialSyncMapper.selectByPrimaryKey(materialSyncId);
        if( wpwxMaterialSync == null ){
            return -1;
        }
        wpwxMaterialSync.setDelFlag(DelFlagEnum.DELETE.getKey());
        wpwxMaterialSyncMapper.updateByPrimaryKeySelective(wpwxMaterialSync);

        WpwxMaterial wpwxMaterial = new WpwxMaterial();
        wpwxMaterial.setDelFlag(DelFlagEnum.DELETE.getKey());
        WpwxMaterialExample wpwxMaterialExample = new WpwxMaterialExample();
        wpwxMaterialExample.createCriteria().andMaterialSyncIdEqualTo(materialSyncId);
        wpwxMaterialMapper.updateByExampleSelective(wpwxMaterial, wpwxMaterialExample);
        return 0;
    }
    @Override
    public WpwxMaterial getMaterial(int id){
        return wpwxMaterialMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateMaterial(int id, WpwxMaterial wpwxMaterial) {
        wpwxMaterial.setId(id);
        wpwxMaterialMapper.updateByPrimaryKeyWithBLOBs(wpwxMaterial);
        return 0;
    }

    @Override
    public int delMaterial(int id) {
        WpwxMaterial wpwxMaterial = getMaterial(id);
        if( wpwxMaterial == null ) {
            return -1;
        }
        wpwxMaterial.setDelFlag(DelFlagEnum.DELETE.getKey());
        wpwxMaterialMapper.updateByPrimaryKeyWithBLOBs(wpwxMaterial);
        return 0;
    }

    @Override
    public List<WpwxMaterialSyncAssociation> getUserMaterialSyncs(String userId) {


        WpwxMaterialExample wpwxMaterialExample = new WpwxMaterialExample();
        wpwxMaterialExample.createCriteria().andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey());

        WpwxMaterialSyncAssociationExample wpwxMaterialSyncAssociationExample = new WpwxMaterialSyncAssociationExample();
        wpwxMaterialSyncAssociationExample.createCriteria().andUserIdEqualTo(userId).
                andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey());
        wpwxMaterialSyncAssociationExample.setOrderByClause(" WPWX_MATERIAL.sequence_id asc,WPWX_MATERIAL_SYNC.updated_time desc ");
        wpwxMaterialSyncAssociationExample.setWpwxMaterialExample(wpwxMaterialExample);

        List<WpwxMaterialSyncAssociation> wpwxMaterialSyncAssociations =
                wpwxMaterialSyncAssociationMapper.selectAssociationByExample(wpwxMaterialSyncAssociationExample);


        return wpwxMaterialSyncAssociations;
    }

    @Override
    public List<WpwxMaterialSyncAssociation> getUserMaterialSyncs(String userId, int publicId) {
        WpwxMaterialExample wpwxMaterialExample = new WpwxMaterialExample();
        wpwxMaterialExample.createCriteria().andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey());
        //获得定时群发素材
        WpwxMaterialSyncAssociationExample wpwxMaterialSyncAssociationExample = new WpwxMaterialSyncAssociationExample();
        wpwxMaterialSyncAssociationExample.createCriteria().
                andUserIdEqualTo(userId).
                andPublicIdEqualTo(publicId).
                andScheduleTimeIsNotNull().
                andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey());
        wpwxMaterialSyncAssociationExample.setOrderByClause(" WPWX_MATERIAL.sequence_id asc,WPWX_MATERIAL_SYNC.schedule_time desc ");
        wpwxMaterialSyncAssociationExample.setWpwxMaterialExample(wpwxMaterialExample);

        List<WpwxMaterialSyncAssociation> wpwxMaterialSyncAssociations =
                wpwxMaterialSyncAssociationMapper.selectAssociationByExample(wpwxMaterialSyncAssociationExample);

        return wpwxMaterialSyncAssociations;
    }

    @Override
    public List<WpwxMaterialSyncAssociation> getScheduledMass() {
        WpwxMaterialExample wpwxMaterialExample = new WpwxMaterialExample();
        wpwxMaterialExample.createCriteria().andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey());

        //获得定时群发素材,超时15分钟不再发放，防止接口次数用尽
        WpwxMaterialSyncAssociationExample wpwxMaterialSyncAssociationExample = new WpwxMaterialSyncAssociationExample();
        wpwxMaterialSyncAssociationExample.createCriteria().andScheduleTimeIsNotNull().
                andScheduleTimeLessThanOrEqualTo(new Date()).andSendTimeIsNull().
                andScheduleTimeGreaterThan(new DateTime().minusMinutes(15).toDate()).
                andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey());
        wpwxMaterialSyncAssociationExample.setOrderByClause(" WPWX_MATERIAL.sequence_id asc ");
        wpwxMaterialSyncAssociationExample.setWpwxMaterialExample(wpwxMaterialExample);

        List<WpwxMaterialSyncAssociation> wpwxMaterialSyncAssociations =
                wpwxMaterialSyncAssociationMapper.selectAssociationByExample(wpwxMaterialSyncAssociationExample);

        return wpwxMaterialSyncAssociations;
    }

    private String getMassThumbMediaId(String thumbnail, String accessToken){
//        String thumbnail = wpwxArticle.getThumbnail();
        //先下载，后使用
        if(thumbnail == null || thumbnail.isEmpty()){
            thumbnail = "http://localhost/images/article/thumbnail/640.webp.jpg";
        }
        if( FileUtil.downloadPicture(thumbnail, "baidu.jpg") != 0 ){
            return null;
        }
        String fileName = "baidu.jpg";
        String filePath = XiguaConstant.articleThumbnailPath;
//        String fileName = thumbnail.substring(thumbnail.lastIndexOf('\\')+1, thumbnail.length());
//        String filePath = thumbnail.substring(0, thumbnail.lastIndexOf('\\')+1);
        //先上传永久素材，用户删除
//        WxMediaForMaterial wxMediaForMaterial = new WxMediaForMaterial();
//        wxMediaForMaterial.setType("image");
//        wxMediaForMaterial.setFileName(fileName);
//        wxMediaForMaterial.setFilePath(filePath);
//        WxDescription wxDescription = new WxDescription();
//        wxDescription.setTitle("test pic");
//        wxDescription.setIntroduction("test pic intro");
//        wxMediaForMaterial.setWxDescription(wxDescription);
//			wxMediaForMaterial.setWxDescription("image");
//        String accessToken = weixinAuthService.getPublicAccessToken(wpwxPublic.getComponentGzhId());

//        String thumbMediaId = null;
        WxMediaResponse wxMediaResponse = null;
        try {
            wxMediaResponse = JwSendMessageAPI.uploadMediaFile(accessToken, filePath, fileName, "image");
//            thumbMediaId = JwMediaAPI.getMediaIdForMaterial(accessToken, wxMediaForMaterial);
        } catch (WexinReqException e) {
            e.printStackTrace();
//            thumbMediaId = "fG1EyL6vIJsdAXEqEvtV8yQUGuLy4IDx6sHxTCrP06s";
        }
        if( wxMediaResponse == null ){
            return "fG1EyL6vIJsdAXEqEvtV8yQUGuLy4IDx6sHxTCrP06s";
        }
        return wxMediaResponse.getMedia_id();
    }
    @Override
    public int massSend(WpwxMaterialSyncAssociation wpwxMaterialSyncAssociation) throws WexinReqException {
        //先同步到后台，获取media id
//        if( 0 != syncMaterial(wpwxMaterialSyncAssociation) ){
//            log.error("sync error,"+wpwxMaterialSyncAssociation.getId());
//            return -1;
//        }
        String mediaId = wpwxMaterialSyncAssociation.getMediaId();
        WpwxPublic wpwxPublic = wpwxMaterialSyncAssociation.getWpwxPublic();
        Integer publicId = wpwxMaterialSyncAssociation.getPublicId();
        //群发消息
        String accessToken = weixinAuthService.getPublicAccessToken(wpwxPublic.getComponentGzhId());
        if( accessToken == null ){
            log.error("accesstoken not exist,"+publicId);
            return -3;
        }
        List<WxArticle> wxArticles = new ArrayList<WxArticle>();
        List<WpwxMaterial> wpwxMaterials = wpwxMaterialSyncAssociation.getWpwxMaterials();
        for(WpwxMaterial wpwxMaterial : wpwxMaterials){
            WxArticle wxArticle = new WxArticle();
            wxArticle.setTitle(wpwxMaterial.getTitle());
            String thumbMediaId = getMassThumbMediaId(wpwxMaterial.getThumbnail(), accessToken);
            wxArticle.setThumb_media_id(thumbMediaId);
            wxArticle.setAuthor(wpwxMaterial.getAuthor());
            wxArticle.setDigest(wpwxMaterial.getDigest());
            wxArticle.setShow_cover_pic(wpwxMaterial.getShowCoverPic().toString());
            wxArticle.setContent(changeWxImg(wpwxMaterial.getContent(), accessToken));
//            wxArticle.setContent(wpwxMaterial.getContent());
            wxArticle.setContent_source_url(wpwxMaterial.getContentSourceUrl());

            wxArticles.add(wxArticle);
        }
        if( wxArticles.size() <= 0 ){
            log.error("no material,"+wpwxMaterialSyncAssociation.getId());
            return -1;
        }
        SendMessageResponse sendMessageResponse = JwSendMessageAPI.sendMessageToGroupOrAllWithArticles(accessToken, true, null, wxArticles);
        //群发状态
        if( sendMessageResponse.getErrcode() != 0 ){
            log.error("sendMessageToGroupOrAllWithArticles error,"+wpwxMaterialSyncAssociation.getId());
            return -1;
        }
        //设置状态
        WpwxMaterialSync wpwxMaterialSync = (WpwxMaterialSync)wpwxMaterialSyncAssociation;
        wpwxMaterialSync.setSendTime(new Date());
        wpwxMaterialSyncMapper.updateByPrimaryKey(wpwxMaterialSync);
        return 0;
    }
    public static void main(String[] args){
        File file1 = new File("C:\\Users\\worgen\\Downloads\\640_21.webp");
        File file2 = new File("C:\\Users\\worgen\\Downloads\\baidu.jpg");

        System.out.println(System.getProperty("java.library.path"));

        try {

            BufferedImage im = ImageIO.read(file1);
            ImageIO.write(im, "png", file2);


        } catch (IOException e) {
            e.printStackTrace();
        }
    }



}
