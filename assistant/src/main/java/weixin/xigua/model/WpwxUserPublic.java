package weixin.xigua.model;

public class WpwxUserPublic {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_user_public.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_user_public.user_id
     *
     * @mbggenerated
     */
    private String userId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_user_public.public_id
     *
     * @mbggenerated
     */
    private Integer publicId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_user_public.type
     *
     * @mbggenerated
     */
    private Integer type;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_user_public.del_flag
     *
     * @mbggenerated
     */
    private Integer delFlag;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_user_public.id
     *
     * @return the value of wpwx_user_public.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_user_public.id
     *
     * @param id the value for wpwx_user_public.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_user_public.user_id
     *
     * @return the value of wpwx_user_public.user_id
     *
     * @mbggenerated
     */
    public String getUserId() {
        return userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_user_public.user_id
     *
     * @param userId the value for wpwx_user_public.user_id
     *
     * @mbggenerated
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_user_public.public_id
     *
     * @return the value of wpwx_user_public.public_id
     *
     * @mbggenerated
     */
    public Integer getPublicId() {
        return publicId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_user_public.public_id
     *
     * @param publicId the value for wpwx_user_public.public_id
     *
     * @mbggenerated
     */
    public void setPublicId(Integer publicId) {
        this.publicId = publicId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_user_public.type
     *
     * @return the value of wpwx_user_public.type
     *
     * @mbggenerated
     */
    public Integer getType() {
        return type;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_user_public.type
     *
     * @param type the value for wpwx_user_public.type
     *
     * @mbggenerated
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_user_public.del_flag
     *
     * @return the value of wpwx_user_public.del_flag
     *
     * @mbggenerated
     */
    public Integer getDelFlag() {
        return delFlag;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_user_public.del_flag
     *
     * @param delFlag the value for wpwx_user_public.del_flag
     *
     * @mbggenerated
     */
    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }
}