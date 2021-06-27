package ybc.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ybc.spring.mvc.service.MemberService;
import ybc.spring.mvc.vo.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;


@Controller
public class JoinController {

    @Autowired private MemberService msrv;
    @Autowired private JavaMailSender mailSender;

    @GetMapping("/join/agree")
    public String agree() {
        return "join/agree.tiles";
    }

    @GetMapping("/join/checkme")
    public String checkme() {
        return "join/checkme.tiles";
    }

    @PostMapping("/join/joinme")
    public String joinme() {
        return "join/joinme.tiles";
    }

    @PostMapping ("/join/joinok")
    public String joinok(Member m, HttpServletRequest req) {
        msrv.newMember(m);
        return "join/joinok.tiles";
    }


    @RequestMapping ("/join/myinfo")
    public ModelAndView myinfo(String userid, ModelAndView mv) {

        // Member m = msrv.readOneMember((String)sess.getAttribute("userid"));


        mv.setViewName("join/myinfo.tiles");
        mv.addObject("muid", msrv.readOneMember(userid));

        System.out.println(msrv.readOneMember(userid));

        return mv;
    }


    @ResponseBody
    @GetMapping("/join/zipcode")
    public void zipcode(String dong, HttpServletResponse res) {

        try {
            res.setContentType("application/json; charset=UTF-8");
            res.getWriter().print( msrv.findZipcode(dong) );
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @ResponseBody
    @GetMapping("/join/checkuid")
    public void checkuid(String uid, HttpServletResponse res) {
        try {
            res.getWriter().println( msrv.checkUserid(uid) );
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    @PostMapping("/join/login")
    public void login(Member m, HttpSession sess, 
                        HttpServletResponse response) {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = null;
        
        String page = "/";

        if (msrv.checkLogin(m, sess)) {
            try {
                writer = response.getWriter();
            } catch (IOException e) {
                e.printStackTrace();
            }
            writer.println("<script>location.href='"+page+"';</script>");
            writer.close();
        } else {
            try {
                writer = response.getWriter();
            } catch (IOException e) {
                e.printStackTrace();
            }
            writer.println("<script>alert('존재하지 않거나 아이디/비밀번호가 틀렸습니다. " +
                            "                                    " +
                            "다시 확인 후 로그인 시도해주시기 바랍니다.'); " +
                            "location.href='"+page+"';</script>");
            writer.close();
        }

    }


    @GetMapping("/join/logout")
    public String logout(HttpSession sess) {
        sess.invalidate();  // 세션객체 제거

        return "redirect:/";
    }

    @ResponseBody
    @RequestMapping("/join/email")
    public Map<String, Object> sendEmail(String userEmail, HttpSession session,
                                          String key){
        Map<String, Object> map = new HashMap<>();
        Random random = new Random();
        key = "";

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(userEmail);

        for(int i = 0; i < 3; i++) {
            int index = random.nextInt(25) + 65;
            key += (char) index;
        }
        int numIndex = random.nextInt(8999) + 1000;
        key += numIndex;
        message.setSubject("더조은주차장 회원가입 인증코드 발송");
        message.setText("인증코드 : " + key);
        mailSender.send(message);
        map.put("key", key);
        return map;
    }



}
