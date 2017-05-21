package weixin.xigua.dao;

import weixin.xigua.model.*;

import java.util.List;

public interface WpwxArticleAssociationMapper{
    //查询全局素材，带关注参数
    public List<WpwxArticleAssociation> selectMaterialGlobals(WpwxArticleAssociationExample wpwxArticleAssociationExample);
    //查询我的素材
    public List<WpwxArticleAssociation> selectMyMaterials(WpwxArticleAssociationExample wpwxArticleAssociationExample);
}