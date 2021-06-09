package ybc.spring.mvc.vo;

public class Review {
    protected String rvno;
    protected String userid;
    protected String contents;
    protected String regdate;

    public String getRvno() {
        return rvno;
    }

    public void setRvno(String rvno) {
        this.rvno = rvno;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }
}
