package weixin.xigua.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by worgen on 2015/12/18.
 */
@Controller
@RequestMapping("/ue")
public class UeController {
    private static Logger log = Logger.getLogger("Xigualog");

//    @RequestMapping("/dealUeRequest")
//    public @ResponseBody JSONObject dealUeRequest(HttpServletRequest request){
//
//        return "";
//    }
//    //同步文章
//    @RequestMapping("/ajax/weixin/sync_material")
//    public @ResponseBody JSONObject ajaxWeixinSyncMaterial(HttpServletRequest request,
//                                                           @RequestParam(required = true) int materialSyncId){
//        JSONObject jsonRet = new JSONObject();
//
//        try {
//            if( materialService.syncMaterial(materialSyncId) != 0 ){
//                jsonRet.put("Status", false);
//                return jsonRet;
//            }
//        } catch (WexinReqException e) {
//            e.printStackTrace();
//        }
//        jsonRet.put("Status", true);
//
//        return jsonRet;
//    }
}
