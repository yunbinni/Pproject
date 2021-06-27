package ybc.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import ybc.spring.mvc.service.ReviewService;
import ybc.spring.mvc.utils.ImgUploadUtil;
import ybc.spring.mvc.vo.Review;

@Controller
public class ReviewController {

    @Autowired private ReviewService rvsrv;
    @Autowired private ImgUploadUtil imgutil;

    @GetMapping("/review/list")
    public ModelAndView list(ModelAndView mv, String cp){
        if (cp == null) cp="1";
        mv.setViewName("review/list.tiles");
        mv.addObject("rvs", rvsrv.readReview(cp));
        mv.addObject("rvcnt", rvsrv.countReview());

        return mv;
    } //list

    @GetMapping("/review/view")
    public ModelAndView view(ModelAndView mv, String rvno) {

        rvsrv.viewCountReview(rvno); // views

        mv.setViewName("review/view.tiles");
        mv.addObject("rv", rvsrv.readOneReview(rvno));

        return mv;
    } // detailed post

    @GetMapping("/review/prev")
    public String rvprev(String rvno){
        String prvrvno= rvsrv.readPrvrvno(rvno);
        //System.out.println(rvno);

        return "redirect:/review/view?rvno=" + prvrvno;
    } //prev post

    @GetMapping("/review/next")
    public String rvnext(String rvno){
        String nxtrvno= rvsrv.readNxtrvno(rvno);
        //System.out.println(nxtrvno);

        return "redirect:/review/view?rvno=" + nxtrvno;
    } //next post

    @GetMapping("/review/find")
    public ModelAndView find(ModelAndView mv, String cp,
                             String findtype, String findkey) {

        mv.setViewName("review/list.tiles");
        mv.addObject("rvs", rvsrv.readReview(cp, findtype, findkey));
        mv.addObject("rvcnt", rvsrv.countReview(findtype, findkey));

        return mv;
    } //searching filter

    @GetMapping("/review/findwf")
    public ModelAndView findwloc(ModelAndView mv, String cp, String loc,
                             String findtype, String findkey) {
        mv.setViewName("review/list.tiles");
        mv.addObject("rvs", rvsrv.readReview(cp, loc, findtype, findkey));
        mv.addObject("rvcnt", rvsrv.countReview(loc, findtype, findkey));

        return mv;
    }

    @GetMapping("/review/write")
    public String write() {
        return "review/write.tiles";
    } // write

    @PostMapping("/review/write")
    public String writeok(Review rv, MultipartFile[] img) {
        //String returnpage = "redirect:/review/list";

        //if (rvsrv.newReview(rv));

        rvsrv.newReview(rv, img);

        return "redirect:/review/list";
    } // write ok

    @GetMapping("/review/update")
    public ModelAndView update(ModelAndView mv, String rvno) {
        mv.setViewName("review/update.tiles");
        mv.addObject("rv", rvsrv.readOneReview(rvno));

        return mv;
    } //update

    @PostMapping("/review/update")
    public String updateok(Review rv, MultipartFile[] img) {
        rvsrv.modifyReview(rv, img);

        return "redirect:/review/list";
    } //updateok

    @GetMapping("/review/likes")
    public String likes(String rvno) {
        rvsrv.modifyLikes(rvno);

        return "redirect:/review/view?rvno=" + rvno;
    }

    @GetMapping("/review/nlikes")
    public String nlikes(String rvno) {
        rvsrv.modifyNlikes(rvno);

        return "redirect:/review/view?rvno=" + rvno;
    } //

    @GetMapping("/review/rmvrv")
    public String rmvrv(String rvno) {
        Review rv = rvsrv.readOneReview(rvno);
        rvsrv.removerv(rvno);

        return "redirect:/review/list";
    } //delete
}

