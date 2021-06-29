package ybc.spring.mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ybc.spring.mvc.vo.Board;

import java.util.List;
import java.util.Map;

@Repository("bdao")
public class BoardDAOImpl implements BoardDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public int insertBoard(Board b) {
        return sqlSession.insert("board.insertBoard", b);
    }

    @Override
    public int updateBoard(Board b) {
        return sqlSession.update("board.updateBoard", b);
    }

    @Override
    public int deleteBoard(String bdno) {
        return sqlSession.delete("board.deleteBoard", bdno);
    }

    @Override
    public List<Board> selectBoard(int snum) {
        return sqlSession.selectList("board.selectBoard", snum);
    }

    @Override
    public List<Board> findSelectBoard(Map<String, Object> param) {
        return sqlSession.selectList("board.findSelect", param);
    }

    @Override
    public Board selectOneBoard(String bdno) {
        return sqlSession.selectOne("board.selectOne", bdno);
    }

    @Override
    public int selectCountBoard() {
        return sqlSession.selectOne("board.countBoard");
    }

    @Override
    public int selectCountBoard(Map<String, Object> param) {
        return sqlSession.selectOne("board.findSelectCount", param);
    }

    @Override
    public int viewCountBoard(String bdno) {
        return sqlSession.update("board.viewsBoard", bdno);
    }

    @Override
    public int updateThumbs(String bdno) {
        return sqlSession.update("board.thumbsupBoard", bdno);
    }

    @Override
    public List<Board> selectThumbsBoard(int snum) {
        return sqlSession.selectList("board.selectThumbsBoard", snum);
    }

    @Override
    public List<Board> selecViewtBoard(int snum) {
        return sqlSession.selectList("board.selectViewBoard", snum);
    }
}
