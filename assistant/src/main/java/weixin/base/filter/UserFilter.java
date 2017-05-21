package weixin.base.filter;

//import cn.weili88.enums.UserStatusEnum;
//import cn.weili88.enums.UserTypeEnum;
//import cn.weili88.model.User;

import weixin.xigua.enums.SessionTypeEnum;
import weixin.xigua.model.WpwxUser;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
* User: liuwentao
* Time: 15-2-4 下午12:55
*/
public class UserFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpSession httpSession = httpServletRequest.getSession();

        WpwxUser user = (WpwxUser) httpSession.getAttribute(SessionTypeEnum.LOGIN_USER.getKey());
        if (user == null ) {
            HttpServletResponse httpServletResponse = (HttpServletResponse) response;
            httpServletResponse.sendRedirect("/login/user.do");
            return;
        }

        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

}
