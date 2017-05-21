package weixin.xigua.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.log4j.Logger;
import org.jeewx.api.core.exception.WexinReqException;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import weixin.assistant.service.WeixinAuthService;
import weixin.assistant.util.HtmlUtil;
import weixin.assistant.util.RequestUtil;
import weixin.assistant.util.TimeUtil;
import weixin.xigua.constants.XiguaConstant;
import weixin.xigua.dao.*;
import weixin.xigua.enums.*;
import weixin.xigua.model.*;
import weixin.xigua.service.*;
import weixin.xigua.util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by worgen on 2015/12/18.
 */
@Controller
@RequestMapping("/user")
public class XiguaController {
    private static Logger log = Logger.getLogger("Xigualog");

    @Autowired
    private WpwxDictMapper wpwxDictMapper;

    @Autowired
    private WpwxArticleWidgetService wpwxArticleWidgetService;
    @Autowired
    private WpwxArticleTemplateService wpwxArticleTemplateService;
    @Autowired
    private WpwxArticleService wpwxArticleService;
    @Autowired
    private WpwxPublicService wpwxPublicService;
    @Autowired
    private WeixinAuthService weixinAuthService;
    @Autowired
    private WpwxUserPublicService wpwxUserPublicService;
    @Autowired
    private WpwxUserArticleService wpwxUserArticleService;
    @Autowired
    private WpwxPublicArticleService wpwxPublicArticleService;
    @Autowired
    private WpwxMaterialService wpwxMaterialService;


    @RequestMapping("/index")
    public String index(HttpServletRequest request, Model model){
        return "/xigua/index";
    }
    @RequestMapping("/xigua_editor")
    public String articleEditor(HttpServletRequest request, @RequestParam(required = true) Integer mode
                                ){
        return "/xigua/xigua_editor";
    }

    @RequestMapping("/dashBoard")
    public String dashBoard(HttpServletRequest request, Model model){
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();

        //我收集素材数目
        int myMaterialCount = wpwxUserArticleService.getUserMaterialCount(userId);
        //最新收录文章数,统计一天内的
         int articleUpdateCount = wpwxArticleService.getRecentUpdateArticleCount();
        //最新收录公众号数，统计一天内
        int wpwxPublicsUpdateCount = wpwxPublicService.getRecentUpdatePublicNum();

        model.addAttribute("wpwxUser", wpwxUser);
        model.addAttribute("myMaterialCount", myMaterialCount);
        model.addAttribute("articleUpdateCount", articleUpdateCount);
        model.addAttribute("wpwxPublicsUpdateCount", wpwxPublicsUpdateCount);

        return "xigua/ajax/xiguaji/dashboard";
    }
    @RequestMapping("/material_global")
    public String materialGlobal(HttpServletRequest request, Model model){
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();
        //标签列表
        WpwxDictExample wpwxDictExample = new WpwxDictExample();
        wpwxDictExample.createCriteria().andTypeEqualTo(DictTypeEnum.TAG_CATEGORY.getKey()).andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey());
        List<WpwxDict> wpwxDicts = wpwxDictMapper.selectByExample(wpwxDictExample);
        //我关注的标签，新建关系表

//        //对应标签文章分页,条件包括文章类型，图，文，视频等；时间段，
        String categoryId = "3";//房产家居
        List<String> categoryIds = new ArrayList<String>();
        String[] scategoryIds = categoryId.split(",");
        for(String s : scategoryIds){
            categoryIds.add(s);
        }

        List<WpwxArticleAssociation> wpwxArticleAssociations =
                wpwxArticleService.getMaterialGlobals(userId, categoryIds, 1, 10);
        //页码
        model.addAttribute("wpwxDicts", wpwxDicts);
        model.addAttribute("selectCategory", categoryId);
        model.addAttribute("wpwxArticleAssociations", wpwxArticleAssociations);

        return "xigua/ajax/xiguaji/material_global";
    }
    @RequestMapping("ajaxGetArticles")
    public @ResponseBody
    List<WpwxArticle> ajaxGetArticles(
            @RequestParam int page,
            @RequestParam int type,
            @RequestParam int timeType
    ){
        List<WpwxArticle> wpwxArticles = new ArrayList<WpwxArticle>();

        return wpwxArticles;
    }
    @RequestMapping("/my_material")
    public String myMaterial(HttpServletRequest request, Model model){
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();
        //查询我的素材
        //素材文章数目
        List<WpwxArticleAssociation> wpwxArticleAssociations =
                wpwxUserArticleService.getUserMaterials(userId);

        model.addAttribute("wpwxArticleAssociations", wpwxArticleAssociations);
        //关注素材
        return "xigua/ajax/xiguaji/my_material";
    }
    //删素材
    @RequestMapping("/ajax/deleteMaterial")
    public @ResponseBody JSONObject ajaxDelMaterial(HttpServletRequest request, @RequestParam Integer userArticleId){
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();

        JSONObject jsonRet = new JSONObject();

        wpwxUserArticleService.delUserArticle(userArticleId);
        log.info(new Date().toString() + "," +
                        ActionTypeEnum.CANCEL_COLLECT_MATERIAL.getKey() + "," +
                        "success,0" + "," +
                        userId + "," +
                        userArticleId
        );
        jsonRet.put("Status", true);
        return jsonRet;
    }
    @RequestMapping("/article_sync")
    public String articleSync(HttpServletRequest request, Model model){
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();
        //查询待同步文章
        //素材文章数目
        List<WpwxUserPublic> wpwxUserPublics = wpwxUserPublicService.getUserPublics(userId);
        List<WpwxMaterialSyncAssociation> wpwxMaterialSyncAssociations = wpwxMaterialService.getUserMaterialSyncs(userId);

        model.addAttribute("wpwxMaterialSyncAssociations",wpwxMaterialSyncAssociations);
        model.addAttribute("wpwxPublics", wpwxUserPublics);

        return "xigua/ajax/xiguaji/article_sync";
    }
    @RequestMapping("/my_public")
    public String myPublic(HttpServletRequest request, Model model){
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();
        //
        List<WpwxUserPublicAssociation> wpwxUserPublicAssociations =
                wpwxUserPublicService.getUserPublicAssociations(userId);

        model.addAttribute("wpwxUserPublicAssociations", wpwxUserPublicAssociations);
        model.addAttribute("wpwxUser", wpwxUser);

        return "xigua/ajax/xiguaji/my_public";
    }
    @RequestMapping("/public_hot")
    public String hotPublic(HttpServletRequest request, Model model){

        WpwxDictExample wpwxDictExample = new WpwxDictExample();
        wpwxDictExample.createCriteria().andTypeEqualTo(DictTypeEnum.TAG_CATEGORY.getKey());
        List<WpwxDict> wpwxDicts = wpwxDictMapper.selectByExample(wpwxDictExample);
        //查询热门公众号榜单
        List<WpwxPublic> wpwxPublics = wpwxPublicService.getHotPublics(1, 10);

        String categoryId = "1002";
        model.addAttribute("wpwxDicts", wpwxDicts);
        model.addAttribute("selectCategory", categoryId);
        model.addAttribute("wpwxPublics", wpwxPublics);

        return "xigua/ajax/xiguaji/public_hot";
    }
    @RequestMapping("/public_detail")
    public String publicDetail(HttpServletRequest request, Model model, @RequestParam(required = true) int publicId){
        //公众号详情
        WpwxPublic wpwxPublic = wpwxPublicService.getPublic(publicId);

        List<WpwxPublicArticleAssociation> wpwxPublicArticleAssociations =
                wpwxPublicArticleService.getPublishArticles(publicId);

        model.addAttribute("wpwxPublic", wpwxPublic);
        model.addAttribute("wpwxPublicArticleAssociations", wpwxPublicArticleAssociations);
        return "xigua/ajax/xiguaji/public_detail";
    }

    @RequestMapping("/article_edit")
    public String articleEdit(HttpServletRequest request, Model model,
                              @RequestParam(required = true) int materialSyncId){
        //获取同步素材信息，标题，缩略图，作者，正文
        WpwxMaterialSyncAssociation wpwxMaterialSyncAssociation =
                wpwxMaterialService.getMaterialSyncAssociation(materialSyncId);
        if(wpwxMaterialSyncAssociation == null){
            return "error";
        }
        model.addAttribute("wpwxMaterialSyncAssociation", wpwxMaterialSyncAssociation);

        List<WpwxArticleTemplate> wpwxArticleTemplates =
                wpwxArticleTemplateService.getPublicArticleTemplates(wpwxMaterialSyncAssociation.getWpwxPublic().getId());
        for(WpwxArticleTemplate wpwxArticleTemplate:wpwxArticleTemplates){
            wpwxArticleTemplate.setContent(HtmlUtil.htmldecode(wpwxArticleTemplate.getContent().replace("&nbsp;", " ")));
            if ( wpwxArticleTemplate.getType() == ArticleTemplateTypeEnum.FOCUS_TEMPLATE.getKey()){
                model.addAttribute("focusTemplate", wpwxArticleTemplate);
            }else if(wpwxArticleTemplate.getType() == ArticleTemplateTypeEnum.SIGN_TEMPLATE.getKey()){
                model.addAttribute("signTemplate", wpwxArticleTemplate);
            }else if(wpwxArticleTemplate.getType() == ArticleTemplateTypeEnum.ORIGIN_ARTICLE_TEMPLATE.getKey()){
                model.addAttribute("originArticleTemplate", wpwxArticleTemplate);
            }else if(wpwxArticleTemplate.getType() == ArticleTemplateTypeEnum.ORIGIN_ARTICLE_LINK.getKey()){
                model.addAttribute("orginArticleLink", wpwxArticleTemplate);
            }
        }
        return "xigua/ajax/xiguaji/article_edit";
    }
    @RequestMapping("/mass_log")
    public String massLog(HttpServletRequest request, Model model,
                          @RequestParam(required = true) int publicId){
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();
        WpwxPublic wpwxPublic = wpwxPublicService.getPublic(publicId);

        List<WpwxMaterialSyncAssociation> wpwxMaterialSyncAssociations =
                wpwxMaterialService.getUserMaterialSyncs(userId, publicId);

        model.addAttribute("wpwxPublic", wpwxPublic);
        model.addAttribute("wpwxMaterialSyncAssociations", wpwxMaterialSyncAssociations);
        return "xigua/ajax/xiguaji/mass_log";
    }



    //获得素材详情
    @RequestMapping("/ajax/ajaxGetMaterialDetailList")
    public @ResponseBody JSONObject ajaxGetMaterialDetailList(HttpServletRequest request,
                                                          @RequestParam(required = true) int materialSyncId){
        JSONObject jsonRet = new JSONObject();

        WpwxMaterialSyncAssociation wpwxMaterialSyncAssociation =
                wpwxMaterialService.getMaterialSyncAssociation(materialSyncId);

        if(wpwxMaterialSyncAssociation == null){
            jsonRet.put("Status", false);
            return jsonRet;
        }

        JSONArray jsonDataList = new JSONArray();
        int index = 0;
        for( WpwxMaterial wpwxMaterial : wpwxMaterialSyncAssociation.getWpwxMaterials() ){
            JSONObject jsonArticle = new JSONObject();
            jsonArticle.put("MaterialDetailId", wpwxMaterial.getId());
            jsonArticle.put("UserMaterialId", materialSyncId);
            jsonArticle.put("ArticleIndex", wpwxMaterial.getSequenceId());
            jsonArticle.put("ArticleId", wpwxMaterial.getOriginArticleId());
            jsonArticle.put("Title", wpwxMaterial.getTitle());
            jsonArticle.put("Content", wpwxMaterial.getContent());
            jsonArticle.put("ImageUrl", wpwxMaterial.getThumbnail());
            jsonArticle.put("CdnImageUrl", wpwxMaterial.getThumbnail());

            jsonArticle.put("Author", wpwxMaterial.getAuthor());
            jsonArticle.put("IsContainImage", wpwxMaterial.getShowCoverPic());
            jsonArticle.put("AddTime", wpwxMaterial.getCreatedTime());
            jsonArticle.put("Remark", "");
            jsonArticle.put("OriginalUrl", "");

            jsonDataList.add(jsonArticle);
        }
        jsonRet.put("DataList", jsonDataList);
        jsonRet.put("Status", true);

        return jsonRet;
    }

    @RequestMapping("/modal/article_analyse_detail")
    public String modalArticleAnalyseDetail(HttpServletRequest request, Model model){
        String publicId = request.getParameter("articleId");
        //
        return "xigua/ajax/xiguaji/modal/article_analyse_detail";
    }
    @RequestMapping("/modal/public_add")
    public String modalPublicAdd(HttpServletRequest request, Model model){
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();
        String authUUID = UUID.randomUUID().toString();
        //
        String url = "https://mp.weixin.qq.com/cgi-bin/componentloginpage?component_appid="
                + weixinAuthService.getComponentAppID()
                +"&pre_auth_code="
                + weixinAuthService.getPreAuthCode().getCode()
                + "&redirect_uri="
                + XiguaConstant.redirectUrl.replace("%account%", userId).replace("%authUUID%", authUUID);

        model.addAttribute("authorizeUrl", url);
        model.addAttribute("authUUID", authUUID);
        return "xigua/ajax/xiguaji/modal/public_add";
    }
    @RequestMapping("/modal/article_sync_add")
    public String modalArticleSyncAdd(HttpServletRequest request, Model model){
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();
        //素材文章数目
        List<WpwxUserPublicAssociation> wpwxUserPublicAssociations =
                wpwxUserPublicService.getUserPublicAssociations(userId);

        model.addAttribute("wpwxUserPublicAssociations", wpwxUserPublicAssociations);
        return "xigua/ajax/xiguaji/modal/article_sync_add";
    }
    @RequestMapping("/modal/mass_schedule")
    public String modalMassSchedule(@RequestParam(required = true)int materialSyncId,
                               HttpServletRequest request, Model model){
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();

        WpwxMaterialSync wpwxMaterialSync = wpwxMaterialService.getMaterialSync(materialSyncId);
        model.addAttribute("materialSyncId", materialSyncId);
        model.addAttribute("wpwxMaterialSync", wpwxMaterialSync);
        return "xigua/ajax/xiguaji/modal/mass_schedule";
    }
    @RequestMapping("/modal/article_template")
    public String modalArticleTemplate(@RequestParam(required = true)int publicId,
                                    HttpServletRequest request, Model model){
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();

        WpwxPublic wpwxPublic = wpwxPublicService.getPublic(publicId);

        List<WpwxArticleTemplate> wpwxArticleTemplates =
                wpwxArticleTemplateService.getPublicArticleTemplates(publicId);
        for (WpwxArticleTemplate wpwxArticleTemplate:wpwxArticleTemplates){
            wpwxArticleTemplate.setContent(HtmlUtil.htmldecode(wpwxArticleTemplate.getContent()));
            if ( wpwxArticleTemplate.getType() == ArticleTemplateTypeEnum.FOCUS_TEMPLATE.getKey()){
                model.addAttribute("focusTemplate", wpwxArticleTemplate);
            }else if(wpwxArticleTemplate.getType() == ArticleTemplateTypeEnum.SIGN_TEMPLATE.getKey()){
                model.addAttribute("signTemplate", wpwxArticleTemplate);
            }else if(wpwxArticleTemplate.getType() == ArticleTemplateTypeEnum.ORIGIN_ARTICLE_TEMPLATE.getKey()){
                model.addAttribute("originArticleTemplate", wpwxArticleTemplate);
            }else if(wpwxArticleTemplate.getType() == ArticleTemplateTypeEnum.ORIGIN_ARTICLE_LINK.getKey()){
                model.addAttribute("orginArticleLink", wpwxArticleTemplate);
            }
        }
        model.addAttribute("wpwxPublic", wpwxPublic);

        return "xigua/ajax/xiguaji/modal/article_template";
    }
    @RequestMapping("/modal/material_import")
    public String modalMaterialImport(HttpServletRequest request, Model model){
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();
//
//        WpwxPublic wpwxPublic = wpwxPublicMapper.selectByPrimaryKey(publicId);
//
//        model.addAttribute("wpwxPublic", wpwxPublic);

        return "xigua/ajax/xiguaji/modal/material_import";
    }
    @RequestMapping("/modal/material_import_new")
    public String modalMaterialImportNew(HttpServletRequest request, Model model){
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();
//
//        WpwxPublic wpwxPublic = wpwxPublicMapper.selectByPrimaryKey(publicId);
//
//        model.addAttribute("wpwxPublic", wpwxPublic);

        return "xigua/ajax/xiguaji/modal/material_import_new";
    }



    /***********************************************
     * ajax
     **********************************************/
    @RequestMapping("/ajax/more_material_global")
    public void ajaxMoreMaterialGlobal(HttpServletRequest request, HttpServletResponse response,
                                   @RequestParam(value="page",required = false,defaultValue = "1") Integer page,
                                   @RequestParam(required = true) String categoryId){
        JSONObject jsonRet = new JSONObject();
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();
        List<String> categoryIds = new ArrayList<String>();
        String[] scategoryIds = categoryId.split(",");
        for(String s : scategoryIds){
            categoryIds.add(s);
        }
        List<WpwxArticleAssociation> wpwxArticleAssociations =
                wpwxArticleService.getMaterialGlobals(userId, categoryIds, page, 10);


        String template = "        <tr>\n" +
                "            <td>\n" +
                "                <span class=\"artRank rank4\"><i class=\"fa fa-trophy\"></i>56.33</span>\n" +
                "            </td>\n" +
                "            <td>\n" +
                "                <a href=\"%link%\" target=\"_blank\" class=\"\">%title%</a>\n" +
                "                                            </td>\n" +
                "            <td class=\"text-align-center\">\n" +
                "                <span class=\"artContentSort\">\n" +
                "                    <i class=\"fa fa-picture-o\"><em></em></i>\n" +
                "                </span>\n" +
                "            </td>\n" +
                "            <td><a href=\"%thumbnail%\" target=\"_blank\" class=\"myArticleCover articleCover60\"><img class=\"WechatImage\" data-src=\"%thumbnail%\"></a></td>\n" +
                "            <td><a href=\"#/user/public_detail.do?publicId=%publicId%\">%sourceName%</a><span class=\"artPostTime\">%publishTime%</span></td>\n" +
                "            \n" +
                "            <td>\n" +
                "                <a class=\"btn btn-primary btnIcon articlecollect\" href=\"javascript:void(0);\" data-articleid=\"%articleId%\" data-collected=\"0\" rel=\"tooltip\" data-placement=\"top\" data-original-title=\"加入素材库\"><i class=\"fa fa-star\"></i> 加入素材库</a>\n" +
                "            </td>\n" +
                "        </tr>\n";
        String template_focused = "        <tr>\n" +
                "            <td>\n" +
                "                <span class=\"artRank rank4\"><i class=\"fa fa-trophy\"></i>56.33</span>\n" +
                "            </td>\n" +
                "            <td>\n" +
                "                <a href=\"%link%\" target=\"_blank\" class=\"\">%title%</a>\n" +
                "                                            </td>\n" +
                "            <td class=\"text-align-center\">\n" +
                "                <span class=\"artContentSort\">\n" +
                "                    <i class=\"fa fa-picture-o\"><em></em></i>\n" +
                "                </span>\n" +
                "            </td>\n" +
                "            <td><a href=\"%thumbnail%\" target=\"_blank\" class=\"myArticleCover articleCover60\"><img class=\"WechatImage\" data-src=\"%thumbnail%\"></a></td>\n" +
                "            <td><a href=\"#/user/public_detail.do?publicId=%publicId%\">%sourceName%</a><span class=\"artPostTime\">%publishTime%</span></td>\n" +
                "            \n" +
                "            <td>\n" +
                "               <a class=\"btn btn-primary btnIcon articlecollect btnArtFavorited\" href=\"javascript:void(0);\" data-articleid=\"%articleId%\" data-collected=\"1\" rel=\"tooltip\" data-placement=\"top\" data-original-title=\"加入素材库\"><i class=\"fa fa-star\"></i> 已在素材库</a>\n" +
                "            </td>\n" +
                "        </tr>\n";
        String strRet = "";
        for(WpwxArticleAssociation wpwxArticleAssociation : wpwxArticleAssociations) {
            if( wpwxArticleAssociation.getWpwxUserArticle() == null ){
                strRet += template.replace("%thumbnail%", wpwxArticleAssociation.getThumbnail()).
//                    replace("%publicId%", wpwxPublicArticleAssociation.getPublicId().toString()).
        replace("%title%", wpwxArticleAssociation.getTitle()).
                        replace("%link%", wpwxArticleAssociation.getLink()).
                        replace("%sourceName%", wpwxArticleAssociation.getSourceName()).
                        replace("%publishTime%", wpwxArticleAssociation.getPublishTime().toString()).
                        replace("%articleId%", wpwxArticleAssociation.getId().toString());
            }else{
                strRet += template_focused.replace("%thumbnail%", wpwxArticleAssociation.getThumbnail()).
//                    replace("%publicId%", wpwxPublicArticleAssociation.getPublicId().toString()).
        replace("%title%", wpwxArticleAssociation.getTitle()).
                        replace("%link%", wpwxArticleAssociation.getLink()).
                        replace("%sourceName%", wpwxArticleAssociation.getSourceName()).
                        replace("%publishTime%", wpwxArticleAssociation.getPublishTime().toString()).
                        replace("%articleId%", wpwxArticleAssociation.getId().toString());
            }

        }

        try {
            response.setCharacterEncoding("utf-8");
            response.getWriter().print(strRet);
        } catch (IOException e) {
            e.printStackTrace();
        }
//        return strRet;
    }

    @RequestMapping("/ajax/collect_material")
    public @ResponseBody
    JSONObject ajaxCollectMaterial(HttpServletRequest request,
                                   @RequestParam(required = true) int articleId){
        JSONObject jsonRet = new JSONObject();
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();
        //先判断是否已关注
        if( wpwxUserArticleService.isMaterialCollect(userId, articleId) == true ){
            jsonRet.put("Status", false);

            return jsonRet;
        }

        wpwxUserArticleService.collectMaterial(userId, articleId);
        log.info(new Date().toString() + "," +
                        ActionTypeEnum.COLLECT_MATERIAL.getKey() + "," +
                        "success,0" + "," +
                        userId + "," +
                        articleId
        );

        jsonRet.put("Status", true);

        return jsonRet;
    }
    @RequestMapping("/ajax/material_import")
    public @ResponseBody
    JSONObject ajaxMaterialImport(HttpServletRequest request,
                                   @RequestParam(required = true) String mpUrl){
        JSONObject jsonRet = new JSONObject();
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();
        //先判断是否已关注
        //根据地址分析数据返回文章ID
        int articleId = 0;
        WpwxArticle wpwxArticle = wpwxUserArticleService.importMaterial(mpUrl);
        if( wpwxArticle == null ){
            jsonRet.put("Status", false);
            return jsonRet;
        }
        wpwxUserArticleService.collectMaterial(userId, wpwxArticle.getId());
        log.info(new Date().toString() + "," +
                        ActionTypeEnum.MANUAL_COLLECT_MATERIAL.getKey() + "," +
                        "success,0" + "," +
                        userId + "," +
                        wpwxArticle.getId()
        );
        jsonRet.put("Status", true);

        return jsonRet;
    }

    //
    @RequestMapping("/ajax/material_import_new")
    public @ResponseBody
    JSONObject ajaxMaterialImportNew(HttpServletRequest request,
                                  @RequestParam(required = true) String mpUrl){
        JSONObject jsonRet = new JSONObject();
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();
        //先判断是否已关注
        //根据地址分析数据返回文章ID
        int articleId = 0;
        WpwxArticle wpwxArticle = wpwxUserArticleService.importMaterial(mpUrl);
        if( wpwxArticle == null ){
            jsonRet.put("Status", false);
            return jsonRet;
        }
        WpwxArticleContent wpwxArticleContent =
                wpwxArticleService.getArticleContent(wpwxArticle.getId());
        jsonRet.put("Status", true);
        jsonRet.put("wpwxArticle", wpwxArticle);
        jsonRet.put("wpwxArticleContent", wpwxArticleContent);

        return jsonRet;
    }


    @RequestMapping("/ajax/add_sync_material")
    public @ResponseBody JSONObject ajaxAddSyncMaterial(
                                                        HttpServletRequest request) throws IOException {

        String sPublicIds = request.getParameter("publicIds");
        String sJsonPara = RequestUtil.getString(request);
        JSONObject jsonPara = JSON.parseObject(sJsonPara);
        List<Integer> publicIds = new ArrayList<Integer>();
        List<Integer> lArticleIds = new ArrayList<Integer>();
//        String sPublicIds = jsonPara.getString("publicIds");
        for(Object e : jsonPara.getJSONArray("publicIds"))
            publicIds.add(Integer.parseInt(e.toString()));
        for(Object e : jsonPara.getJSONArray("articleIds"))
            lArticleIds.add(Integer.parseInt(e.toString()));
        JSONObject jsonRet = new JSONObject();
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();

        if( publicIds.size() == 0 || lArticleIds.size() == 0 ){
            jsonRet.put("Status", false);
            return jsonRet;
        }
        wpwxPublicArticleService.addSyncMaterial(userId, publicIds, lArticleIds);
        log.info(new Date().toString() + "," +
                        ActionTypeEnum.GENERATE_ARTICLE_SYNC.getKey() + "," +
                        "success,0" + "," +
                        userId + "," +
                        JSON.toJSONString(publicIds)+","+
                        JSON.toJSONString(lArticleIds)
        );

        jsonRet.put("Status", true);
        return jsonRet;
    }
    @RequestMapping("/ajax/del_sync_material")
    public @ResponseBody JSONObject ajaxDelSyncMaterial(@RequestParam(required = true) int materialSyncId,
                                                        HttpServletRequest request){

        JSONObject jsonRet = new JSONObject();
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();

        WpwxMaterialSync wpwxMaterialSync = wpwxMaterialService.getMaterialSync(materialSyncId);
        if( wpwxMaterialSync == null ){
            jsonRet.put("Status", false);
            return jsonRet;
        }
//        wpwxMaterialSync.setDelFlag(DelFlagEnum.DELETE.getKey());
        wpwxMaterialService.delSyncMaterial(materialSyncId);
        log.info(new Date().toString() + "," +
                        ActionTypeEnum.DEL_ARTICLE_SYNC.getKey() + "," +
                        "success,0" + "," +
                        userId + "," +
                        materialSyncId
        );
        jsonRet.put("Status", true);
        return jsonRet;
    }
    @RequestMapping("/ajax/del_public")
    public @ResponseBody JSONObject ajaxDelPublic(@RequestParam(required = true) int publicId,
                                                        HttpServletRequest request){

        JSONObject jsonRet = new JSONObject();
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();

        wpwxUserPublicService.unbindUserPublic(userId, publicId);
        log.info(new Date().toString() + "," +
                        ActionTypeEnum.UNBIND_PUBLIC.getKey() + "," +
                        "success,0" + "," +
                        userId + "," +
                        publicId
        );
        jsonRet.put("Status", true);
        return jsonRet;
    }
    @RequestMapping("/ajax/weixin/sync_material")
    public @ResponseBody JSONObject ajaxWeixinSyncMaterial(HttpServletRequest request,
                                                           @RequestParam(required = true) int materialSyncId){
        JSONObject jsonRet = new JSONObject();
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();
        try {
            if( wpwxMaterialService.syncMaterial(materialSyncId) != 0 ){
                log.info(new Date().toString() + "," +
                                ActionTypeEnum.SYNC_ARTICLE_SYNC.getKey() + "," +
                                "fail,0" + "," +
                                userId + "," +
                                materialSyncId
                );
                jsonRet.put("Status", false);
                return jsonRet;
            }
        } catch (WexinReqException e) {
            e.printStackTrace();
        }

        log.info(new Date().toString() + "," +
                        ActionTypeEnum.SYNC_ARTICLE_SYNC.getKey() + "," +
                        "success,0" + "," +
                        userId + "," +
                        materialSyncId
        );
        jsonRet.put("Status", true);

        return jsonRet;
    }
    //设置群发时间
    @RequestMapping("/ajax/weixin/SetMassTime")
    public @ResponseBody JSONObject ajaxSetMassTime(HttpServletRequest request,
                                                           @RequestParam(required = true) int materialSyncId,
                                                           @RequestParam(required = true) String massTime){
        JSONObject jsonRet = new JSONObject();
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();
        DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm");
        DateTime dateTime = DateTime.parse(massTime, format);
        WpwxMaterialSync wpwxMaterialSync = wpwxMaterialService.getMaterialSync(materialSyncId);
        if( wpwxMaterialSync == null )
        {
            log.info(new Date().toString() + "," +
                            ActionTypeEnum.SCHEDULE_ARTICLE_SYNC.getKey() + "," +
                            "fail,0" + "," +
                            userId + "," +
                            materialSyncId
            );
            jsonRet.put("Message", "同步素材不存在");
            jsonRet.put("Status", false);
            return jsonRet;
        }
        if(  wpwxMaterialSync.getScheduleTime() != null)
        {
            log.info(new Date().toString() + "," +
                            ActionTypeEnum.SCHEDULE_ARTICLE_SYNC.getKey() + "," +
                            "fail,0" + "," +
                            userId + "," +
                            materialSyncId
            );
            jsonRet.put("Message", "同步素材已设定发送时间");
            jsonRet.put("Status", false);
            return jsonRet;
        }
        wpwxMaterialSync.setScheduleTime(dateTime.toDate());
        wpwxMaterialService.updateSyncMaterial(wpwxMaterialSync.getId(), wpwxMaterialSync);
        log.info(new Date().toString() + "," +
                        ActionTypeEnum.SCHEDULE_ARTICLE_SYNC.getKey() + "," +
                        "success,0" + "," +
                        userId + "," +
                        materialSyncId
        );
        jsonRet.put("Status", true);

        return jsonRet;
    }
    @RequestMapping("/ajax/weixin/massSend")
    public @ResponseBody JSONObject ajaxMassSend(HttpServletRequest request,
                                                    @RequestParam(required = true) int materialSyncId){
        JSONObject jsonRet = new JSONObject();
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();
        WpwxMaterialSync wpwxMaterialSync = wpwxMaterialService.getMaterialSync(materialSyncId);
        WpwxMaterialSyncAssociation wpwxMaterialSyncAssociation =
                wpwxMaterialService.getMaterialSyncAssociation(materialSyncId);
        if( wpwxMaterialSyncAssociation == null )
        {
            log.info(new Date().toString() + "," +
                            ActionTypeEnum.SEND_ARTICLE_SYNC.getKey() + "," +
                            "fail" + "," +"同步素材不存在"+","+
                            userId + "," +
                            materialSyncId
            );
            jsonRet.put("Message", "同步素材不存在");
            jsonRet.put("Status", false);
            return jsonRet;
        }
//        if(  wpwxMaterialSync.getScheduleTime() != null)
//        {
//            jsonRet.put("Message", "同步素材已设定发送时间");
//            jsonRet.put("Status", false);
//            return jsonRet;
//        }
             //群发
        int ret = 0;
        try {
            ret = wpwxMaterialService.massSend(wpwxMaterialSyncAssociation);
        } catch (WexinReqException e) {
            e.printStackTrace();
            log.info(new Date().toString() + "," +
                            ActionTypeEnum.SEND_ARTICLE_SYNC.getKey() + "," +
                            "fail" + "," +"发送异常"+","+
                            userId + "," +
                            materialSyncId
            );
            jsonRet.put("Message", "发送异常，009");
            jsonRet.put("Status", false);
            return jsonRet;
        }
        log.info("massSend,"+wpwxMaterialSyncAssociation.getId()+","+ret);
        if( ret != 0 ){
            log.info(new Date().toString() + "," +
                            ActionTypeEnum.SEND_ARTICLE_SYNC.getKey() + "," +
                            "fail" + "," +ret+","+
                            userId + "," +
                            materialSyncId
            );
            jsonRet.put("Message", "发送异常，009");
            jsonRet.put("Status", false);
            return jsonRet;
        }
        log.info(new Date().toString() + "," +
                        ActionTypeEnum.SEND_ARTICLE_SYNC.getKey() + "," +
                        "success,0" + "," +
                        userId + "," +
                        materialSyncId
        );
        jsonRet.put("Status", true);

        return jsonRet;
    }

    //取消群发时间
    @RequestMapping("/ajax/weixin/CancelMass")
    public @ResponseBody JSONObject ajaxCancelMass(HttpServletRequest request,
                                                           @RequestParam(required = true) int materialSyncId){
        JSONObject jsonRet = new JSONObject();
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();
        WpwxMaterialSync wpwxMaterialSync = wpwxMaterialService.getMaterialSync(materialSyncId);
        if( wpwxMaterialSync == null )
        {
            log.info(new Date().toString() + "," +
                            ActionTypeEnum.CANCEL_SCHEDULE_ARTICLE_SYNC.getKey() + "," +
                            "fail,同步素材不存在" + "," +
                            userId + "," +
                            materialSyncId
            );
            jsonRet.put("Message", "同步素材不存在");
            jsonRet.put("Status", false);
            return jsonRet;
        }
        if( wpwxMaterialSync.getScheduleTime() == null )
        {
            log.info(new Date().toString() + "," +
                            ActionTypeEnum.CANCEL_SCHEDULE_ARTICLE_SYNC.getKey() + "," +
                            "fail,同步素材未设定发送时间" + "," +
                            userId + "," +
                            materialSyncId
            );
            jsonRet.put("Message", "同步素材未设定发送时间");
            jsonRet.put("Status", false);
            return jsonRet;
        }
        wpwxMaterialSync.setScheduleTime(null);
        wpwxMaterialService.updateSyncMaterial(wpwxMaterialSync.getId(), wpwxMaterialSync);
        log.info(new Date().toString() + "," +
                        ActionTypeEnum.CANCEL_SCHEDULE_ARTICLE_SYNC.getKey() + "," +
                        "success,0" + "," +
                        userId + "," +
                        materialSyncId
        );
        jsonRet.put("Status", true);

        return jsonRet;
    }
    //保存同步图文
    @RequestMapping("/ajax/saveMaterialSync")
    public @ResponseBody JSONObject ajaxSaveMaterialSync(@RequestBody String json,
                                                         HttpServletRequest request) throws IOException {
        JSONObject jsonRet = new JSONObject();
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();
        JSONObject jsonPara = JSON.parseObject(json);
        int materialSyncId = jsonPara.getInteger("UserMaterialId");
        JSONArray jsonMaterialList = jsonPara.getJSONArray("MaterialDetailList");

        WpwxMaterialSyncAssociation wpwxMaterialSyncAssociation =
                wpwxMaterialService.getMaterialSyncAssociation(materialSyncId);

        if( wpwxMaterialSyncAssociation == null ){
            log.info(new Date().toString() + "," +
                            ActionTypeEnum.SAVE_EDIT_ARTICLE_SYNC.getKey() + "," +
                            "fail,材料数目错误" + "," +
                            userId + "," +
                            materialSyncId
            );
            jsonRet.put("Message", "材料数目错误，"+materialSyncId);
            jsonRet.put("Status", false);
            return jsonRet;
        }

        for(WpwxMaterial wpwxMaterial : wpwxMaterialSyncAssociation.getWpwxMaterials()){
            wpwxMaterial.setDelFlag(DelFlagEnum.DELETE.getKey());
        }
        int index = 0;
        for(Object oMaterial : jsonMaterialList){
            JSONObject jsonMaterial = (JSONObject)oMaterial;
            boolean bMatch = false;
            for(WpwxMaterial wpwxMaterial : wpwxMaterialSyncAssociation.getWpwxMaterials()){
                if( wpwxMaterial.getId().equals(jsonMaterial.getInteger("MaterialDetailId")) ){
                    bMatch = true;
                    wpwxMaterial.setContent(jsonMaterial.getString("Content"));
                    wpwxMaterial.setTitle(jsonMaterial.getString("Title"));
                    wpwxMaterial.setAuthor(jsonMaterial.getString("Author"));
                    wpwxMaterial.setShowCoverPic(jsonMaterial.getInteger("IsContainImage"));
                    wpwxMaterial.setThumbnail(jsonMaterial.getString("ImageUrl"));
                    wpwxMaterial.setSequenceId(index);
                    wpwxMaterial.setUpdatedTime(new Date());
                    wpwxMaterial.setDelFlag(DelFlagEnum.NORMAL.getKey());

                    wpwxMaterialService.updateMaterial(wpwxMaterial.getId(), wpwxMaterial);

                    break;
                }
            }
            if( bMatch == true ){

            }else{
                //新增
                WpwxMaterial newWpwxMaterial = new WpwxMaterial();
                newWpwxMaterial.setMaterialSyncId(materialSyncId);
                newWpwxMaterial.setPublicId(wpwxMaterialSyncAssociation.getPublicId());
                newWpwxMaterial.setContent(jsonMaterial.getString("Content"));
                newWpwxMaterial.setTitle(jsonMaterial.getString("Title"));
                newWpwxMaterial.setAuthor(jsonMaterial.getString("Author"));
                newWpwxMaterial.setShowCoverPic(jsonMaterial.getInteger("IsContainImage"));
                newWpwxMaterial.setThumbnail(jsonMaterial.getString("ImageUrl"));
                newWpwxMaterial.setSequenceId(index);
                newWpwxMaterial.setDelFlag(DelFlagEnum.NORMAL.getKey());
                newWpwxMaterial.setCreatedTime(new Date());
                newWpwxMaterial.setUpdatedTime(new Date());

                wpwxPublicArticleService.addSyncMaterial(newWpwxMaterial);
            }


            index++;
        }
        //删除delete
        for(WpwxMaterial wpwxMaterial : wpwxMaterialSyncAssociation.getWpwxMaterials()){
            if( wpwxMaterial.getDelFlag() == DelFlagEnum.DELETE.getKey() ){
                wpwxMaterialService.updateMaterial(wpwxMaterial.getId(), wpwxMaterial);
            }
        }
        //新保存的需要重新同步
        wpwxMaterialSyncAssociation.setStatus(ArticleSyncStatusTypeEnum.NOT_SYNC.getKey());
        wpwxMaterialService.updateSyncMaterial(materialSyncId, wpwxMaterialSyncAssociation);

        log.info(new Date().toString() + "," +
                        ActionTypeEnum.SAVE_EDIT_ARTICLE_SYNC.getKey() + "," +
                        "success,0" + "," +
                        userId + "," +
                        materialSyncId
        );
        jsonRet.put("Status", true);

        return jsonRet;
    }
    //保存同步图文
    @RequestMapping("/ajax/saveArticleTemplate")
    public @ResponseBody JSONObject ajaxSaveArticleTemplate(@RequestBody String json,
                                                         HttpServletRequest request) throws IOException {
        JSONObject jsonRet = new JSONObject();
        WpwxUser wpwxUser = SessionUtil.getUser(request);
        String userId = wpwxUser.getId();

        JSONObject jsonPara = JSON.parseObject(json);
        Integer publicId = jsonPara.getInteger("bizId");
        JSONObject jsonTemplate = jsonPara.getJSONObject("ubTemplate");


        String FollowTemplate = jsonTemplate.getString("FollowTemplate");
        String SignTemplate = jsonTemplate.getString("SignTemplate");
        String OriginalTemplate = jsonTemplate.getString("OriginalTemplate");
        Integer AutoInsertFollow = jsonTemplate.getInteger("AutoInsertFollow");
        Integer AutoInsertSign = jsonTemplate.getInteger("AutoInsertSign");
        Integer AutoInsertOriginal = jsonTemplate.getInteger("AutoInsertOriginal");
        String OriginalUrl = jsonTemplate.getString("OriginalUrl");

        WpwxPublic wpwxPublic = wpwxPublicService.getPublic(publicId);

        List<WpwxArticleTemplate> wpwxArticleTemplates =
                wpwxArticleTemplateService.getPublicArticleTemplates(publicId);

        Boolean bNewFollow = true;
        Boolean bNewSign = true;
        Boolean bNewOrigin = true;
        Boolean bNewOriginUrl = true;

        for(WpwxArticleTemplate wpwxArticleTemplate:wpwxArticleTemplates){
            if ( wpwxArticleTemplate.getType() == ArticleTemplateTypeEnum.FOCUS_TEMPLATE.getKey()){
                wpwxArticleTemplate.setContent(FollowTemplate);
                wpwxArticleTemplate.setUpdatedTime(new Date());
                wpwxArticleTemplate.setAutoInsert(AutoInsertFollow);
                bNewFollow = false;
            }else if(wpwxArticleTemplate.getType() == ArticleTemplateTypeEnum.SIGN_TEMPLATE.getKey()){
                wpwxArticleTemplate.setContent(SignTemplate);
                wpwxArticleTemplate.setUpdatedTime(new Date());
                wpwxArticleTemplate.setAutoInsert(AutoInsertSign);
                bNewSign = false;

            }else if(wpwxArticleTemplate.getType() == ArticleTemplateTypeEnum.ORIGIN_ARTICLE_TEMPLATE.getKey()){
                wpwxArticleTemplate.setContent(OriginalTemplate);
                wpwxArticleTemplate.setUpdatedTime(new Date());
                wpwxArticleTemplate.setAutoInsert(AutoInsertOriginal);
                bNewOrigin = false;

            }else if(wpwxArticleTemplate.getType() == ArticleTemplateTypeEnum.ORIGIN_ARTICLE_LINK.getKey()){
                wpwxArticleTemplate.setContent(OriginalUrl);
                wpwxArticleTemplate.setUpdatedTime(new Date());
                bNewOriginUrl = false;
            }else{
                log.error("none defined article template type,"+wpwxArticleTemplate.getType());
                continue;
            }
            wpwxArticleTemplateService.updateArticleTemplate(
                    wpwxArticleTemplate.getId(), wpwxArticleTemplate);
        }
        if( bNewFollow == true ){
            WpwxArticleTemplate wpwxArticleTemplate = new WpwxArticleTemplate();
            wpwxArticleTemplate.setPublicId(publicId);
            wpwxArticleTemplate.setType(ArticleTemplateTypeEnum.FOCUS_TEMPLATE.getKey());
            wpwxArticleTemplate.setContent(FollowTemplate);
            wpwxArticleTemplate.setAutoInsert(AutoInsertFollow);
            wpwxArticleTemplate.setCreatedTime(new Date());
            wpwxArticleTemplate.setUpdatedTime(new Date());
            wpwxArticleTemplateService.insertArticleTemplate(wpwxArticleTemplate);
        }
        if( bNewSign == true ){
            WpwxArticleTemplate wpwxArticleTemplate = new WpwxArticleTemplate();
            wpwxArticleTemplate.setPublicId(publicId);
            wpwxArticleTemplate.setType(ArticleTemplateTypeEnum.SIGN_TEMPLATE.getKey());
            wpwxArticleTemplate.setContent(SignTemplate);
            wpwxArticleTemplate.setAutoInsert(AutoInsertSign);
            wpwxArticleTemplate.setCreatedTime(new Date());
            wpwxArticleTemplate.setUpdatedTime(new Date());
            wpwxArticleTemplateService.insertArticleTemplate(wpwxArticleTemplate);
        }
        if( bNewOrigin == true ){
            WpwxArticleTemplate wpwxArticleTemplate = new WpwxArticleTemplate();
            wpwxArticleTemplate.setPublicId(publicId);
            wpwxArticleTemplate.setType(ArticleTemplateTypeEnum.ORIGIN_ARTICLE_TEMPLATE.getKey());
            wpwxArticleTemplate.setContent(OriginalTemplate);
            wpwxArticleTemplate.setAutoInsert(AutoInsertOriginal);
            wpwxArticleTemplate.setCreatedTime(new Date());
            wpwxArticleTemplate.setUpdatedTime(new Date());
            wpwxArticleTemplateService.insertArticleTemplate(wpwxArticleTemplate);
        }
        if( bNewOriginUrl == true ){
            WpwxArticleTemplate wpwxArticleTemplate = new WpwxArticleTemplate();
            wpwxArticleTemplate.setPublicId(publicId);
            wpwxArticleTemplate.setType(ArticleTemplateTypeEnum.ORIGIN_ARTICLE_LINK.getKey());
            wpwxArticleTemplate.setContent(OriginalUrl);
            wpwxArticleTemplate.setCreatedTime(new Date());
            wpwxArticleTemplate.setUpdatedTime(new Date());
            wpwxArticleTemplateService.insertArticleTemplate(wpwxArticleTemplate);
        }

        jsonRet.put("Status", true);
        jsonRet.put("Message", "操作成功");
        log.info(new Date().toString() + "," +
                        ActionTypeEnum.SAVE_ARTICLE_TEMPLATE.getKey() + "," +
                        "success,0" + "," +
                        userId + "," +
                        publicId
        );
        return jsonRet;
    }
    @RequestMapping("checkMassSchedule")
    @ResponseBody
    public String ajaxCheckMassSchedule(HttpServletRequest request) throws WexinReqException {
        checkMassSchedule();
        return "";
    }
    @RequestMapping("ajaxGetTemplates")
    @ResponseBody
    public JSONObject ajaxGetTemplates(HttpServletRequest request,
                                       @RequestParam(required = true)Integer id ) throws WexinReqException {
        JSONObject jsonRet = new JSONObject();
        jsonRet.put("code", 0);
        jsonRet.put("type", 2);
        jsonRet.put("recordCount", 2);
        JSONArray jsonArray = new JSONArray();

        List<WpwxArticleWidget> wpwxArticleWidgets =
                wpwxArticleWidgetService.getArticleWidgets(id);
        for(WpwxArticleWidget wpwxArticleWidget : wpwxArticleWidgets){
            JSONObject ex = new JSONObject();
            ex.put("tag", wpwxArticleWidget.getTag());
            ex.put("content", wpwxArticleWidget.getContent());
            jsonArray.add(ex);
        }

        jsonRet.put("result", jsonArray);
        return jsonRet;
    }
//    @RequestMapping("upload")
//    @ResponseBody
//    public JSONObject ajaxUploadFiles(HttpServletRequest request,
//                                      @RequestParam(required = true) Integer materialId) {
//        JSONObject jsonRet = new JSONObject();
//        JSONArray jsonArray = new JSONArray();
//
//        try {
//            MutiFileUpload upload=new MutiFileUpload();
//            //文件路径可以通过配置文件system.properties获取
//
//            String path= SystemGlobal.getPreference("UPLOAD_IMAGE_DIR");
//            File parent = new File(path);
//
//            //执行上传
//            upload.parseRequest(request);
//            List<HashMap<String,String>> list=upload.mainUpload(parent,path);
//
//            for(HashMap<String,String> one : list){
//                for(String key : one.keySet()){
//                    JSONObject jsonOne = new JSONObject();
//                    jsonOne.put("size", 9301);
//                    jsonOne.put("url", "http://localhost/images/upload/"+one.get(key));
//
//                    jsonArray.add(jsonOne);
//                }
//            }
//        }catch (Exception e) {
//            e.printStackTrace();
//        }
//        jsonRet.put("files", jsonArray);
//
//        return jsonRet;
//    }
    //定时检查群发
    @Scheduled(
            cron = "0 0/5 * * * ?"
    )
    public void checkMassSchedule() throws WexinReqException {
        List<WpwxMaterialSyncAssociation> wpwxMaterialSyncAssociations =
                wpwxMaterialService.getScheduledMass();

        log.debug("checkMassSchedule,size,"+wpwxMaterialSyncAssociations.size());
        for(WpwxMaterialSyncAssociation wpwxMaterialSyncAssociation : wpwxMaterialSyncAssociations){
            //群发
            int ret = wpwxMaterialService.massSend(wpwxMaterialSyncAssociation);
            log.info("massSend,"+wpwxMaterialSyncAssociation.getId()+","+ret);
        }
//        log.error("quartz fuck");
    }

}
