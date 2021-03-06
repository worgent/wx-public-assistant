package weixin.assistant.dao;

import java.util.List;
import java.util.Map;

public interface VipMemberExtendMapper{
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table vip_member
     *
     * @mbggenerated
     */
    int incMoneyInputByExample(Map<String, Integer> paras);
    int incMoneyOutputByExample(Map<String, Integer> paras);
    List<Map<String,Object>> queryForList(Map<String,Object> czMap);
    int totalCount(Map<String,Object> czMap);

    List<Map<String,Object>> vipQueryForList(Map<String,Object> czMap);
    int vipTotalCount(Map<String,Object> czMap);
}