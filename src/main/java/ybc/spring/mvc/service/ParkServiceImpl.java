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
    public List<Park> readPark(String cp, String ftype, String fkey) {
        int snum = (Integer.parseInt(cp) - 1) * 10;

        Map<String, Object> params = new HashMap<>();
        params.put("snum", snum);
        params.put("ftype", ftype);
        params.put("fkey", fkey);

        return pdao.selectPark(params);
    }

    @Override
    public int countPark(String ftype, String fkey) {
        Map<String, Object> params = new HashMap<>();
        params.put("ftype", ftype);
        params.put("fkey", fkey);

        return pdao.selectCountPark(params);
    }
}
