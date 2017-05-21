package weixin.xigua.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import weixin.xigua.dao.WpwxArticleTemplateMapper;
import weixin.xigua.enums.DelFlagEnum;
import weixin.xigua.model.WpwxArticleTemplate;
import weixin.xigua.model.WpwxArticleTemplateExample;
import weixin.xigua.service.WpwxArticleTemplateService;

import java.util.List;

/**
 * Created by worgen on 2016/1/21.
 */
@Service
public class WpwxArticleTemplateServiceImpl implements WpwxArticleTemplateService {
    @Autowired
    private WpwxArticleTemplateMapper wpwxArticleTemplateMapper;

    @Override
    public WpwxArticleTemplate getArticleTemplate(int id) {
        return wpwxArticleTemplateMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateArticleTemplate(int id, WpwxArticleTemplate wpwxArticleTemplate) {
        wpwxArticleTemplate.setId(id);
        wpwxArticleTemplateMapper.updateByPrimaryKeySelective(wpwxArticleTemplate);
        return 0;
    }

    @Override
    public int insertArticleTemplate(WpwxArticleTemplate wpwxArticleTemplate) {
        wpwxArticleTemplateMapper.insertSelective(wpwxArticleTemplate);
        return 0;
    }

    @Override
    public int delArticleTemplate(int id) {
        WpwxArticleTemplate wpwxArticleTemplate = getArticleTemplate(id);
        wpwxArticleTemplate.setDelFlag(DelFlagEnum.DELETE.getKey());
        wpwxArticleTemplateMapper.updateByPrimaryKeySelective(wpwxArticleTemplate);
        return 0;
    }

    @Override
    public List<WpwxArticleTemplate> getPublicArticleTemplates(int publicId) {
        WpwxArticleTemplateExample wpwxArticleTemplateExample = new WpwxArticleTemplateExample();
        wpwxArticleTemplateExample.createCriteria().
                andPublicIdEqualTo(publicId)
                .andDelFlagEqualTo(DelFlagEnum.NORMAL.getKey());
        List<WpwxArticleTemplate> wpwxArticleTemplates = wpwxArticleTemplateMapper.selectByExampleWithBLOBs(wpwxArticleTemplateExample);

        return wpwxArticleTemplates;
    }
}
