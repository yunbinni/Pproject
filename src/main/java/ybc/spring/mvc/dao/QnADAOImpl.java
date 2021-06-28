package ybc.spring.mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ybc.spring.mvc.vo.QnA;

import java.util.List;
import java.util.Map;

// implements => 인터페이스를 구현하는 예약어
@Repository("qdao")
public class QnADAOImpl implements QnADAO {

    @Autowired private SqlSession sqlSession;

    @Override
    public int insertQnA(QnA q) {
        return sqlSession.insert("QnA.insertQnA", q);
    }

    @Override
    public int updateQnA(QnA q) {
        return 0;
    }

    @Override
    public int deleteQnA(String qno) {
        return 0;
    }

    @Override
    public List<QnA> selectQnA(int snum) {
        return sqlSession.selectList("QnA.selectQnA", snum);
    }

    @Override
    public List<QnA> findSelectQnA(Map<String, Object> param) {
        return sqlSession.selectList("QnA.findSelect", param);
    }

    @Override
    public QnA selectOneQnA(String qno) {
        return sqlSession.selectOne("QnA.selectOne", qno);
    }

    @Override
    public int selectCountQnA() {
        return sqlSession.selectOne("QnA.countQnA");
    }

    @Override
    public int selectCountQnA(Map<String, Object> param) {
        return sqlSession.selectOne("QnA.findSelectCount", param);
    }

    @Override
    public int viewCountQnA(String qno) {
        return sqlSession.update("QnA.viewsQnA", qno);
    }
}