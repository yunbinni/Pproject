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
    public ModelAndView find(ModelAndView mv, String addr, String shour, String ehour, String satshour, String satehour, String holshour, String holehour, String weekday, String saturday, String holiday, String gubun, String buze) {
        mv.setViewName("Park/list.tiles");
        mv.addObject("parks", psrv.readPark(addr, shour, ehour, satshour, satehour, holshour, holehour, weekday, saturday, holiday, gubun, buze));
        mv.addObject("pcnt", psrv.countPark(addr, shour, ehour, satshour, satehour, holshour, holehour, weekday, saturday, holiday, gubun, buze));
        return mv;
    }
}
