package ybc.spring.mvc.service;

import ybc.spring.mvc.vo.Park;

import java.util.List;

public interface ParkService {
    List<Park> readPark(String addr, String weekday, String saturday, String holiday, String gubun, String buze);
    int countPark(String addr, String weekday, String saturday, String holiday, String gubun, String buze);
}
