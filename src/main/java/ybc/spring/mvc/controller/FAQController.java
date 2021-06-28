package ybc.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import ybc.spring.mvc.service.FAQService;

@Controller
public class FAQController {

    private FAQService fsrv;

    @Autowired
    public FAQController(FAQService fsrv){
        this.fsrv = fsrv;
    }


    @GetMapping("/FAQ/FAQlist")
    public ModelAndView FAQlist(ModelAndView mv, String cp) {
        if (cp == null) cp = "1";
        mv.setViewName("FAQ/FAQlist.tiles");
        mv.addObject("FAQs", fsrv.readFAQ(cp));
        mv.addObject("FAQcnt", fsrv.countFAQ());

        return mv;
    }
    // 게시판 검색 기능 구현
    @GetMapping("/FAQ/find")
    public ModelAndView find(ModelAndView mv, String cp,
                             String findtype, String findkey) {

        mv.setViewName("FAQ/FAQlist.tiles");
        mv.addObject("FAQs",
                fsrv.readFAQ(cp, findtype, findkey));
        mv.addObject("FAQcnt",
                fsrv.countFAQ(findtype, findkey));

        return mv;
    }

}
