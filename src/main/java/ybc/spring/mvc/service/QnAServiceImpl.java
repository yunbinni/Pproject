package ybc.spring.mvc.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ybc.spring.mvc.dao.QnADAO;
import ybc.spring.mvc.vo.QnA;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("qsrv")
public class QnAServiceImpl implements QnAService {

    @Autowired private QnADAO qdao;

    @Override
    public boolean newQnA(QnA q) {
        boolean isInserted = false;
        if (qdao.insertQnA(q) > 0 ) isInserted = true;
        return isInserted;

    }

    @Override
    public boolean modifyQnA(QnA q) {
        return false;
    }

    @Override
    public boolean removeQnA(String qno) {
        return false;
    }

    @Override
    public List<QnA> readQnA(String cp) {
        int snum = (Integer.parseInt(cp) - 1) * 30;
        return qdao.selectQnA(snum);
    }

    @Override
    public List<QnA> readQnA(String cp, String ftype, String fkey) {
        int snum = (Integer.parseInt(cp) - 1) * 30;

        Map<String, Object> params = new HashMap<>();
        params.put("snum", snum);
        params.put("ftype", ftype);
        params.put("fkey", fkey);

        return qdao.findSelectQnA(params);
    }

    @Override
    public QnA readOneQnA(String qno) {
        return qdao.selectOneQnA(qno);
    }

    @Override
    public int countQnA() {
        return qdao.selectCountQnA();
    }

    @Override
    public int countQnA(String ftype, String fkey) {
        Map<String, Object> params = new HashMap<>();
        params.put("ftype", ftype);
        params.put("fkey", fkey);

        return qdao.selectCountQnA(params);
    }

    @Override
    public boolean viewCountQnA(String qno) {
        boolean IsUpdated = false;
        if (qdao.viewCountQnA(qno) > 0 ) IsUpdated = true;
        return IsUpdated ;
    }
}
