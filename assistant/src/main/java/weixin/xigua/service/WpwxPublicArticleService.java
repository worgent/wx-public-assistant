package weixin.xigua.service;

import weixin.xigua.model.WpwxMaterial;
import weixin.xigua.model.WpwxPublicArticle;
import weixin.xigua.model.WpwxPublicArticleAssociation;
import weixin.xigua.model.WpwxUserArticle;

import java.util.List;

/**
 * Created by worgen on 2015/12/23.
 */
public interface WpwxPublicArticleService {
    //收集素材
    public int addSyncMaterial(String userId, List<Integer> publicIds, List<Integer> articleIds);
    public int addSyncMaterial(WpwxMaterial wpwxMaterial);
    //取消素材
    public int delSyncMaterial(int materialId);
    //判断是否收集
//    public boolean isSyncMaterial(int publicId, int articleId);
    //
    public WpwxMaterial getSyncMaterial(int materialId);

    //查询公众号发布文章
    public List<WpwxPublicArticleAssociation> getPublishArticles(int publicId);
}
