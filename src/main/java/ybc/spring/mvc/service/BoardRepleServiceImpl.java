package ybc.spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ybc.spring.mvc.dao.BoardRepleDAO;
import ybc.spring.mvc.vo.Reple;

import java.util.List;

@Repository("brsrv")
public class BoardRepleServiceImpl implements BoardRepleService{

    @Autowired private BoardRepleDAO brdao;

    @Override
    public List<Reple> readReple(String bdno) {
        return brdao.selectReple(bdno);
    }

    @Override
    public boolean newComment(Reple r) {
        boolean isInserted = false;
        if(brdao.insertComment(r) > 0) {
            isInserted = true;
        }

        return isInserted;
    }

    @Override
    public boolean newReple(Reple r) {
        boolean isInserted = false;
        if(brdao.insertReple(r) > 0) {
            isInserted = true;
        }
        return isInserted;
    }

    @Override
    public boolean modifyReple(Reple r) {
        boolean isModified = false;

        if(brdao.updateReple(r) > 0) {
            isModified = true;
        }

        return isModified;
    }

    @Override
    public boolean removeReple(String rno) {
        boolean isRemoved = false;

        if(brdao.deleteReple(rno) > 0) {
            isRemoved = true;
        }

        return isRemoved;
    }
}
