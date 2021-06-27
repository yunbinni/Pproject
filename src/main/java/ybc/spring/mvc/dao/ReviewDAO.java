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

    List<Review> selectReview(int snum);
    List<Review> findSelectReview(Map<String, Object> param);
    Review selectOneReview(String rvno);
    String selectPrvrvno(String rvno);
    String selectNxtrvno(String rvno);

    int selectCountReview();
    int selectCountReview(Map<String, Object> param);
    int viewCountReview(String rvno); //views

    void updatelikes(String rvno);
    void updateNlikes(String rvno);

    List<Review> findSelectFReview(Map<String, Object> params);
    int selectCountFReview();
}

