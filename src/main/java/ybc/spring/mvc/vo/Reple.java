package ybc.spring.mvc.vo;

public class Reple {
    protected String rno;
    protected String rpno;
    protected String bdno;
    protected String userid;
    protected String contents;
    protected String regdate;

    public String getBdno() {
        return bdno;
    }

    public void setBdno(String bdno) {
        this.bdno = bdno;
    }

    public String getRno() {
        return rno;
    }

    public void setRno(String rno) {
        this.rno = rno;
    }

    public String getRpno() {
        return rpno;
    }

    public void setRpno(String rpno) {
        this.rpno = rpno;
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
