package ybc.spring.mvc.dao;

import ybc.spring.mvc.vo.Park;

import java.util.List;
import java.util.Map;

public interface ParkDAO {
    List<Park> selectPark(Map<String, Object> param);
    int selectCountPark(Map<String, Object> param);
}
