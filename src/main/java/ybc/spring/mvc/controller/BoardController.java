package ybc.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import ybc.spring.mvc.service.BoardRepleService;
import ybc.spring.mvc.service.BoardService;
import ybc.spring.mvc.vo.Board;
import ybc.spring.mvc.vo.Reple;

@Controller
public class BoardController {

    private BoardService bsrv;
    private BoardRepleService brsrv;

    @Autowired
    public BoardController(BoardService bsrv, BoardRepleService brsrv) {
        this.bsrv = bsrv;
        this.brsrv = brsrv;
    }

    @GetMapping("/board/list")
    public ModelAndView list(ModelAndView mv, String cp) {
        if(cp == null) { cp = "1"; }

        mv.setViewName("board/list.tiles");
        mv.addObject("bds" ,bsrv.readBoard(cp));
        mv.addObject("bdcnt" ,bsrv.countBoard());

        return mv;
    }

    @GetMapping("/board/view")
    public ModelAndView view(String bdno, ModelAndView mv) {

        bsrv.viewCountBoard(bdno);      // 조회수 처리

        mv.setViewName("board/view.tiles");
        mv.addObject("bd", bsrv.readOneBoard(bdno));
        mv.addObject("rps", brsrv.readReple(bdno));

        return mv;
    }

    @GetMapping("/board/write")
    public String write() {
        return "board/write.tiles";
    }

    @PostMapping("/board/write")
    public String writeok(Board bd) {
        String returnPage = "redirect:/board/list";

        bsrv.newBoard(bd);

        return returnPage;
    }

    // 게시판 검색
    @GetMapping("/board/find")
    public ModelAndView find(ModelAndView mv, String cp,
                             String findtype, String findkey) {

        mv.setViewName("board/list.tiles");
        mv.addObject("bds", bsrv.readBoard(cp, findtype, findkey));
        mv.addObject("bdcnt", bsrv.countBoard(findtype, findkey));

        return mv;
    }

    // 댓글
    @PostMapping("/reple/write")
    public String repleok(Reple r) {
        String returnPage = "redirect:/board/view?bdno="+r.getBdno();

        brsrv.newComment(r);

        return returnPage;
    }

    // 대댓글
    @PostMapping("/rreple/write")
    public String rrepleok(Reple r) {
        String returnPage = "redirect:/board/view?bdno="+r.getBdno();

        brsrv.newReple(r);

        return returnPage;
    }

    // 게시글 수정
    @GetMapping("/board/update")
    public ModelAndView update(ModelAndView mv, String bdno) {

        mv.setViewName("board/update.tiles");
        mv.addObject("b", bsrv.readOneBoard(bdno));

        return mv;
    }

    @PostMapping("/board/update")
    public String updateok(Board b) {

        bsrv.modifyBoard(b);

        return "redirect:/board/list";
    }

    // 댓글 수정
    @PostMapping("/reple/update")
    public String rpupdateok(Reple r) {
        String returnPage = "redirect:/board/view?bdno="+r.getBdno();

        brsrv.modifyReple(r);

        return returnPage;
    }

    // 게시글 삭제
    @GetMapping("/board/remove")
    public String remove(String bdno) {

        bsrv.removeBoard(bdno);

        return "redirect:/board/list";

    }

    // 댓글 삭제
    @GetMapping("/reple/remove")
    public String rpremove(String rno, String bdno) {
        String returnPage = "redirect:/board/view?bdno="+bdno;

        brsrv.removeReple(rno);

        return returnPage;

    }

    // 추천
    @GetMapping("/board/thumbsup")
    public String thumbsup(String bdno) {
        String returnPage = "redirect:/board/view?bdno=" + bdno;

        System.out.println(bdno);

        bsrv.thumbsBoard(bdno);

        return returnPage;
    }

    // 추천순 정렬
    @GetMapping("/board/listThumbs")
    public ModelAndView listThumbs(ModelAndView mv, String cp) {
        if(cp == null) { cp = "1"; }

        mv.setViewName("board/list.tiles");
        mv.addObject("bds" ,bsrv.readThumbsBoard(cp));
        mv.addObject("bdcnt" ,bsrv.countBoard());

        return mv;
    }

    // 조회순 정렬
    @GetMapping("/board/listView")
    public ModelAndView listView(ModelAndView mv, String cp) {
        if(cp == null) { cp = "1"; }

        mv.setViewName("board/list.tiles");
        mv.addObject("bds" ,bsrv.readViewBoard(cp));
        mv.addObject("bdcnt" ,bsrv.countBoard());

        return mv;
    }

}

