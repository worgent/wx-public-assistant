package weixin.xigua.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import weixin.xigua.model.WpwxPublicArticle;
import weixin.xigua.model.WpwxPublicArticleExample;

public interface WpwxPublicArticleMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_public_article
     *
     * @mbggenerated
     */
    int countByExample(WpwxPublicArticleExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_public_article
     *
     * @mbggenerated
     */
    int deleteByExample(WpwxPublicArticleExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_public_article
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_public_article
     *
     * @mbggenerated
     */
    int insert(WpwxPublicArticle record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_public_article
     *
     * @mbggenerated
     */
    int insertSelective(WpwxPublicArticle record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_public_article
     *
     * @mbggenerated
     */
    List<WpwxPublicArticle> selectByExample(WpwxPublicArticleExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_public_article
     *
     * @mbggenerated
     */
    WpwxPublicArticle selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_public_article
     *
     * @mbggenerated
     */
    int updateByExampleSelective(@Param("record") WpwxPublicArticle record, @Param("example") WpwxPublicArticleExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_public_article
     *
     * @mbggenerated
     */
    int updateByExample(@Param("record") WpwxPublicArticle record, @Param("example") WpwxPublicArticleExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_public_article
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(WpwxPublicArticle record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_public_article
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(WpwxPublicArticle record);
}