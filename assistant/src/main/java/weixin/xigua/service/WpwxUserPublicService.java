package weixin.xigua.service;

import weixin.xigua.model.WpwxUserPublic;
import weixin.xigua.model.WpwxUserPublicAssociation;

import java.util.List;

/**
 * Created by worgen on 2015/12/23.
 */
public interface WpwxUserPublicService {
    //绑定user，public
    public WpwxUserPublic bindUserPublic(String userId, int publicId);
    public int unbindUserPublic(String userId, int publicId);
    //判断user，public关系
    public boolean userPublicBind(String userId, int publicId);

    //查询用户公众号
    public List<WpwxUserPublic> getUserPublics(String userId);
    public List<WpwxUserPublicAssociation> getUserPublicAssociations(String userId);
}
