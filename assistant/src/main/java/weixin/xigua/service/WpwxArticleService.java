package weixin.xigua.service;

import weixin.xigua.model.WpwxArticle;
import weixin.xigua.model.WpwxArticleAssociation;
import weixin.xigua.model.WpwxArticleContent;

import java.util.List;

/**
 * Created by worgen on 2015/12/24.
 */
public interface WpwxArticleService {

    public WpwxArticleContent getArticleContent(int articleId);

    public WpwxArticle getArticle(int id);
    public int updateArticle(int id, WpwxArticle wpwxArticle);
    public int delArticle(int id);

    //查询最近更新文章数目
    public int getRecentUpdateArticleCount();

    //查询全网素材
    public List<WpwxArticleAssociation> getMaterialGlobals(String userId, List<String> categoryIds,
                                                                   int pageIndex, int pageSize);
}
