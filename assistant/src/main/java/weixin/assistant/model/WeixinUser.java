package weixin.assistant.model;

public class WeixinUser {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column weixin_user.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column weixin_user.weixin_gzh_id
     *
     * @mbggenerated
     */
    private Integer weixinGzhId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column weixin_user.open_id
     *
     * @mbggenerated
     */
    private String openId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column weixin_user.nickname
     *
     * @mbggenerated
     */
    private String nickname;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column weixin_user.sex
     *
     * @mbggenerated
     */
    private Integer sex;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column weixin_user.province
     *
     * @mbggenerated
     */
    private String province;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column weixin_user.city
     *
     * @mbggenerated
     */
    private String city;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column weixin_user.country
     *
     * @mbggenerated
     */
    private String country;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column weixin_user.head_img_url
     *
     * @mbggenerated
     */
    private String headImgUrl;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column weixin_user.privilege
     *
     * @mbggenerated
     */
    private String privilege;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column weixin_user.status
     *
     * @mbggenerated
     */
    private Integer status;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table weixin_user
     *
     * @mbggenerated
     */
    public WeixinUser(Integer id, Integer weixinGzhId, String openId, String nickname, Integer sex, String province, String city, String country, String headImgUrl, String privilege, Integer status) {
        this.id = id;
        this.weixinGzhId = weixinGzhId;
        this.openId = openId;
        this.nickname = nickname;
        this.sex = sex;
        this.province = province;
        this.city = city;
        this.country = country;
        this.headImgUrl = headImgUrl;
        this.privilege = privilege;
        this.status = status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table weixin_user
     *
     * @mbggenerated
     */
    public WeixinUser() {
        super();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column weixin_user.id
     *
     * @return the value of weixin_user.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column weixin_user.id
     *
     * @param id the value for weixin_user.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column weixin_user.weixin_gzh_id
     *
     * @return the value of weixin_user.weixin_gzh_id
     *
     * @mbggenerated
     */
    public Integer getWeixinGzhId() {
        return weixinGzhId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column weixin_user.weixin_gzh_id
     *
     * @param weixinGzhId the value for weixin_user.weixin_gzh_id
     *
     * @mbggenerated
     */
    public void setWeixinGzhId(Integer weixinGzhId) {
        this.weixinGzhId = weixinGzhId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column weixin_user.open_id
     *
     * @return the value of weixin_user.open_id
     *
     * @mbggenerated
     */
    public String getOpenId() {
        return openId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column weixin_user.open_id
     *
     * @param openId the value for weixin_user.open_id
     *
     * @mbggenerated
     */
    public void setOpenId(String openId) {
        this.openId = openId == null ? null : openId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column weixin_user.nickname
     *
     * @return the value of weixin_user.nickname
     *
     * @mbggenerated
     */
    public String getNickname() {
        return nickname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column weixin_user.nickname
     *
     * @param nickname the value for weixin_user.nickname
     *
     * @mbggenerated
     */
    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column weixin_user.sex
     *
     * @return the value of weixin_user.sex
     *
     * @mbggenerated
     */
    public Integer getSex() {
        return sex;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column weixin_user.sex
     *
     * @param sex the value for weixin_user.sex
     *
     * @mbggenerated
     */
    public void setSex(Integer sex) {
        this.sex = sex;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column weixin_user.province
     *
     * @return the value of weixin_user.province
     *
     * @mbggenerated
     */
    public String getProvince() {
        return province;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column weixin_user.province
     *
     * @param province the value for weixin_user.province
     *
     * @mbggenerated
     */
    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column weixin_user.city
     *
     * @return the value of weixin_user.city
     *
     * @mbggenerated
     */
    public String getCity() {
        return city;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column weixin_user.city
     *
     * @param city the value for weixin_user.city
     *
     * @mbggenerated
     */
    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column weixin_user.country
     *
     * @return the value of weixin_user.country
     *
     * @mbggenerated
     */
    public String getCountry() {
        return country;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column weixin_user.country
     *
     * @param country the value for weixin_user.country
     *
     * @mbggenerated
     */
    public void setCountry(String country) {
        this.country = country == null ? null : country.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column weixin_user.head_img_url
     *
     * @return the value of weixin_user.head_img_url
     *
     * @mbggenerated
     */
    public String getHeadImgUrl() {
        return headImgUrl;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column weixin_user.head_img_url
     *
     * @param headImgUrl the value for weixin_user.head_img_url
     *
     * @mbggenerated
     */
    public void setHeadImgUrl(String headImgUrl) {
        this.headImgUrl = headImgUrl == null ? null : headImgUrl.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column weixin_user.privilege
     *
     * @return the value of weixin_user.privilege
     *
     * @mbggenerated
     */
    public String getPrivilege() {
        return privilege;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column weixin_user.privilege
     *
     * @param privilege the value for weixin_user.privilege
     *
     * @mbggenerated
     */
    public void setPrivilege(String privilege) {
        this.privilege = privilege == null ? null : privilege.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column weixin_user.status
     *
     * @return the value of weixin_user.status
     *
     * @mbggenerated
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column weixin_user.status
     *
     * @param status the value for weixin_user.status
     *
     * @mbggenerated
     */
    public void setStatus(Integer status) {
        this.status = status;
    }
}