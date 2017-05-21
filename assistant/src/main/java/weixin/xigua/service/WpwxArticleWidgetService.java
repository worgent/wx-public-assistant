package weixin.xigua.service;

import weixin.xigua.model.WpwxArticle;
import weixin.xigua.model.WpwxArticleAssociation;
import weixin.xigua.model.WpwxArticleContent;
import weixin.xigua.model.WpwxArticleWidget;

import java.util.List;

/**
 * Created by worgen on 2015/12/24.
 */
public interface WpwxArticleWidgetService {

    public WpwxArticleWidget getArticleWidget(int id);
    public int updateArticleWidget(int id, WpwxArticleWidget wpwxArticleWidget);
    public int delArticleWidget(int id);

    //根据类型获得组件列表
    public List<WpwxArticleWidget> getArticleWidgets(int type);
}
