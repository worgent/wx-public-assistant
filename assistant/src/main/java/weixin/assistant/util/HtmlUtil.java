package weixin.assistant.util;

/**
 * Created by worgen on 2016/2/17.
 */
public class HtmlUtil {

    public static String htmlencode(String str)
    {
        String s = "";
        if (str.length() == 0) return "";
        s = str.replace("&", "&amp;");
        s = s.replace("<", "&lt;");
        s = s.replace(">", "&gt;");
        s = s.replace(" ", "&nbsp;");
        s = s.replace("\'", "&#39;");
        s = s.replace("\"", "&quot;");
        //s = s.replace(/\n", "<br>");
        return s;
    }

    public static String htmldecode(String str)
    {
        String s = "";
        if (str.length() == 0) return "";
        s = str.replace("&amp;", "&");
        s = s.replace("&lt;", "<");
        s = s.replace("&gt;", ">");
        s = s.replace("&nbsp;", " ");
//        s = s.replace("&#39;", "\'");
//        s = s.replace("&quot;", "\"");
        //s = s.replace(/<br>"g, "\n");
        return s;
    }
}
