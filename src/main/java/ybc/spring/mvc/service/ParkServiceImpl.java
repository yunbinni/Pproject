package ybc.spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ybc.spring.mvc.dao.ParkDAO;
import ybc.spring.mvc.vo.Park;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("psrv")
public class ParkServiceImpl implements ParkService{
    @Autowired
    private ParkDAO pdao;

    @Override
    public List<Park> readPark(String addr, String weekday, String saturday, String holiday, String gubun, String buze) {
        Map<String, Object> params = new HashMap<>();
        if(addr != "") params.put("addr", addr);
//        if(shour != "") params.put("shour", shour);
//        if(ehour != "") params.put("ehour", ehour);
//        params.put("satshour", satshour);
//        params.put("satehour", satehour);
//        params.put("holshour", holshour);
//        params.put("holehour", holehour);
        if(weekday != "") params.put("weekday", weekday);
        if(saturday != "") params.put("saturday", saturday);
        if(holiday != "") params.put("holiday", holiday);
        if(gubun != "") params.put("gubun", gubun);
        if(buze != "") params.put("buze", buze);
        return pdao.selectPark(params);
    }

    @Override
    public int countPark(String addr, String weekday, String saturday, String holiday, String gubun, String buze) {
        Map<String, Object> params = new HashMap<>();
        if(addr != "") params.put("addr", addr);
//        params.put("shour", shour);
//        params.put("ehour", ehour);
//        params.put("satshour", satshour);
//        params.put("satehour", satehour);
//        params.put("holshour", holshour);
//        params.put("holehour", holehour);
        if(weekday != "") params.put("weekday", weekday);
        if(saturday != "") params.put("saturday", saturday);
        if(holiday != "") params.put("holiday", holiday);
        if(gubun != "") params.put("gubun", gubun);
        if(buze != "") params.put("buze", buze);
        return pdao.selectCnt(params);
    }
}
