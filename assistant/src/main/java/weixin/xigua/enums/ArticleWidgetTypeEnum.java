package weixin.xigua.enums;

/**
 * Created with IntelliJ IDEA.
 * User: tianbc
 * Date: 15-9-11
 * Time: 下午5:43
 * To change this template use File | Settings | File Templates.
 */
public enum ArticleWidgetTypeEnum {

    //文章内容类型
    TITLE(1, "标题"),
    CONTENT(2, "正文"),
    PICTURE(3, "图片"),
    FOCUS(4, "关注引导"),
    QR_SIGN(5, "二维码签名"),
    ORIGIN_ARTICLE(6, "阅读原文引导");

    private int key;
    private String desc;

    ArticleWidgetTypeEnum(int key, String desc) {
        this.desc = desc;
        this.key = key;
    }
    public static ArticleWidgetTypeEnum getEnum(int key) {

        for (ArticleWidgetTypeEnum enm : ArticleWidgetTypeEnum.values()) {
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
