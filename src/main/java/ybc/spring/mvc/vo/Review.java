package ybc.spring.mvc.vo;

public class Review {
    protected String rvno;
    protected String title;
    protected String userid;
    protected String contents;
    protected String regdate;
    protected String views;
    protected String likes; //추천
    protected String nlikes; //비추천
    protected String fnames;
    protected String fsizes;
    protected String uuid;
    protected String loc;
    protected String todie;

    public String getTodie() {
        return todie;
    }

    public void setTodie(String todie) {
        this.todie = todie;
    }

    public String getLoc() {
        return loc;
    }

    public void setLoc(String loc) {
        this.loc = loc;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getFnames() {
        return fnames;
    }

    public void setFnames(String fnames) {
        this.fnames = fnames;
    }

    public String getFsizes() {
        return fsizes;
    }

    public void setFsizes(String fsizes) {
        this.fsizes = fsizes;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getRvno() {
        return rvno;
    }

    public void setRvno(String rvno) {
        this.rvno = rvno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public String getViews() {
        return views;
    }

    public void setViews(String views) {
        this.views = views;
    }

    public String getLikes() {
        return likes;
    }

    public void setLikes(String likes) {
        this.likes = likes;
    }

    public String getNlikes() {
        return nlikes;
    }

    public void setNlikes(String nlikes) {
        this.nlikes = nlikes;
    }
}