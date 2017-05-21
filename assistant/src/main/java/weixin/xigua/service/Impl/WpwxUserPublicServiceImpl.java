package weixin.xigua.service.Impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import weixin.xigua.dao.WpwxUserPublicAssociationMapper;
import weixin.xigua.dao.WpwxUserPublicMapper;
import weixin.xigua.enums.ActionTypeEnum;
import weixin.xigua.enums.DelFlagEnum;
import weixin.xigua.enums.UserPublicTypeEnum;
import weixin.xigua.model.*;
import weixin.xigua.service.WpwxUserPublicService;

import java.util.Date;
import java.util.List;

/**
 * Created by worgen on 2015/12/23.
 */
@Service
public class WpwxUserPublicServiceImpl implements WpwxUserPublicService {
    private static Logger log = Logger.getLogger("Xigualog");

    @Autowired
    private WpwxUserPublicMapper wpwxUserPublicMapper;
    @Autowired
    private WpwxUserPublicAssociationMapper wpwxUserPublicAssociationMapper;
    @Override
    public WpwxUserPublic bindUserPublic(String userId, int publicId) {
        WpwxUserPublic wpwxUserPublic = getUserPublic(userId, publicId);
        if( wpwxUserPublic == null ){
            wpwxUserPublic = new WpwxUserPublic();
            wpwxUserPublic.setUserId(userId);
            wpwxUserPublic.setPublicId(publicId);
            wpwxUserPublic.setType(UserPublicTypeEnum.MANAGE.getKey());
            wpwxUserPublic.setDelFlag(DelFlagEnum.NORMAL.getKey());
            wpwxUserPublicMapper.insertSelective(wpwxUserPublic);
        }else{
            wpwxUserPublic.setDelFlag(DelFlagEnum.NORMAL.getKey());
            wpwxUserPublicMapper.updateByPrimaryKeySelective(wpwxUserPublic);
        }
        log.info(new Date().toString() + "," +
                        ActionTypeEnum.BIND_PUBLIC.getKey() + "," +
                        "success,0" + "," +
                        userId + "," +
                        publicId
        );
        return wpwxUserPublic;
    }

    private WpwxUserPublic getUserPublic(String userId, int publicId){
        WpwxUserPublicExample wpwxUserPublicExample = new WpwxUserPublicExample();
        wpwxUserPublicExample.createCriteria().andUserIdEqualTo(userId).andPublicIdEqualTo(publicId);
        List<WpwxUserPublic> wpwxUserPublics = wpwxUserPublicMapper.selectByExample(wpwxUserPublicExample);

        if( wpwxUserPublics.size() == 0 ){
            return null;
        }
        return wpwxUserPublics.get(0);
    }

    @Override
    public int unbindUserPublic(String userId, int publicId) {
        WpwxUserPublic wpwxUserPublic = getUserPublic(userId, publicId);

        if( wpwxUserPublic == null ){
            return -1;
        }
        wpwxUserPublic.setDelFlag(DelFlagEnum.DELETE.getKey());
        wpwxUserPublicMapper.updateByPrimaryKeySelective(wpwxUserPublic);

        return 0;
    }

    @Override
    public boolean userPublicBind(String userId, int publicId) {
        WpwxUserPublicExample wpwxUserPublicExample = new WpwxUserPublicExample();
        wpwxUserPublicExample.createCriteria().andUserIdEqualTo(userId).
                andPublicIdEqualTo(publicId).andTypeEqualTo(UserPublicTypeEnum.MANAGE.getKey()).
                andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey());
        return wpwxUserPublicMapper.countByExample(wpwxUserPublicExample) > 0;
    }

    @Override
    public List<WpwxUserPublic> getUserPublics(String userId) {
        WpwxUserPublicExample wpwxUserPublicExample = new WpwxUserPublicExample();
        wpwxUserPublicExample.createCriteria().
                andUserIdEqualTo(userId).
                andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey());
        List<WpwxUserPublic> wpwxUserPublics = wpwxUserPublicMapper.selectByExample(wpwxUserPublicExample);
        return wpwxUserPublics;
    }
    @Override
    public List<WpwxUserPublicAssociation> getUserPublicAssociations(String userId){
        WpwxPublicExample wpwxPublicExample = new WpwxPublicExample();
        wpwxPublicExample.createCriteria().andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey());
        WpwxUserPublicAssociationExample wpwxUserPublicAssociationExample = new WpwxUserPublicAssociationExample();
        wpwxUserPublicAssociationExample.createCriteria().
                andUserIdEqualTo(userId).
                andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey());
        wpwxUserPublicAssociationExample.setWpwxPublicExample(wpwxPublicExample);

        List<WpwxUserPublicAssociation> wpwxUserPublicAssociations = wpwxUserPublicAssociationMapper.selectAssociationsByExample(wpwxUserPublicAssociationExample);
        return wpwxUserPublicAssociations;
    }

}
