package weixin.xigua.dao;

import org.apache.ibatis.annotations.Param;
import weixin.xigua.model.WpwxUserPublic;
import weixin.xigua.model.WpwxUserPublicAssociation;
import weixin.xigua.model.WpwxUserPublicAssociationExample;
import weixin.xigua.model.WpwxUserPublicExample;

import java.util.List;

public interface WpwxUserPublicAssociationMapper {
   public List<WpwxUserPublicAssociation> selectAssociationsByExample(WpwxUserPublicAssociationExample wpwxUserPublicAssociationExample);
}