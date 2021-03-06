package weixin.xigua.model;

import java.util.Date;

public class WpwxArticle {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_article.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_article.weixin_public_id
     *
     * @mbggenerated
     */
    private String weixinPublicId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_article.title
     *
     * @mbggenerated
     */
    private String title;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_article.link
     *
     * @mbggenerated
     */
    private String link;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_article.read_num
     *
     * @mbggenerated
     */
    private Integer readNum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_article.support
     *
     * @mbggenerated
     */
    private Integer support;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_article.category_id
     *
     * @mbggenerated
     */
    private String categoryId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_article.summary
     *
     * @mbggenerated
     */
    private String summary;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_article.local_thumbnail
     *
     * @mbggenerated
     */
    private String localThumbnail;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_article.thumbnail
     *
     * @mbggenerated
     */
    private String thumbnail;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_article.source_name
     *
     * @mbggenerated
     */
    private String sourceName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_article.publish_time
     *
     * @mbggenerated
     */
    private Date publishTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_article.created_time
     *
     * @mbggenerated
     */
    private Date createdTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_article.update_time
     *
     * @mbggenerated
     */
    private Date updateTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_article.del_flag
     *
     * @mbggenerated
     */
    private Integer delFlag;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_article.id
     *
     * @return the value of wpwx_article.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_article.id
     *
     * @param id the value for wpwx_article.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_article.weixin_public_id
     *
     * @return the value of wpwx_article.weixin_public_id
     *
     * @mbggenerated
     */
    public String getWeixinPublicId() {
        return weixinPublicId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_article.weixin_public_id
     *
     * @param weixinPublicId the value for wpwx_article.weixin_public_id
     *
     * @mbggenerated
     */
    public void setWeixinPublicId(String weixinPublicId) {
        this.weixinPublicId = weixinPublicId == null ? null : weixinPublicId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_article.title
     *
     * @return the value of wpwx_article.title
     *
     * @mbggenerated
     */
    public String getTitle() {
        return title;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_article.title
     *
     * @param title the value for wpwx_article.title
     *
     * @mbggenerated
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_article.link
     *
     * @return the value of wpwx_article.link
     *
     * @mbggenerated
     */
    public String getLink() {
        return link;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_article.link
     *
     * @param link the value for wpwx_article.link
     *
     * @mbggenerated
     */
    public void setLink(String link) {
        this.link = link == null ? null : link.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_article.read_num
     *
     * @return the value of wpwx_article.read_num
     *
     * @mbggenerated
     */
    public Integer getReadNum() {
        return readNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_article.read_num
     *
     * @param readNum the value for wpwx_article.read_num
     *
     * @mbggenerated
     */
    public void setReadNum(Integer readNum) {
        this.readNum = readNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_article.support
     *
     * @return the value of wpwx_article.support
     *
     * @mbggenerated
     */
    public Integer getSupport() {
        return support;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_article.support
     *
     * @param support the value for wpwx_article.support
     *
     * @mbggenerated
     */
    public void setSupport(Integer support) {
        this.support = support;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_article.category_id
     *
     * @return the value of wpwx_article.category_id
     *
     * @mbggenerated
     */
    public String getCategoryId() {
        return categoryId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_article.category_id
     *
     * @param categoryId the value for wpwx_article.category_id
     *
     * @mbggenerated
     */
    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId == null ? null : categoryId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_article.summary
     *
     * @return the value of wpwx_article.summary
     *
     * @mbggenerated
     */
    public String getSummary() {
        return summary;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_article.summary
     *
     * @param summary the value for wpwx_article.summary
     *
     * @mbggenerated
     */
    public void setSummary(String summary) {
        this.summary = summary == null ? null : summary.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_article.local_thumbnail
     *
     * @return the value of wpwx_article.local_thumbnail
     *
     * @mbggenerated
     */
    public String getLocalThumbnail() {
        return localThumbnail;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_article.local_thumbnail
     *
     * @param localThumbnail the value for wpwx_article.local_thumbnail
     *
     * @mbggenerated
     */
    public void setLocalThumbnail(String localThumbnail) {
        this.localThumbnail = localThumbnail == null ? null : localThumbnail.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_article.thumbnail
     *
     * @return the value of wpwx_article.thumbnail
     *
     * @mbggenerated
     */
    public String getThumbnail() {
        return thumbnail;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_article.thumbnail
     *
     * @param thumbnail the value for wpwx_article.thumbnail
     *
     * @mbggenerated
     */
    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail == null ? null : thumbnail.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_article.source_name
     *
     * @return the value of wpwx_article.source_name
     *
     * @mbggenerated
     */
    public String getSourceName() {
        return sourceName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_article.source_name
     *
     * @param sourceName the value for wpwx_article.source_name
     *
     * @mbggenerated
     */
    public void setSourceName(String sourceName) {
        this.sourceName = sourceName == null ? null : sourceName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_article.publish_time
     *
     * @return the value of wpwx_article.publish_time
     *
     * @mbggenerated
     */
    public Date getPublishTime() {
        return publishTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_article.publish_time
     *
     * @param publishTime the value for wpwx_article.publish_time
     *
     * @mbggenerated
     */
    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_article.created_time
     *
     * @return the value of wpwx_article.created_time
     *
     * @mbggenerated
     */
    public Date getCreatedTime() {
        return createdTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_article.created_time
     *
     * @param createdTime the value for wpwx_article.created_time
     *
     * @mbggenerated
     */
    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_article.update_time
     *
     * @return the value of wpwx_article.update_time
     *
     * @mbggenerated
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_article.update_time
     *
     * @param updateTime the value for wpwx_article.update_time
     *
     * @mbggenerated
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_article.del_flag
     *
     * @return the value of wpwx_article.del_flag
     *
     * @mbggenerated
     */
    public Integer getDelFlag() {
        return delFlag;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_article.del_flag
     *
     * @param delFlag the value for wpwx_article.del_flag
     *
     * @mbggenerated
     */
    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }
}