package weixin.xigua.model;

public class WpwxArticleContent {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_article_content.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_article_content.article_id
     *
     * @mbggenerated
     */
    private Integer articleId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wpwx_article_content.content
     *
     * @mbggenerated
     */
    private String content;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_article_content.id
     *
     * @return the value of wpwx_article_content.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_article_content.id
     *
     * @param id the value for wpwx_article_content.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_article_content.article_id
     *
     * @return the value of wpwx_article_content.article_id
     *
     * @mbggenerated
     */
    public Integer getArticleId() {
        return articleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_article_content.article_id
     *
     * @param articleId the value for wpwx_article_content.article_id
     *
     * @mbggenerated
     */
    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wpwx_article_content.content
     *
     * @return the value of wpwx_article_content.content
     *
     * @mbggenerated
     */
    public String getContent() {
        return content;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wpwx_article_content.content
     *
     * @param content the value for wpwx_article_content.content
     *
     * @mbggenerated
     */
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}