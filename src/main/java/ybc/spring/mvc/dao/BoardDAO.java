package ybc.spring.mvc.dao;

import ybc.spring.mvc.vo.Board;

import java.util.List;
import java.util.Map;

public interface BoardDAO {

    int insertBoard(Board b);
    int updateBoard(Board b);
    int deleteBoard(String bdno);

    List<Board> selectBoard(int snum);
    List<Board> findSelectBoard(Map<String, Object> param);
    Board selectOneBoard(String bdno);

    int selectCountBoard();
    int selectCountBoard(Map<String, Object> param);
    int viewCountBoard(String bdno);

    int updateThumbs(String bdno);

    List<Board> selectThumbsBoard(int snum);

    List<Board> selecViewtBoard(int snum);
}
