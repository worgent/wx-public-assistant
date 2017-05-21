package weixin.xigua.constants;

import base.SystemGlobal;
import weixin.assistant.constants.WeixinConstant;

/**
 * Created by worgen on 2015/12/18.
 */
public class XiguaConstant {
    public static final String redirectUrl = "http://"+ WeixinConstant.domain+"/callback/%account%/authorizer_access_token.do?authUUID=%authUUID%";

    public static final String articleThumbnailPath= SystemGlobal.getPreference("xigua.articleThumbnailPath");

}
