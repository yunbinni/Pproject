package ybc.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ParkController {

    @GetMapping("Park/list")
    public String list() {
        return "Park/list.tiles";
    }
}
