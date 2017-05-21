package weixin.xigua.model;

import java.util.Date;

public class WpwxArticleAssociation extends WpwxArticle{
    private WpwxUserArticle wpwxUserArticle;
    private WpwxPublic wpwxPublic;

    public WpwxUserArticle getWpwxUserArticle() {
        return wpwxUserArticle;
    }

    public void setWpwxUserArticle(WpwxUserArticle wpwxUserArticle) {
        this.wpwxUserArticle = wpwxUserArticle;
    }

    public WpwxPublic getWpwxPublic() {
        return wpwxPublic;
    }

    public void setWpwxPublic(WpwxPublic wpwxPublic) {
        this.wpwxPublic = wpwxPublic;
    }
}