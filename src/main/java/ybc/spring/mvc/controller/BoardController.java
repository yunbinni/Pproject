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

        if(bsrv.newBoard(bd)) {
            System.out.println("입력완료!");
        }

        return returnPage;
    }

    // 게시판 검색 기능 구현
    @GetMapping("/board/find")
    public ModelAndView find(ModelAndView mv, String cp,
                             String findtype, String findkey) {

        mv.setViewName("board/list.tiles");
        mv.addObject("bds", bsrv.readBoard(cp, findtype, findkey));
        mv.addObject("bdcnt", bsrv.countBoard(findtype, findkey));

        return mv;
    }

    // 댓글쓰기 구현
    @PostMapping("/reple/write")
    public String repleok(Reple r) {
        String returnPage = "redirect:/board/view?bdno="+r.getBdno();

        brsrv.newComment(r);

        return returnPage;
    }

    // 대댓글쓰기 구현
    @PostMapping("/rreple/write")
    public String rrepleok(Reple r) {
        String returnPage = "redirect:/board/view?bdno="+r.getBdno();

        brsrv.newReple(r);

        return returnPage;
    }
}

