package ybc.spring.mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ybc.spring.mvc.vo.FAQ;
import ybc.spring.mvc.vo.QnA;

import java.util.List;
import java.util.Map;

@Repository("fdao")
public class FAQDAOImpl implements FAQDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public int insertFAQ(FAQ f) {
        return sqlSession.insert("FAQ.insertFAQ",f);
    }

    @Override
    public int updateFAQ(FAQ f) {
        return 0;
    }

    @Override
    public int deleteFAQ(String fno) {
        return 0;
    }

    @Override
    public List<FAQ> selectFAQ(int snum) {
        return sqlSession.selectList("FAQ.selectFAQ", snum);
    }

    @Override
    public List<FAQ> findSelectFAQ(Map<String, Object> param) {
        return sqlSession.selectList("FAQ.findSelect", param);
    }

    @Override
    public QnA selectOneFAQ(String fno) {
        return sqlSession.selectOne("FAQ.selectOne", fno);
    }

    @Override
    public int selectCountFAQ() {
        return sqlSession.selectOne("FAQ.countFAQ");
    }

    @Override
    public int selectCountFAQ(Map<String, Object> param) {
        return sqlSession.selectOne("FAQ.findSelectCount", param);
    }

    @Override
    public int viewCountFAQ(String fno) {
        return sqlSession.update("FAQ.viewsFAQ", fno);
    }
}
