package ybc.spring.mvc.vo;

public class Member {
    protected String name;
    protected String birth;
    protected String userid;
    protected String passwd;
    protected String zipcode;
    protected String email;
    protected String favorite1;
    protected String favorite2;
    protected String favorite3;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFavorite1() {
        return favorite1;
    }

    public void setFavorite1(String favorite1) {
        this.favorite1 = favorite1;
    }

    public String getFavorite2() {
        return favorite2;
    }

    public void setFavorite2(String favorite2) {
        this.favorite2 = favorite2;
    }

    public String getFavorite3() {
        return favorite3;
    }

    public void setFavorite3(String favorite3) {
        this.favorite3 = favorite3;
    }
}
