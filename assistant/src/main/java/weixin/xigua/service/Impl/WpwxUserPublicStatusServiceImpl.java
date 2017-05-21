package weixin.xigua.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import weixin.xigua.dao.WpwxUserPublicStatusMapper;
import weixin.xigua.model.WpwxUserPublicStatus;
import weixin.xigua.model.WpwxUserPublicStatusExample;
import weixin.xigua.service.WpwxUserPublicStatusService;

import java.util.Date;
import java.util.List;

/**
 * Created by worgen on 2016/1/20.
 */
@Service
public class WpwxUserPublicStatusServiceImpl implements WpwxUserPublicStatusService {
    @Autowired
    private WpwxUserPublicStatusMapper wpwxUserPublicStatusMapper;

    @Override
    public WpwxUserPublicStatus getWpwxUserPublicStatus(String authUUID) {
        WpwxUserPublicStatusExample wpwxUserPublicStatusExample = new WpwxUserPublicStatusExample();
        wpwxUserPublicStatusExample.createCriteria().andAuthUuidEqualTo(authUUID);
        List<WpwxUserPublicStatus> wpwxUserPublicStatuss = wpwxUserPublicStatusMapper.selectByExample(wpwxUserPublicStatusExample);

        if( wpwxUserPublicStatuss.size() != 1 ){
            return null;
        }

        return wpwxUserPublicStatuss.get(0);
    }

    @Override
    public int saveWpwxUserPublicStatus(String authUUID, int status, int userPublicId) {
        WpwxUserPublicStatus wpwxUserPublicStatus = new WpwxUserPublicStatus();
        wpwxUserPublicStatus.setAuthUuid(authUUID);
        wpwxUserPublicStatus.setStatus(status);
        wpwxUserPublicStatus.setCreatedTime(new Date());
        wpwxUserPublicStatus.setUpdatedTime(new Date());
        wpwxUserPublicStatus.setUserPublicId(userPublicId);

        wpwxUserPublicStatusMapper.insertSelective(wpwxUserPublicStatus);
        return 0;
    }
}
