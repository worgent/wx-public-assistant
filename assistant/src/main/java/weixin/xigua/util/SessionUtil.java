package weixin.xigua.util;

import weixin.xigua.enums.SessionTypeEnum;
import weixin.xigua.model.WpwxUser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by worgen on 2016/1/19.
 */
public class SessionUtil {

    public static WpwxUser getUser(HttpServletRequest request){
        HttpSession httpSession = request.getSession();
        Object user = httpSession.getAttribute(SessionTypeEnum.LOGIN_USER.getKey());
        if( user == null ){
            return null;
        }
        return (WpwxUser)user;
    }

    public static boolean isLogin(HttpServletRequest request){
        HttpSession httpSession = request.getSession();
        Object user = httpSession.getAttribute(SessionTypeEnum.LOGIN_USER.getKey());
        if( user == null ){
            return false;
        }
        return true;
    }
}
