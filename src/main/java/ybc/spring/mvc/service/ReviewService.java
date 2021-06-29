package ybc.spring.mvc.service;

import org.springframework.web.multipart.MultipartFile;
import ybc.spring.mvc.vo.Review;

import java.util.List;

public interface ReviewService {

    boolean newReview(Review rv, MultipartFile[] img);
    void modifyReview(Review rv, MultipartFile[] img);

    List<Review> readReview(String cp);

    Review readOneReview(String rvno);
    String readPrvrvno(String rvno);
    String readNxtrvno(String rvno);

    int countReview(); // search cnt

    List<Review> readReview(String cp, String floc, String ftype, String fkey);
    int countReview(String floc, String ftype, String fkey);

    boolean viewCountReview(String rvno); //views

    void modifyLikes(String rvno); //likes
    void modifyNlikes(String rvno); //nlikes

    Review removerv(String rvno); //delete


}
