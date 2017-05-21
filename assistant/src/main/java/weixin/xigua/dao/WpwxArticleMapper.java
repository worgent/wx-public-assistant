package weixin.xigua.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import weixin.xigua.model.WpwxArticle;
import weixin.xigua.model.WpwxArticleExample;

public interface WpwxArticleMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_article
     *
     * @mbggenerated
     */
    int countByExample(WpwxArticleExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_article
     *
     * @mbggenerated
     */
    int deleteByExample(WpwxArticleExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_article
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_article
     *
     * @mbggenerated
     */
    int insert(WpwxArticle record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_article
     *
     * @mbggenerated
     */
    int insertSelective(WpwxArticle record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_article
     *
     * @mbggenerated
     */
    List<WpwxArticle> selectByExample(WpwxArticleExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_article
     *
     * @mbggenerated
     */
    WpwxArticle selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_article
     *
     * @mbggenerated
     */
    int updateByExampleSelective(@Param("record") WpwxArticle record, @Param("example") WpwxArticleExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_article
     *
     * @mbggenerated
     */
    int updateByExample(@Param("record") WpwxArticle record, @Param("example") WpwxArticleExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_article
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(WpwxArticle record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_article
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(WpwxArticle record);
}