package ybc.spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ybc.spring.mvc.dao.BoardDAO;
import ybc.spring.mvc.vo.Board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("bsrv")
public class BoardServiceImpl implements BoardService{

    @Autowired
    private BoardDAO bdao;

    @Override
    public boolean newBoard(Board b) {
        boolean isInserted = false;
        if(bdao.insertBoard(b) > 0) {
            isInserted = true;
        }
        return isInserted;
    }

    @Override
    public boolean modifyBoard(Board b) {
        boolean isModified = false;

        if(bdao.updateBoard(b) > 0) {
            isModified = true;
        }

        return isModified;
    }

    @Override
    public boolean removeBoard(String bdno) {
        boolean isRemoved = false;

        if(bdao.deleteBoard(bdno) > 0) {
            isRemoved = true;
        }

        return isRemoved;
    }

    @Override
    public List<Board> readBoard(String cp) {
        int snum = 20 * (Integer.parseInt(cp) - 1);

        return bdao.selectBoard(snum);
    }

    @Override
    public List<Board> readBoard(String cp, String ftype, String fkey) {
        int snum = (Integer.parseInt(cp) -1) * 20;

        Map<String, Object> params = new HashMap<>();
        params.put("snum", snum);
        params.put("ftype", ftype);
        params.put("fkey", fkey);

        return bdao.findSelectBoard(params);
    }

    @Override
    public Board readOneBoard(String bdno) {
        return bdao.selectOneBoard(bdno);
    }

    @Override
    public int countBoard() {
        return bdao.selectCountBoard();
    }

    @Override
    public int countBoard(String ftype, String fkey) {
        Map<String, Object> params = new HashMap<>();
        params.put("ftype", ftype);
        params.put("fkey", fkey);

        return bdao.selectCountBoard(params);
    }

    @Override
    public boolean viewCountBoard(String bdno) {
        boolean isUpdated = false;

        if(bdao.viewCountBoard(bdno) > 0) {
            isUpdated = true;
        }

        return isUpdated;
    }

    @Override
    public void thumbsBoard(String bdno) {
        bdao.updateThumbs(bdno);
    }

    @Override
    public List<Board> readThumbsBoard(String cp) {
        int snum = 20 * (Integer.parseInt(cp) - 1);

        return bdao.selectThumbsBoard(snum);
    }

    @Override
    public List<Board> readViewBoard(String cp) {
        int snum = 20 * (Integer.parseInt(cp) - 1);

        return bdao.selecViewtBoard(snum);
    }
}
