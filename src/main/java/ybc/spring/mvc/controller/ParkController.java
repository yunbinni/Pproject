package ybc.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import ybc.spring.mvc.service.ParkService;

@Controller
public class ParkController {
    @Autowired
    private ParkService psrv;

    @GetMapping("Park/list")
    public String list() {
        return "Park/list.tiles";
    }

    // 주차장 검색 기능 구현
    @GetMapping("Park/find")
    public ModelAndView find(ModelAndView mv, String cp, String findtype, String findkey) {
        if(cp == null) cp = "1";
        mv.setViewName("Park/list.tiles");
        mv.addObject("parks", psrv.readPark(cp, findtype, findkey));
        mv.addObject("pcnt", psrv.countPark(findtype, findkey));
        return mv;
    }
}
