package weixin.xigua.service.Impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import weixin.xigua.dao.WpwxArticleWidgetMapper;
import weixin.xigua.enums.DelFlagEnum;
import weixin.xigua.model.WpwxArticleWidget;
import weixin.xigua.model.WpwxArticleWidgetExample;
import weixin.xigua.service.WpwxArticleWidgetService;

import java.util.List;

/**
 * Created by worgen on 2016/1/21.
 */
@Service
public class WpwxArticleWidgetServiceImpl implements WpwxArticleWidgetService {
    @Autowired
    private WpwxArticleWidgetMapper wpwxArticleWidgetMapper;

    @Override
    public WpwxArticleWidget getArticleWidget(int id) {
        return wpwxArticleWidgetMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateArticleWidget(int id, WpwxArticleWidget wpwxArticleWidget) {
        wpwxArticleWidget.setId(id);
        wpwxArticleWidgetMapper.updateByPrimaryKeySelective(wpwxArticleWidget);
        return 0;
    }

    @Override
    public int delArticleWidget(int id) {
        WpwxArticleWidget wpwxArticleWidget = getArticleWidget(id);
        wpwxArticleWidget.setDelFlag(DelFlagEnum.DELETE.getKey());
        wpwxArticleWidgetMapper.updateByPrimaryKeySelective(wpwxArticleWidget);
        return 0;
    }

    @Override
    public List<WpwxArticleWidget> getArticleWidgets(int type) {
        WpwxArticleWidgetExample wpwxArticleWidgetExample = new WpwxArticleWidgetExample();
        wpwxArticleWidgetExample.createCriteria().andTypeEqualTo(type).
                andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey());

        List<WpwxArticleWidget> wpwxArticleWidgets = wpwxArticleWidgetMapper.selectByExampleWithBLOBs(wpwxArticleWidgetExample);

        return wpwxArticleWidgets;
    }
}
