package weixin.xigua.enums;

/**
 * Created with IntelliJ IDEA.
 * User: tianbc
 * Date: 15-9-11
 * Time: 下午5:43
 * To change this template use File | Settings | File Templates.
 */
public enum UserPublicTypeEnum {

    //文章内容类型
    MANAGE(0, "管理"),
    FOCUS(1, "关注");

    private int key;
    private String desc;

    UserPublicTypeEnum(int key, String desc) {
        this.desc = desc;
        this.key = key;
    }
    public static UserPublicTypeEnum getEnum(int key) {

        for (UserPublicTypeEnum enm : UserPublicTypeEnum.values()) {
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
