package ybc.spring.mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ybc.spring.mvc.vo.Reple;

import java.util.List;

@Repository("brdao")
public class BoardRepleDAOImpl implements BoardRepleDAO{

    @Autowired
    private SqlSession sqlSession;


    @Override
    public List<Reple> selectReple(String bdno) {
        return sqlSession.selectList("bdreple.selectReply", bdno);
    }

    @Override
    public int insertComment(Reple r) {
        r.setRpno(selectLastRno());
        return sqlSession.insert("bdreple.insertComment", r);
    }

    @Override
    public int insertReple(Reple r) {
        return sqlSession.insert("bdreple.insertComment", r);
    }

    private String selectLastRno() {
        return sqlSession.selectOne("bdreple.selectLastRno");
    }

}
