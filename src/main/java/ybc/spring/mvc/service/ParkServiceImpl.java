package ybc.spring.mvc.service;

import org.springframework.stereotype.Service;
import ybc.spring.mvc.vo.Park;

import java.util.List;

@Service("psrv")
public class ParkServiceImpl implements ParkService{
    @Override
    public List<Park> readPark(String cp, String ftype, String fkey) {
        return null;
    }

    @Override
    public int countPark(String ftype, String fkey) {
        return 0;
    }
}
