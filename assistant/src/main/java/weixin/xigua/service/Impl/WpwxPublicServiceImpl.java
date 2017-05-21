package weixin.xigua.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import weixin.assistant.util.TimeUtil;
import weixin.xigua.dao.WpwxPublicMapper;
import weixin.xigua.model.WpwxPublic;
import weixin.xigua.model.WpwxPublicExample;
import weixin.xigua.service.WpwxPublicService;

import java.util.List;

/**
 * Created by worgen on 2016/1/20.
 */
@Service
public class WpwxPublicServiceImpl implements WpwxPublicService{
    @Autowired
    private WpwxPublicMapper wpwxPublicMapper;

    @Override
    public WpwxPublic getPublic(int id) {
        return wpwxPublicMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<WpwxPublic> getPublics(String userId) {
        return null;
    }


    @Override
    public int updatePublic(int id, WpwxPublic wpwxPublic) {
        return 0;
    }

    @Override
    public int delPublic(int id) {
        return 0;
    }

    @Override
    public List<WpwxPublic> getHotPublics(int pageIndex, int pageSize) {
        WpwxPublicExample wpwxPublicExample = new WpwxPublicExample();
        wpwxPublicExample.setOrderByClause("id limit "+pageSize*(pageIndex-1)+","+pageSize);
        List<WpwxPublic> wpwxPublics = wpwxPublicMapper.selectByExampleWithBLOBs(wpwxPublicExample);
        return wpwxPublics;
    }

    @Override
    public int getRecentUpdatePublicNum() {
        WpwxPublicExample wpwxPublicExampleUpdate = new WpwxPublicExample();
        wpwxPublicExampleUpdate.createCriteria().andCreatedTimeGreaterThanOrEqualTo(TimeUtil.getTodayBegin());
        return wpwxPublicMapper.countByExample(wpwxPublicExampleUpdate);
    }
}
