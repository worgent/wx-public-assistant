package weixin.xigua.enums;

/**
 * Created with IntelliJ IDEA.
 * User: tianbc
 * Date: 15-9-11
 * Time: 下午5:43
 * To change this template use File | Settings | File Templates.
 */
public enum UserPublicStatusEnum {

    //文章内容类型
    SUCCESS(0, "成功"),
    FAIL(1, "失败");

    private int key;
    private String desc;

    UserPublicStatusEnum(int key, String desc) {
        this.desc = desc;
        this.key = key;
    }
    public static UserPublicStatusEnum getEnum(int key) {

        for (UserPublicStatusEnum enm : UserPublicStatusEnum.values()) {
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
