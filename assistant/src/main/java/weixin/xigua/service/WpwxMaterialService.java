package weixin.xigua.service;

import org.jeewx.api.core.exception.WexinReqException;
import org.jeewx.api.wxsendmsg.model.WxArticle;
import org.jeewx.api.wxsendmsg.model.WxArticlesResponse;
import weixin.xigua.model.WpwxArticle;
import weixin.xigua.model.WpwxMaterial;
import weixin.xigua.model.WpwxMaterialSync;
import weixin.xigua.model.WpwxMaterialSyncAssociation;

import java.util.List;

/**
 * Created by worgen on 2015/12/24.
 */
public interface WpwxMaterialService {

        //同步素材到微信后台
        public int syncMaterial(int materialSyncId) throws WexinReqException;
        //是否已同步到微信后台
        public boolean isSync(int materialSyncId);
        //查询待同步素材
        public WpwxMaterialSync getMaterialSync(int materialSyncId);
        public int updateSyncMaterial(int materialSyncId, WpwxMaterialSync wpwxMaterialSync);
        public int delSyncMaterial(int materialSyncId);

        public WpwxMaterialSyncAssociation getMaterialSyncAssociation(int materialSyncId);
        //查询用户待同步素材
        public List<WpwxMaterialSyncAssociation> getUserMaterialSyncs(String userId);
        public List<WpwxMaterialSyncAssociation> getUserMaterialSyncs(String userId, int publicId);
        //获得已定时但还未群发的同步素材
        public List<WpwxMaterialSyncAssociation> getScheduledMass();

        //更新素材
        public WpwxMaterial getMaterial(int id);
        public int updateMaterial(int id, WpwxMaterial wpwxMaterial);
        public int delMaterial(int id);



        //群发接口
        public int massSend(WpwxMaterialSyncAssociation wpwxMaterialSyncAssociation) throws WexinReqException;

}
