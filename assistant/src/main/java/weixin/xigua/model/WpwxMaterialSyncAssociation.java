package weixin.xigua.model;

import java.util.Date;
import java.util.List;

public class WpwxMaterialSyncAssociation extends  WpwxMaterialSync{
    private List<WpwxMaterial> wpwxMaterials;
    private WpwxPublic wpwxPublic;

    public WpwxMaterialSyncAssociation(){
        super();
    }
//    public WpwxMaterialSyncAssociation(Integer id, Integer publicId, String mediaId, Date createdTime, Date updatedTime, Integer delFlag) {
//        super(id, publicId, mediaId, createdTime, updatedTime, delFlag);
//    }

    public List<WpwxMaterial> getWpwxMaterials() {
        return wpwxMaterials;
    }

    public void setWpwxMaterials(List<WpwxMaterial> wpwxMaterials) {
        this.wpwxMaterials = wpwxMaterials;
    }

    public WpwxPublic getWpwxPublic() {
        return wpwxPublic;
    }

    public void setWpwxPublic(WpwxPublic wpwxPublic) {
        this.wpwxPublic = wpwxPublic;
    }
}