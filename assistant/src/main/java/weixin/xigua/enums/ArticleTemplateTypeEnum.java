package weixin.xigua.enums;

/**
 * Created with IntelliJ IDEA.
 * User: tianbc
 * Date: 15-9-11
 * Time: 下午5:43
 * To change this template use File | Settings | File Templates.
 */
public enum ArticleTemplateTypeEnum {

    //文章内容类型
    FOCUS_TEMPLATE(1, "关注引导模板"),
    SIGN_TEMPLATE(2, "签名模板"),
    ORIGIN_ARTICLE_TEMPLATE(3, "阅读原文引导模板"),
    ORIGIN_ARTICLE_LINK(4, "原文链接");

    private int key;
    private String desc;

    ArticleTemplateTypeEnum(int key, String desc) {
        this.desc = desc;
        this.key = key;
    }
    public static ArticleTemplateTypeEnum getEnum(int key) {

        for (ArticleTemplateTypeEnum enm : ArticleTemplateTypeEnum.values()) {
            if (enm.getKey() == (key)) {
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

    public int getKey() {
        return key;
    }

    public void setKey(int key) {
        this.key = key;
    }

     public static void  main(String args[]){
           // System.out.println(CheckCodeEnum.CREATE_ARTICLE.getKey()+" "+CheckCodeEnum.CREATE_ARTICLE.getDesc()+" "+CheckCodeEnum.CREATE_ARTICLE);
    }
}
