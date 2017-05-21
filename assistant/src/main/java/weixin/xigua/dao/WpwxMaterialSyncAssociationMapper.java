package weixin.xigua.dao;

import org.apache.ibatis.annotations.Param;
import weixin.xigua.model.WpwxMaterialSync;
import weixin.xigua.model.WpwxMaterialSyncAssociation;
import weixin.xigua.model.WpwxMaterialSyncAssociationExample;
import weixin.xigua.model.WpwxMaterialSyncExample;

import java.util.List;

public interface WpwxMaterialSyncAssociationMapper {
    public WpwxMaterialSyncAssociation selectAssociationByPrimaryKey(int id);
    public List<WpwxMaterialSyncAssociation> selectAssociationByExample(WpwxMaterialSyncAssociationExample wpwxMaterialSyncAssociationExample);

}