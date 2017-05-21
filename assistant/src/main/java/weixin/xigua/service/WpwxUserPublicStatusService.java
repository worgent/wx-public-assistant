package weixin.xigua.service;

import weixin.xigua.model.WpwxUserPublicStatus;

/**
 * Created by worgen on 2016/1/20.
 */
public interface WpwxUserPublicStatusService {

    //查询status
    public WpwxUserPublicStatus getWpwxUserPublicStatus(String authUUID);

    //保存状态
    public int saveWpwxUserPublicStatus(String authUUID, int status, int userPublicId);

}
