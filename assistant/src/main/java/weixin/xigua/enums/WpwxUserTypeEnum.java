package weixin.xigua.enums;

/**
 * Created with IntelliJ IDEA.
 * User: tianbc
 * Date: 15-9-11
 * Time: 下午5:43
 * To change this template use File | Settings | File Templates.
 */
public enum WpwxUserTypeEnum {

    //文章内容类型
    GLY(0, "管理员"),
    NORMAL(1, "普通用户");

    private int key;
    private String desc;

    WpwxUserTypeEnum(int key, String desc) {
        this.desc = desc;
        this.key = key;
    }
    public static WpwxUserTypeEnum getEnum(int key) {

        for (WpwxUserTypeEnum enm : WpwxUserTypeEnum.values()) {
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
