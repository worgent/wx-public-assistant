package weixin.xigua.service;

import weixin.xigua.model.WpwxPublic;

import java.util.List;

/**
 * Created by worgen on 2016/1/20.
 */
public interface WpwxPublicService {
    public WpwxPublic getPublic(int id);
    public List<WpwxPublic> getPublics(String userId);

    public int updatePublic(int id, WpwxPublic wpwxPublic);
    public int delPublic(int id);

    //获得热门公众号
    public List<WpwxPublic> getHotPublics(int pageIndex, int pageSize);

    //最新收录公众号数目
    public int getRecentUpdatePublicNum();

}
