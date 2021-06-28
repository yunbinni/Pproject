package ybc.spring.mvc.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ybc.spring.mvc.dao.FAQDAO;
import ybc.spring.mvc.vo.FAQ;
import ybc.spring.mvc.vo.QnA;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("fsrv")
public class FAQServiceImpl implements FAQService {

    @Autowired private FAQDAO fdao;

    @Override
    public boolean newFAQ(FAQ f) {
        return false;
    }

    @Override
    public boolean modifyFAQ(FAQ f) { return false; }

    @Override
    public boolean removeFAQ(String fno) {
        return false;
    }

    @Override
    public List<FAQ> readFAQ(String cp) {
        int snum = (Integer.parseInt(cp) - 1) * 30;
        return fdao.selectFAQ(snum);
    }

    @Override
    public List<FAQ> readFAQ(String cp, String ftype, String fkey) {
        int snum = (Integer.parseInt(cp) - 1) * 30;

        Map<String, Object> params = new HashMap<>();
        params.put("snum", snum);
        params.put("ftype", ftype);
        params.put("fkey", fkey);

        return fdao.findSelectFAQ(params);
    }

    @Override
    public QnA readOneFAQ(String fno) {
        return fdao.selectOneFAQ(fno);
    }

    @Override
    public int countFAQ() {
        return fdao.selectCountFAQ();
    }

    @Override
    public int countFAQ(String ftype, String fkey) {
        Map<String, Object> params = new HashMap<>();
        params.put("ftype", ftype);
        params.put("fkey", fkey);

        return fdao.selectCountFAQ(params);
    }

    @Override
    public boolean viewCountFAQ(String fno) {
        boolean IsUpdated = false;
        if (fdao.viewCountFAQ(fno) > 0 ) IsUpdated = true;
        return IsUpdated ;
    }
}
