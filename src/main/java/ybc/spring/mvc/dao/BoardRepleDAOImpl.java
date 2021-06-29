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

    @Override
    public int updateReple(Reple r) {
        return sqlSession.update("bdreple.updateReple", r);
    }

    @Override
    public int deleteReple(String rno) {
        return sqlSession.delete("bdreple.deleteReple", rno);
    }

    private String selectLastRno() {
        return sqlSession.selectOne("bdreple.selectLastRno");
    }

}
