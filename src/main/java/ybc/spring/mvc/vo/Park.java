package ybc.spring.mvc.vo;

public class Park {
    protected String pno;               // 주차장관리번호
    protected String name;              // 주차장명
    protected String gubun;             // 주차장구분             
    protected String type;              // 주차장유형
    protected String addr1;             // 소재지도로명주소
    protected String addr2;             // 소재지지번주소
    protected String sections;          // 주차구획수
    protected String gupzi;             // 급지구획수
    protected String buze;              // 부제시행구분
    protected String busday;            // 운영요일            
    protected String shour;             // 평일운영시작시각
    protected String ehour;             // 평일운영종료시각
    protected String satshour;          // 토요일운영시작시각
    protected String satehour;          // 토요일운영종료시각
    protected String gongshour;         // 공휴일운영시작시각
    protected String gongehour;         // 공휴일운영종료시각
    protected String feeinfo;           // 요금정보
    protected String basichour;         // 주차기본시간
    protected String basicfee;          // 주차기본요금
    protected String addunithour;       // 추가단위시간
    protected String addunitfee;        // 추가단위요금
    protected String onedaypasshour;    // 1일주차권요금적용시간
    protected String ondaypassfee;      // 1일주차권요금
    protected String monthpassfee;      // 월정기권요금
    protected String payment;           // 결제방법
    protected String detail;            // 특기사항
    protected String operator;          // 관리기관명
    protected String telephone;         // 전화번호
    protected double lng;               // 위도
    protected double lat;               // 경도
    protected String lastdatarenewal;   // 데이터기준일자
    protected String providercode;      // 제공기관코드
    protected String providername;      // 제공기관명

    public String getPno() {
        return pno;
    }

    public void setPno(String pno) {
        this.pno = pno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGubun() {
        return gubun;
    }

    public void setGubun(String gubun) {
        this.gubun = gubun;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAddr1() {
        return addr1;
    }

    public void setAddr1(String addr1) {
        this.addr1 = addr1;
    }

    public String getAddr2() {
        return addr2;
    }

    public void setAddr2(String addr2) {
        this.addr2 = addr2;
    }

    public String getSections() {
        return sections;
    }

    public void setSections(String sections) {
        this.sections = sections;
    }

    public String getGupzi() {
        return gupzi;
    }

    public void setGupzi(String gupzi) {
        this.gupzi = gupzi;
    }

    public String getBuze() {
        return buze;
    }

    public void setBuze(String buze) {
        this.buze = buze;
    }

    public String getBusday() {
        return busday;
    }

    public void setBusday(String busday) {
        this.busday = busday;
    }

    public String getShour() {
        return shour;
    }

    public void setShour(String shour) {
        this.shour = shour;
    }

    public String getEhour() {
        return ehour;
    }

    public void setEhour(String ehour) {
        this.ehour = ehour;
    }

    public String getSatshour() {
        return satshour;
    }

    public void setSatshour(String satshour) {
        this.satshour = satshour;
    }

    public String getSatehour() {
        return satehour;
    }

    public void setSatehour(String satehour) {
        this.satehour = satehour;
    }

    public String getGongshour() {
        return gongshour;
    }

    public void setGongshour(String gongshour) {
        this.gongshour = gongshour;
    }

    public String getGongehour() {
        return gongehour;
    }

    public void setGongehour(String gongehour) {
        this.gongehour = gongehour;
    }

    public String getFeeinfo() {
        return feeinfo;
    }

    public void setFeeinfo(String feeinfo) {
        this.feeinfo = feeinfo;
    }

    public String getBasichour() {
        return basichour;
    }

    public void setBasichour(String basichour) {
        this.basichour = basichour;
    }

    public String getBasicfee() {
        return basicfee;
    }

    public void setBasicfee(String basicfee) {
        this.basicfee = basicfee;
    }

    public String getAddunithour() {
        return addunithour;
    }

    public void setAddunithour(String addunithour) {
        this.addunithour = addunithour;
    }

    public String getAddunitfee() {
        return addunitfee;
    }

    public void setAddunitfee(String addunitfee) {
        this.addunitfee = addunitfee;
    }

    public String getOnedaypasshour() {
        return onedaypasshour;
    }

    public void setOnedaypasshour(String onedaypasshour) {
        this.onedaypasshour = onedaypasshour;
    }

    public String getOndaypassfee() {
        return ondaypassfee;
    }

    public void setOndaypassfee(String ondaypassfee) {
        this.ondaypassfee = ondaypassfee;
    }

    public String getMonthpassfee() {
        return monthpassfee;
    }

    public void setMonthpassfee(String monthpassfee) {
        this.monthpassfee = monthpassfee;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public double getLng() {
        return lng;
    }

    public void setLng(double lng) {
        this.lng = lng;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public String getLastdatarenewal() {
        return lastdatarenewal;
    }

    public void setLastdatarenewal(String lastdatarenewal) {
        this.lastdatarenewal = lastdatarenewal;
    }

    public String getProvidercode() {
        return providercode;
    }

    public void setProvidercode(String providercode) {
        this.providercode = providercode;
    }

    public String getProvidername() {
        return providername;
    }

    public void setProvidername(String providername) {
        this.providername = providername;
    }
}