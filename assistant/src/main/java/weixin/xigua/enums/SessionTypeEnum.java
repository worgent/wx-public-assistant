package weixin.xigua.enums;

/**
 * Created with IntelliJ IDEA.
 * User: tianbc
 * Date: 15-9-11
 * Time: 下午5:43
 * To change this template use File | Settings | File Templates.
 */
public enum SessionTypeEnum {

    //session存储类型
    LOGIN_USER("login_user", "登录用户对象");

    private String key;
    private String desc;

    SessionTypeEnum(String key, String desc) {
        this.desc = desc;
        this.key = key;
    }
    public static SessionTypeEnum getEnum(String key) {

        for (SessionTypeEnum enm : SessionTypeEnum.values()) {
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
