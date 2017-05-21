package weixin.xigua.service;

import weixin.xigua.model.WpwxDict;

/**
 * Created by worgen on 2015/12/24.
 */
public interface WpwxDictService {

    public WpwxDict getDict(String id);
    public int updateDict(String id, WpwxDict wpwxDict);
    public int delDict(String id);
}
