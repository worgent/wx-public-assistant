package weixin.xigua.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import weixin.xigua.dao.WpwxDictMapper;
import weixin.xigua.enums.DelFlagEnum;
import weixin.xigua.model.WpwxDict;
import weixin.xigua.service.WpwxDictService;

/**
 * Created by worgen on 2016/1/21.
 */
@Service
public class WpwxDictServiceImpl implements WpwxDictService{
    @Autowired
    private WpwxDictMapper wpwxDictMapper;

    @Override
    public WpwxDict getDict(String id) {
        return wpwxDictMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateDict(String id, WpwxDict wpwxDict) {
        wpwxDict.setId(id);
        wpwxDictMapper.updateByPrimaryKeySelective(wpwxDict);
        return 0;
    }

    @Override
    public int delDict(String id) {
        WpwxDict wpwxDict = new WpwxDict();
        wpwxDict.setDelFlag(DelFlagEnum.DELETE.getKey());
        wpwxDictMapper.updateByPrimaryKeySelective(wpwxDict);
        return 0;
    }
}
