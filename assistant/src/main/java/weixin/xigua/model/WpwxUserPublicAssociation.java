package weixin.xigua.model;

public class WpwxUserPublicAssociation extends WpwxUserPublic{
    private WpwxPublic wpwxPublic;

    public WpwxPublic getWpwxPublic() {
        return wpwxPublic;
    }

    public void setWpwxPublic(WpwxPublic wpwxPublic) {
        this.wpwxPublic = wpwxPublic;
    }
}