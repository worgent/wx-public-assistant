package weixin.vip.controller;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import weixin.assistant.dao.VipMemberExtendMapper;
import weixin.assistant.dao.VipMemberMapper;
import weixin.assistant.model.VipMember;
import weixin.assistant.model.VipMemberExample;
import weixin.vip.model.Page;
import weixin.vip.service.AdminService;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by worgen on 2015/9/9.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    private static final Log log = LogFactory.getLog(AdminController.class);

    @Autowired
    private AdminService adminService;
    @Autowired
    private VipMemberExtendMapper vipMemberExtendMapper;
    @Autowired
    private VipMemberMapper vipMemberMapper;

    @RequestMapping("toIndex")
    public String toIndexPage(Model model) {

        return "vip/admin/index";
    }

    @RequestMapping("toCzSearch")
    public String toCzSearchPage() {
        return "vip/admin/cz-search";
    }

    @RequestMapping("toUserCzStatistics")
    public String toUserCzStatisticsPage() {
        return "vip/admin/user-cz-statistics";
    }

    @RequestMapping("toUserXfStatistics")
    public String toUserXfStatisticsPage() {
        return "vip/admin/user-xf-statistics";
    }

    @RequestMapping("toVipDataStatistics")
    public String toVipDataStatisticsPage() {
        return "vip/admin/vip-data-statistics";
    }

    //会员列表中 会员总数和 当天新加会员数
    @RequestMapping("toVipList")
    public String toVipListPage(Model model) {
        Map<String, Object> searchMap = new HashMap<String, Object>();
        Integer memberCount = vipMemberExtendMapper.vipTotalCount(searchMap);

        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String createTime = formatDate.format(date);
        searchMap.put("createTime",createTime);
        Integer todayCount = vipMemberExtendMapper.vipTotalCount(searchMap);

        model.addAttribute("memberCount",memberCount);
        model.addAttribute("todayCount",todayCount);
        return "vip/admin/vip-list";
    }

    @RequestMapping("toXfSearch")
    public String toXfSearchPage() {
        return "vip/admin/xf-search";
    }

    //充值查询
    @RequestMapping("czSearch")
    public String czSearch(HttpServletRequest request, Model model) throws IOException {

        Map<String, Object> searchMap = new HashMap<String, Object>();
        String vipName = request.getParameter("vipName");
        String mendian = request.getParameter("mendian");
        String vipPhone = request.getParameter("vipPhone");
        String czTime = request.getParameter("czTime");
        String czMoneyMinStr = request.getParameter("czMoneyMin");
        String czMoneyMaxStr = request.getParameter("czMoneyMax");
        String sPageNo = request.getParameter("pageNo");
        if (sPageNo == null || sPageNo.equals("")) {
            sPageNo = "1";
        }
        Integer pageNo = Integer.parseInt(sPageNo);

        int czMoneyMin;
        int czMoneyMax;
        if (czMoneyMinStr != "" || czMoneyMaxStr != "") {
            czMoneyMin = Integer.parseInt(czMoneyMinStr);
            czMoneyMax = Integer.parseInt(czMoneyMaxStr);
            searchMap.put("czMoneyMin", czMoneyMin);
            searchMap.put("czMoneyMax", czMoneyMax);
            model.addAttribute("czMoneyMin", czMoneyMin);
            model.addAttribute("czMoneyMax", czMoneyMax);

        }

        short status = 1;

        if (mendian.equals("1")) {
            model.addAttribute("mendian", mendian);
            mendian = "文化江山台球厅";
        }

        searchMap.put("status", status);
        if (vipName != null && vipName.isEmpty() == false) {
            searchMap.put("vipName", vipName);
            model.addAttribute("vipName", vipName);
        }
        if (mendian != null && !mendian.isEmpty()) {
            searchMap.put("mendian", mendian);

        }
        if (czTime != null && !czTime.isEmpty()) {
            searchMap.put("czFinishTime", czTime);
            model.addAttribute("czTime", czTime);
        }

        if (vipPhone != null && !vipPhone.isEmpty()) {
            searchMap.put("tel", vipPhone);
            model.addAttribute("vipPhone", vipPhone);
        }

        searchMap.put("pageNo", pageNo);
        log.info("println" + JSONObject.toJSONString(searchMap));
        Page page = adminService.queryForList(searchMap);

        model.addAttribute("page", page);

        return "vip/admin/cz-search";
    }

    //消费信息查询
    @RequestMapping("xfSearch")
    public String xfSearch(HttpServletRequest request,Model model) {
        Map<String, Object> searchMap = new HashMap<String, Object>();
        String vipName = request.getParameter("vipName");
        String mendian = request.getParameter("mendian");
        String vipPhone = request.getParameter("vipPhone");
        String xfTime = request.getParameter("xfTime");
        String payType = request.getParameter("payType");
        String xfMoneyMinStr = request.getParameter("xfMoneyMin");
        String xfMoneyMaxStr = request.getParameter("xfMoneyMax");
        String sPageNo = request.getParameter("pageNo");
        if (sPageNo == null || sPageNo.equals("")) {
            sPageNo = "1";
        }
        Integer pageNo = Integer.parseInt(sPageNo);
        int xfMoneyMin;
        int xfMoneyMax;
        if (xfMoneyMinStr != "" || xfMoneyMaxStr != "") {
            xfMoneyMin = Integer.parseInt(xfMoneyMinStr);
            xfMoneyMax = Integer.parseInt(xfMoneyMaxStr);
            searchMap.put("xfMoneyMin", xfMoneyMin);
            searchMap.put("xfMoneyMax", xfMoneyMax);
            model.addAttribute("xfMoneyMin", xfMoneyMin);
            model.addAttribute("xfMoneyMax", xfMoneyMax);
        }

        short status = 1;

        if (mendian.equals("1")) {
            model.addAttribute("mendian", mendian);
            mendian = "文化江山台球厅";
        }

        searchMap.put("status", status);
        if (vipName != null && vipName.isEmpty() == false) {
            searchMap.put("vipName", vipName);
            model.addAttribute("vipName", vipName);
        }
        if (mendian != null && !mendian.isEmpty()) {
            searchMap.put("mendian", mendian);
        }

        if (xfTime != null && !xfTime.isEmpty()) {
            searchMap.put("xfFinishTime", xfTime);
            model.addAttribute("xfTime", xfTime);
        }

        if (vipPhone != null && !vipPhone.isEmpty()) {
            searchMap.put("tel", vipPhone);
            model.addAttribute("vipPhone", vipPhone);
        }
        if (payType != null && !payType.isEmpty()) {
            searchMap.put("payType", payType);
            model.addAttribute("payType", payType);
        }
        searchMap.put("pageNo", pageNo);
        log.info("println" + JSONObject.toJSONString(searchMap));
        Page page = adminService.queryForList(searchMap);

        model.addAttribute("page", page);

        return "vip/admin/xf-search";
    }

    //查询会员信息
    @RequestMapping("searchVipInfo")
    public String searchVipInfo(HttpServletRequest request,Model model) throws Exception {

        Map<String, Object> searchMap = new HashMap<String, Object>();
        Map<String, Object> countMap = new HashMap<String, Object>();

        Integer memberCount = vipMemberExtendMapper.vipTotalCount(countMap);

        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String createTime = formatDate.format(date);
        countMap.put("createTime",createTime);
        Integer todayCount = vipMemberExtendMapper.vipTotalCount(countMap);



        String searchName = request.getParameter("searchName");
        Integer searchType = Integer.parseInt(request.getParameter("searchType"));

        String sPageNo = request.getParameter("pageNo");
        if (sPageNo == null || sPageNo.equals("")) {
            sPageNo = "1";
        }
        Integer pageNo = Integer.parseInt(sPageNo);
        searchMap.put("searchType",searchType);
        searchMap.put("searchName",searchName);
        searchMap.put("pageNo",pageNo);
        Page page = adminService.vipQueryForList(searchMap);

        model.addAttribute("page", page);
        //查询条件回显
        model.addAttribute("searchName", searchName);
        model.addAttribute("searchType", searchType);
        model.addAttribute("memberCount",memberCount);
        model.addAttribute("todayCount",todayCount);


        return "vip/admin/vip-list";
    }

    //修改会员信息
    @RequestMapping("updateVipInfo")
    public String updateVipInfo(HttpServletRequest request) throws Exception {

        int vipId = Integer.parseInt(request.getParameter("vipNumWin"));
        String vipName = request.getParameter("vipNameWin");
        String status = request.getParameter("vipStatusWin");
        short vipStatus = Short.parseShort(status);

        String searchName = request.getParameter("searchName");
        Integer searchType = Integer.parseInt(request.getParameter("searchType"));

        VipMember vipMember = new VipMember();
        vipMember.setName(vipName);
        vipMember.setStatus(vipStatus);

        VipMemberExample vipMemberExample = new VipMemberExample();
        vipMemberExample.createCriteria().andIdEqualTo(vipId);

        vipMemberMapper.updateByExampleSelective(vipMember, vipMemberExample);

        String sName = new String(searchName.getBytes("UTF-8"),"iso-8859-1");
        return "redirect:/admin/searchVipInfo.do?searchName="+sName+"&searchType="+searchType+"";
    }


    //删除会员 暂时未使用
    @RequestMapping("deleteVip")
    public @ResponseBody int deleteVip(HttpServletRequest request){

        int id = Integer.parseInt(request.getParameter("vipId"));
        int responseText = vipMemberMapper.deleteByPrimaryKey(id);

        return responseText;
    }

}
