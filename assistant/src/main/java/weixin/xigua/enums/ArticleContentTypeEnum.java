package weixin.xigua.enums;

/**
 * Created with IntelliJ IDEA.
 * User: tianbc
 * Date: 15-9-11
 * Time: 下午5:43
 * To change this template use File | Settings | File Templates.
 */
public enum ArticleContentTypeEnum {

    //文章内容类型
    TEXT("text", "纯文字"),
    VIDEO("video", "视频"),
    IMAGE_TEXT("image_text", "图文");

    private String key;
    private String desc;

    ArticleContentTypeEnum(String key, String desc) {
        this.desc = desc;
        this.key = key;
    }
    public static ArticleContentTypeEnum getEnum(String key) {

        for (ArticleContentTypeEnum enm : ArticleContentTypeEnum.values()) {
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
