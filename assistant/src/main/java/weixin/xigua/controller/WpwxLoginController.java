package weixin.xigua.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import weixin.xigua.dao.WpwxUserMapper;
import weixin.xigua.enums.ActionTypeEnum;
import weixin.xigua.enums.DelFlagEnum;
import weixin.xigua.enums.SessionTypeEnum;
import weixin.xigua.model.WpwxUser;
import weixin.xigua.model.WpwxUserExample;
import weixin.xigua.util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by worgen on 2016/1/19.
 */
@Controller
public class WpwxLoginController {
    private static Logger log = Logger.getLogger("Xigualog");

    @Autowired
    private WpwxUserMapper wpwxUserMapper;

    @RequestMapping("login/user")
    public String toUserLogin(HttpServletRequest request, Model model){
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        if( wpwxUser == null ) {
            return "xigua/user/login";
        }else{
//            return "xigua/index";
            return "redirect:/user/index.do";
        }
    }

    @RequestMapping("login/ajax/user")
    public @ResponseBody JSONObject ajaxLogin(HttpServletRequest request,
                                              @RequestBody String json){
        JSONObject jsonRet = new JSONObject();
        JSONObject jsonPara = JSON.parseObject(json);
        String email = jsonPara.getString("email");
        String password = jsonPara.getString("password");
        //
        WpwxUserExample wpwxUserExample = new WpwxUserExample();
        wpwxUserExample.createCriteria().andEmailEqualTo(email).andPasswordEqualTo(password).andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey());

        List<WpwxUser> wpwxUsers = wpwxUserMapper.selectByExample(wpwxUserExample);
        if( wpwxUsers.size() != 1 ){
            jsonRet.put("Status", false);
            jsonRet.put("Message", "用户名密码错误");
            log.info(new Date().toString()+","+
                            ActionTypeEnum.LOGIN.getKey()+","+
                            "password error"+","+
                            email+","+password
            );
            return jsonRet;
        }
        WpwxUser wpwxUser = wpwxUsers.get(0);
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute(SessionTypeEnum.LOGIN_USER.getKey(), wpwxUser);
        //更新登录时间
        wpwxUser.setLastLoginTime(new Date());
        wpwxUserMapper.updateByPrimaryKeySelective(wpwxUser);
        log.info(new Date().toString()+","+
                        ActionTypeEnum.LOGIN.getKey()+","+
                        "success"+","+
                        email+","+password+","+
                        wpwxUser.getId()+","+
                        wpwxUser.getLoginName()
        );

        jsonRet.put("Status", true);
        jsonRet.put("RedirectUrl", "/user/index.do");

        return jsonRet;
    }
    @RequestMapping("logout/ajax/user")
    public @ResponseBody JSONObject ajaxLogout(HttpServletRequest request){
        JSONObject jsonRet = new JSONObject();
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        if( wpwxUser != null ) {
            log.info(new Date().toString() + "," +
                            ActionTypeEnum.LOGOUT.getKey() + "," +
                            "success" + "," +
                            wpwxUser.getId() + "," +
                            wpwxUser.getLoginName()
            );
        }
        request.getSession().invalidate();

        jsonRet.put("Status", true);
        return jsonRet;
    }
}
