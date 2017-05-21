package weixin.xigua.service;

import weixin.xigua.model.WpwxArticle;
import weixin.xigua.model.WpwxArticleAssociation;
import weixin.xigua.model.WpwxUserArticle;

import java.util.List;

/**
 * Created by worgen on 2015/12/23.
 */
public interface WpwxUserArticleService {
    //导入素材
    public WpwxArticle importMaterial(String mpUrl);
    //收集素材
    public int collectMaterial(String userId, int articleId);
    //取消素材
    public int cancelCollectMaterial(String userId, int articleId);
    //判断是否收集
    public boolean isMaterialCollect(String userId, int articleId);
    //查询素材
    public WpwxUserArticle getMaterial(String userId, int articleId);
    //查询用户素材
    public List<WpwxArticleAssociation> getUserMaterials(String userId);
    //查询用户素材数目
    public int getUserMaterialCount(String userId);

    public WpwxUserArticle getUserArticle(int id);
    public int updateUserArticle(int id, WpwxUserArticle wpwxUserArticle);
    public int delUserArticle(int id);
}
