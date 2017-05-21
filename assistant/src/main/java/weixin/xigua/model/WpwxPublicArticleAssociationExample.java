package weixin.xigua.model;

import java.util.ArrayList;
import java.util.List;

public class WpwxPublicArticleAssociationExample extends WpwxPublicArticleExample{

    protected WpwxPublicExample wpwxPublicExample;
    protected WpwxArticleExample wpwxArticleExample;
    public WpwxPublicExample getWpwxPublicExample() {
        return wpwxPublicExample;
    }

    public void setWpwxPublicExample(WpwxPublicExample wpwxPublicExample) {
        this.wpwxPublicExample = wpwxPublicExample;
    }

    public WpwxArticleExample getWpwxArticleExample() {
        return wpwxArticleExample;
    }

    public void setWpwxArticleExample(WpwxArticleExample wpwxArticleExample) {
        this.wpwxArticleExample = wpwxArticleExample;
    }
}