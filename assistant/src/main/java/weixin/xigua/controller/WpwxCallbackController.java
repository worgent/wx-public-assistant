package weixin.xigua.controller;

import com.alibaba.fastjson.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import weixin.assistant.model.WeixinGzh;
import weixin.assistant.service.WeixinAuthService;
import weixin.xigua.dao.WpwxPublicMapper;
import weixin.xigua.enums.UserPublicStatusEnum;
import weixin.xigua.model.WpwxPublic;
import weixin.xigua.model.WpwxPublicExample;
import weixin.xigua.model.WpwxUserPublic;
import weixin.xigua.model.WpwxUserPublicStatus;
import weixin.xigua.service.WpwxUserPublicService;
import weixin.xigua.service.WpwxUserPublicStatusService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by worgen on 2016/1/19.
 */
@Controller
public class WpwxCallbackController {
    private static Logger log = Logger.getLogger("Xigualog");
    @Autowired
    private WeixinAuthService weixinAuthService;
    @Autowired
    private WpwxPublicMapper wpwxPublicMapper;
    @Autowired
    private WpwxUserPublicService wpwxUserPublicService;
    @Autowired
    private WpwxUserPublicStatusService wpwxUserPublicStatusService;

    @RequestMapping("callback/*/authorizer_access_token")
    public String authorizeAccessToken(@RequestParam(required = true) String authUUID,
                                       HttpServletRequest request,Model model) {
        String path = request.getServletPath();
        String userId = path.replace("/callback/", "").replace("/authorizer_access_token.do", "");
        if( userId == null || userId.isEmpty()){
            userId = "0";
        }
        String authCode = request.getParameter("auth_code");
        long expiresIn = Long.parseLong(request.getParameter("expires_in"));
        int ret = weixinAuthService.authorizeGzh(authCode, expiresIn);
        log.debug("authorizeAccessToken,"+userId+","+authCode+","+expiresIn+","+ret);
        //已授权
        if( ret < 0 ){
            log.error("authorize error,"+ret+","+userId+","+authCode+","+expiresIn);
            //失败
            wpwxUserPublicStatusService.saveWpwxUserPublicStatus(authUUID, UserPublicStatusEnum.FAIL.getKey(), 0);
        }else {
            //授权成功
            //查询公众号信息，将信息传递到wpwx_public
            //查询公众号信息是否已存在，alias，origin_id
            WeixinGzh weixinGzh = weixinAuthService.getWeixinGzh(ret);

            WpwxPublicExample wpwxPublicExample = new WpwxPublicExample();
            wpwxPublicExample.createCriteria().andAliasEqualTo(weixinGzh.getAlias());
            List<WpwxPublic> wpwxPublics = wpwxPublicMapper.selectByExampleWithBLOBs(wpwxPublicExample);
            if( wpwxPublics.size() > 1 ){
                log.error("authorize error,alias size error"+wpwxPublics.size()+","+userId+","+weixinGzh.getAlias());
                wpwxUserPublicStatusService.saveWpwxUserPublicStatus(authUUID, UserPublicStatusEnum.FAIL.getKey(), 0);
            }else if(wpwxPublics.size() == 1){
                WpwxPublic wpwxPublic = wpwxPublics.get(0);
                if( true == wpwxUserPublicService.userPublicBind(userId, wpwxPublic.getId()) ){
                    wpwxUserPublicStatusService.saveWpwxUserPublicStatus(authUUID, UserPublicStatusEnum.FAIL.getKey(), 0);
                    log.error("already bind,"+userId+","+wpwxPublic.getId());
                    return "call_back/authorizer_access_token";
                }

                wpwxPublic.setComponentGzhId(weixinGzh.getId());
                wpwxPublic.setAlias(weixinGzh.getAlias());
                wpwxPublic.setName(weixinGzh.getName());
                wpwxPublic.setHeadImg(weixinGzh.getHeadImg());
                wpwxPublic.setQrcodeUrl(weixinGzh.getQrcodeUrl());

                wpwxPublicMapper.updateByPrimaryKeyWithBLOBs(wpwxPublic);

                WpwxUserPublic wpwxUserPublic = wpwxUserPublicService.bindUserPublic(userId, wpwxPublic.getId());
                wpwxUserPublicStatusService.saveWpwxUserPublicStatus(authUUID,
                        UserPublicStatusEnum.SUCCESS.getKey(),
                        wpwxUserPublic.getId());

            }else{
                WpwxPublic wpwxPublic = new WpwxPublic();
                wpwxPublic.setComponentGzhId(weixinGzh.getId());
                wpwxPublic.setAlias(weixinGzh.getAlias());
                wpwxPublic.setName(weixinGzh.getName());
                wpwxPublic.setHeadImg(weixinGzh.getHeadImg());
                wpwxPublic.setQrcodeUrl(weixinGzh.getQrcodeUrl());
                wpwxPublicMapper.insertSelective(wpwxPublic);

                WpwxUserPublic wpwxUserPublic = wpwxUserPublicService.bindUserPublic(userId, wpwxPublic.getId());
                wpwxUserPublicStatusService.saveWpwxUserPublicStatus(authUUID,
                        UserPublicStatusEnum.SUCCESS.getKey(),
                        wpwxUserPublic.getId());
            }
        }
        return "call_back/authorizer_access_token";
    }

    @RequestMapping("ajax/CheckWXLoginStatus")
    public @ResponseBody JSONObject ajaxCheckWXLoginStatus(@RequestParam(required = true) String authUUID,
                                                           HttpServletRequest request){
        JSONObject jsonRet = new JSONObject();
        WpwxUserPublicStatus wpwxUserPublicStatus = wpwxUserPublicStatusService.getWpwxUserPublicStatus(authUUID);
        if( wpwxUserPublicStatus == null ){
            jsonRet.put("Status", false);
        }else{
            jsonRet.put("Status", true);
            jsonRet.put("Detail", wpwxUserPublicStatus.getStatus());
        }

        return jsonRet;
    }
}
