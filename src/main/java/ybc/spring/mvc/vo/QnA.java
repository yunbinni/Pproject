package ybc.spring.mvc.vo;

public class QnA {

    protected String qno;
    protected String title;
    protected String userid;
    protected String regdate;
    protected String views;
    protected String thumbup;
    protected String contents;

    public String getQno() {
        return qno;
    }

    public void setQno(String qno) {
        this.qno = qno;
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

    public String getThumbup() {
        return thumbup;
    }

    public void setThumbup(String thumbup) {
        this.thumbup = thumbup;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }
}
