package weixin.xigua.service;

import weixin.xigua.model.WpwxArticleTemplate;

import java.util.List;

/**
 * Created by worgen on 2015/12/24.
 */
public interface WpwxArticleTemplateService {

    public WpwxArticleTemplate getArticleTemplate(int id);
    public int updateArticleTemplate(int id, WpwxArticleTemplate wpwxArticleTemplate);
    public int insertArticleTemplate(WpwxArticleTemplate wpwxArticleTemplate);
    public int delArticleTemplate(int id);

    //获得公众号模板
    public List<WpwxArticleTemplate> getPublicArticleTemplates(int publicId);
}
