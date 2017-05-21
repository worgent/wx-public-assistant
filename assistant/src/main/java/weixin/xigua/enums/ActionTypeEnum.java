package weixin.xigua.enums;

/**
 * Created with IntelliJ IDEA.
 * User: tianbc
 * Date: 15-9-11
 * Time: 下午5:43
 * To change this template use File | Settings | File Templates.
 */
public enum ActionTypeEnum {

    //文章内容类型
    LOGIN("login", "登录"),
    LOGOUT("logout", "登出"),
    COLLECT_MATERIAL("collect_material", "收集素材"),
    MANUAL_COLLECT_MATERIAL("manual_collect_material", "导入素材"),
    CANCEL_COLLECT_MATERIAL("cancel_collect_material", "删除素材"),
    GENERATE_ARTICLE_SYNC("generate_article_sync", "生成-图文同步"),
    SYNC_ARTICLE_SYNC("sync_article_sync", "同步-图文同步"),
    SEND_ARTICLE_SYNC("send_article_sync", "群发-图文同步"),
    DEL_ARTICLE_SYNC("del_article_sync", "删除-图文同步"),
    SCHEDULE_ARTICLE_SYNC("schedule_article_sync", "定时群发-图文同步"),
    CANCEL_SCHEDULE_ARTICLE_SYNC("cancel_schedule_article_sync", "取消定时群发-图文同步"),
    SAVE_EDIT_ARTICLE_SYNC("save_edit_article_sync", "保存修改-图文同步"),
    BIND_PUBLIC("bind_public", "绑定公众号"),
    UNBIND_PUBLIC("unbind_public", "解绑公众号"),
    SAVE_ARTICLE_TEMPLATE("save_article_template", "保存图文模板");

    private String key;
    private String desc;

    ActionTypeEnum(String key, String desc) {
        this.desc = desc;
        this.key = key;
    }
    public static ActionTypeEnum getEnum(String key) {

        for (ActionTypeEnum enm : ActionTypeEnum.values()) {
            if (enm.getKey().equals(key.trim())) {
                return enm;
            }
        }
        return null;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

     public static void  main(String args[]){
           // System.out.println(CheckCodeEnum.CREATE_ARTICLE.getKey()+" "+CheckCodeEnum.CREATE_ARTICLE.getDesc()+" "+CheckCodeEnum.CREATE_ARTICLE);
    }
}
