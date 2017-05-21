package weixin.xigua.enums;

/**
 * Created with IntelliJ IDEA.
 * User: tianbc
 * Date: 15-9-11
 * Time: 下午5:43
 * To change this template use File | Settings | File Templates.
 */
public enum ArticleSyncStatusTypeEnum {

    //文章内容类型
    NOT_SYNC(0, "未同步"),
    ALREADY_SYNC(1, "已同步");

    private int key;
    private String desc;

    ArticleSyncStatusTypeEnum(int key, String desc) {
        this.desc = desc;
        this.key = key;
    }
    public static ArticleSyncStatusTypeEnum getEnum(int key) {

        for (ArticleSyncStatusTypeEnum enm : ArticleSyncStatusTypeEnum.values()) {
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
