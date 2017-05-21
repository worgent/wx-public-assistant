package weixin.xigua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import weixin.assistant.constants.WeixinConstant;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by worgen on 2016/1/18.
 */
@Controller
@RequestMapping("/test")
public class TestController {

    @RequestMapping("testConstants")
    public String testConstants(HttpServletRequest request, Model model){
        System.out.println(System.getProperty("java.library.path"));
        model.addAttribute("message", WeixinConstant.componentAppID + ","+WeixinConstant.componentAppSecret);
        return "xigua/message";
    }
}
