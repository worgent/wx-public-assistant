package weixin.vip.service.Impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import weixin.assistant.dao.VipBusinessMapper;
import weixin.assistant.dao.VipMemberExtendMapper;
import weixin.assistant.dao.VipMemberMapper;
import weixin.assistant.dao.VipRechargeOrderMapper;
import weixin.vip.model.Page;
import weixin.vip.service.AdminService;

import java.util.List;
import java.util.Map;

/**
 * Created by worgen on 2015/9/10.
 */
@Service
public class AdminServiceImpl implements AdminService{
    private static final Logger log = Logger.getLogger("BussinessLog");


    @Autowired
    private VipMemberMapper vipMemberMapper;
    @Autowired
    private VipBusinessMapper vipBusinessMapper;
    @Autowired
    private VipRechargeOrderMapper vipRechargeOrderMapper;
    @Autowired
    private VipMemberExtendMapper vipMemberExtendMapper;




    @Override
    public Page queryForList(Map<String, Object> map) {
        Integer pageNo = (Integer) map.get("pageNo");
        Integer totalCount = vipMemberExtendMapper.totalCount(map);
        /*int totalCount = totalCountList.size();*/
        Page page = new Page();
        page.setPageNo(pageNo);
        page.setTotalCount(totalCount);
        Integer pageSize = page.getPageSize();
        Integer start = page.getStartNum();
        map.put("pageSize",pageSize);
        map.put("start",start);
        List<Map<String,Object>> mapList = vipMemberExtendMapper.queryForList(map);
        page.setList(mapList);
        return page;
    }

    @Override
    public Page vipQueryForList(Map<String, Object> map) {
        Integer pageNo = (Integer) map.get("pageNo");
        Integer totalCount = vipMemberExtendMapper.vipTotalCount(map);
        /*int totalCount = totalCountList.size();*/
        Page page = new Page();
        page.setPageNo(pageNo);
        page.setTotalCount(totalCount);
        Integer pageSize = page.getPageSize();
        Integer start = page.getStartNum();
        map.put("pageSize",pageSize);
        map.put("start",start);
        List<Map<String,Object>> mapList = vipMemberExtendMapper.vipQueryForList(map);
        page.setList(mapList);
        return page;
    }


}
