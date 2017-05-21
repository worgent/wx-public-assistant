package weixin.xigua.service.Impl;

import org.apache.log4j.Logger;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import weixin.assistant.service.WeixinAuthService;
import weixin.xigua.dao.*;
import weixin.xigua.dao.WpwxPublicArticleMapper;
import weixin.xigua.enums.DelFlagEnum;
import weixin.xigua.model.*;
import weixin.xigua.service.WpwxArticleService;
import weixin.xigua.service.WpwxPublicArticleService;

import java.util.Date;
import java.util.List;

/**
 * Created by worgen on 2015/12/24.
 */
@Service
public class WpwxPublicArticleServiceImpl implements WpwxPublicArticleService {
    private static Logger log = Logger.getLogger("Xigualog");

    @Autowired
    private WpwxPublicArticleAssociationMapper wpwxPublicArticleAssociationMapper;
    @Autowired
    private WpwxPublicArticleMapper wpwxPublicArticleMapper;
    @Autowired
    private WpwxUserArticleMapper wpwxUserArticleMapper;
    @Autowired
    private WpwxArticleMapper wpwxArticleMapper;
    @Autowired
    private WpwxArticleContentMapper wpwxArticleContentMapper;
    @Autowired
    private WpwxMaterialMapper wpwxMaterialMapper;
    @Autowired
    private WpwxMaterialSyncMapper wpwxMaterialSyncMapper;
    @Autowired
    private WpwxPublicMapper wpwxPublicMapper;
    @Autowired
    private WpwxArticleService wpwxArticleService;
    @Autowired
    private WeixinAuthService weixinAuthService;

    @Override
    public int addSyncMaterial(String userId, List<Integer> publicIds, List<Integer> userArticleIds){
        for(Integer publicId : publicIds){
            WpwxMaterialSync wpwxMaterialSync = new WpwxMaterialSync();
            wpwxMaterialSync.setDelFlag(DelFlagEnum.NORMAL.getKey());
            wpwxMaterialSync.setUserId(userId);
            wpwxMaterialSync.setPublicId(publicId);
            wpwxMaterialSync.setCreatedTime(new Date());
            wpwxMaterialSync.setUpdatedTime(new Date());
            wpwxMaterialSyncMapper.insertSelective(wpwxMaterialSync);

            int index = 0;
            for(Integer userArticleId : userArticleIds){
                WpwxUserArticle wpwxUserArticle = wpwxUserArticleMapper.selectByPrimaryKey(userArticleId);
                if( wpwxUserArticle == null ){
                    log.error("wpwxUserArticle null,"+userArticleId);
                    continue;
                }
                addSyncMaterial(publicId, wpwxUserArticle.getArticleId(), index, wpwxMaterialSync.getId());
                index++;
            }
        }
        return 0;
    }

    @Override
    public int addSyncMaterial(WpwxMaterial wpwxMaterial) {
        wpwxMaterialMapper.insertSelective(wpwxMaterial);
        return 0;
    }


    private int addSyncMaterial(int publicId, int articleId, int sequenceId, int wpwxMaterialSyncId) {
        WpwxArticle wpwxArticle = wpwxArticleMapper.selectByPrimaryKey(articleId);
        if( wpwxArticle == null ){
            log.error("article null,"+articleId);
            return -1;
        }
        WpwxPublic wpwxPublic = wpwxPublicMapper.selectByPrimaryKey(publicId);
        if( wpwxArticle == null ){
            log.error("article null,"+articleId);
            return -1;
        }
        WpwxArticleContent wpwxArticleContent = wpwxArticleService.getArticleContent(articleId);
        if( wpwxArticleContent == null ){
            log.error("article content null,"+articleId);
            return -2;
        }

        //处理缩略图thumbnail,全路径
//        String thumbnail = wpwxArticle.getThumbnail();
//        String fileName = thumbnail.substring(thumbnail.lastIndexOf('\\')+1, thumbnail.length());
//        String filePath = thumbnail.substring(0, thumbnail.lastIndexOf('\\')+1);
//        //先上传永久素材，用户删除
//        WxMediaForMaterial wxMediaForMaterial = new WxMediaForMaterial();
//        wxMediaForMaterial.setType("image");
//        wxMediaForMaterial.setFileName(fileName);
//        wxMediaForMaterial.setFilePath(filePath);
//        WxDescription wxDescription = new WxDescription();
//        wxDescription.setTitle("test pic");
//        wxDescription.setIntroduction("test pic intro");
//        wxMediaForMaterial.setWxDescription(wxDescription);
////			wxMediaForMaterial.setWxDescription("image");
//        String accessToken = weixinAuthService.getPublicAccessToken(wpwxPublic.getComponentGzhId());
//
//        String thumbMediaId = null;
//        try {
//            thumbMediaId = JwMediaAPI.getMediaIdForMaterial(accessToken, wxMediaForMaterial);
//        } catch (WexinReqException e) {
//            e.printStackTrace();
//            thumbMediaId = "fG1EyL6vIJsdAXEqEvtV8yQUGuLy4IDx6sHxTCrP06s";
//        }
//        System.out.println();

        WpwxMaterial wpwxMaterial = new WpwxMaterial();
        wpwxMaterial.setPublicId(publicId);
        wpwxMaterial.setMaterialSyncId(wpwxMaterialSyncId);
        wpwxMaterial.setSequenceId(sequenceId);
        wpwxMaterial.setOriginArticleId(articleId);
        wpwxMaterial.setLink(wpwxArticle.getLink());
        wpwxMaterial.setTitle(wpwxArticle.getTitle());
        wpwxMaterial.setAuthor("");
        wpwxMaterial.setDigest(wpwxArticle.getSummary());
        wpwxMaterial.setShowCoverPic(0);
        wpwxMaterial.setContent(wpwxArticleContent.getContent());
        wpwxMaterial.setThumbnail(wpwxArticle.getThumbnail());
//        wpwxMaterial.setThumbMediaId(thumbMediaId);
        wpwxMaterial.setDelFlag(DelFlagEnum.NORMAL.getKey());
        wpwxMaterial.setCreatedTime(new Date());
        wpwxMaterial.setUpdatedTime(new Date());

        wpwxMaterialMapper.insertSelective(wpwxMaterial);
        return 0;
    }

    @Override
    public int delSyncMaterial(int materialId) {
        wpwxMaterialMapper.deleteByPrimaryKey(materialId);

        return 0;
    }

//    @Override
//    public boolean isSyncMaterial(int publicId, int articleId) {
//        return getSyncMaterial(publicId, articleId) != null;
//    }

    @Override
    public WpwxMaterial getSyncMaterial(int materialId) {

        return wpwxMaterialMapper.selectByPrimaryKey(materialId);

    }

    @Override
    public List<WpwxPublicArticleAssociation> getPublishArticles(int publicId) {
        WpwxPublicArticleAssociationExample wpwxPublicArticleAssociationExample = new WpwxPublicArticleAssociationExample();
        wpwxPublicArticleAssociationExample.createCriteria().andPublicIdEqualTo(publicId);
        WpwxArticleExample wpwxArticleExample = new WpwxArticleExample();
        wpwxArticleExample.createCriteria().andPublishTimeGreaterThanOrEqualTo(new DateTime().minusDays(15).toDate());
        wpwxPublicArticleAssociationExample.setWpwxArticleExample(wpwxArticleExample);
        List<WpwxPublicArticleAssociation> wpwxPublicArticleAssociations =
                wpwxPublicArticleAssociationMapper.selectAssociationByExample(wpwxPublicArticleAssociationExample);

        return wpwxPublicArticleAssociations;
    }
}
