package ybc.spring.mvc.service;

import ybc.spring.mvc.vo.Park;

import java.util.List;

public interface ParkService {
    List<Park> readPark(String cp, String ftype, String fkey);
    int countPark(String ftype, String fkey);
}
