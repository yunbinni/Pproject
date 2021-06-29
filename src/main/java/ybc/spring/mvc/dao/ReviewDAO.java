package ybc.spring.mvc.dao;

import ybc.spring.mvc.vo.Review;

import java.util.List;
import java.util.Map;

public interface ReviewDAO {

    int insertReview(Review rv);
    int updateReview(Review rv);
    int deleteReview(String rvno);

    String readFnames(String rvno);
    String readFsizes(String rvno);

    Review selectOneReview(String rvno); //상세페이지

    String selectPrvrvno(String rvno);
    String selectNxtrvno(String rvno);

    List<Review> selectReview(int snum); // 검색기능 없을때
    int selectCountReview(); // 검색기능없을때

    int viewCountReview(String rvno); //views

    void updatelikes(String rvno);
    void updateNlikes(String rvno);

    List<Review> findSelectReview(Map<String, Object> params);
    int selectCountReview(Map<String, Object> param);
}

