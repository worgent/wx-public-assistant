package weixin.vip.service;

import weixin.vip.model.Page;

import java.util.Map;

/**
 * Created by worgen on 2015/9/10.
 */
public interface AdminService {


    /**
     *充值，消费查询
     * @param map
     * @return
     */
    public Page queryForList(Map<String, Object> map);

    /**
     * 会员信息 查询
     * @param map
     * @return
     */
    public Page vipQueryForList(Map<String, Object> map);




}
