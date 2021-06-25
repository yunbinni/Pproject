package ybc.spring.mvc.dao;

import ybc.spring.mvc.vo.Park;

import java.util.List;
import java.util.Map;

public interface ParkDAO {
    List<Park> selectPark(Map<String, Object> params);
    int selectCnt(Map<String, Object> params);
}
