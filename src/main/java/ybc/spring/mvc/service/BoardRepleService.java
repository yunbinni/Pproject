package ybc.spring.mvc.service;

import ybc.spring.mvc.vo.Reple;

import java.util.List;

public interface BoardRepleService {

    List<Reple> readReple(String bdno);

    boolean newComment(Reple r);
    boolean newReple(Reple r);

    boolean modifyReple(Reple r);

    boolean removeReple(String rno);
}
