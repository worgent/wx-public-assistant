package weixin.xigua.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class WpwxArticleAssociationExample extends  WpwxArticleExample{
    private WpwxUserArticleExample wpwxUserArticleExample;
    private String userId;

    public WpwxUserArticleExample getWpwxUserArticleExample() {
        return wpwxUserArticleExample;
    }

    public void setWpwxUserArticleExample(WpwxUserArticleExample wpwxUserArticleExample) {
        this.wpwxUserArticleExample = wpwxUserArticleExample;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}