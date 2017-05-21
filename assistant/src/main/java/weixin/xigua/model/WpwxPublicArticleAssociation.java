package weixin.xigua.model;

import java.util.Date;

public class WpwxPublicArticleAssociation extends WpwxPublicArticle{
    private WpwxArticle wpwxArticle;
    private WpwxPublic wpwxPublic;

    public WpwxPublicArticleAssociation(){
        super();
    }
//    public WpwxPublicArticleAssociation(Integer id, Integer publicId, Integer articleId, Integer type, Integer delFlag, Date createdTime, Date updatedTime) {
//        super(id,publicId,articleId,type,delFlag,createdTime,updatedTime);
//    }

    public WpwxArticle getWpwxArticle() {
        return wpwxArticle;
    }

    public void setWpwxArticle(WpwxArticle wpwxArticle) {
        this.wpwxArticle = wpwxArticle;
    }

    public WpwxPublic getWpwxPublic() {
        return wpwxPublic;
    }

    public void setWpwxPublic(WpwxPublic wpwxPublic) {
        this.wpwxPublic = wpwxPublic;
    }
}