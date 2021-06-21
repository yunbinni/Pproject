package ybc.spring.mvc.dao;

import ybc.spring.mvc.vo.Reple;

import java.util.List;

public interface BoardRepleDAO {

    List<Reple> selectReple(String bdno);

    int insertComment(Reple r);
    int insertReple(Reple r);

}
