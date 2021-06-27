package ybc.spring.mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ybc.spring.mvc.vo.Review;

import java.util.List;
import java.util.Map;

@Repository("rvdao")
public class ReviewDAOImpl implements ReviewDAO {

    @Autowired  private SqlSession sqlSession;

    @Override
    public int insertReview(Review rv) {
        return sqlSession.insert("review.insertReview", rv);
    }

    @Override
    public int updateReview(Review rv) {
        return sqlSession.update("review.updateReview", rv);
    }

    @Override
    public int deleteReview(String rvno) {
        return sqlSession.delete("review.deleteRv", rvno);
    }

    @Override
    public String readFnames(String rvno) {
        return sqlSession.selectOne("review.readFnames", rvno);
    }

    @Override
    public String readFsizes(String rvno) {
        return sqlSession.selectOne("review.readFsizes", rvno);
    }

    @Override
    public List<Review> selectReview(int snum) {
        return sqlSession.selectList("review.selectReview", snum);
    } // tot # of posts

    @Override
    public List<Review> findSelectReview(Map<String, Object> param) {
        return sqlSession.selectList("review.findSelect", param);
    }

    @Override
    public Review selectOneReview(String rvno) {
        return sqlSession.selectOne("review.selectOne", rvno);
    } // detailed post

    @Override
    public String selectPrvrvno(String rvno) {
        return sqlSession.selectOne("review.selectPrev", rvno);
    } //previous post

    @Override
    public String selectNxtrvno(String rvno) {
        return sqlSession.selectOne("review.selectNext", rvno);
    } //nextpost

    @Override
    public int selectCountReview() {
        return sqlSession.selectOne("review.countReview");
    }

    @Override
    public int selectCountReview(Map<String, Object> param) {
        return sqlSession.selectOne("review.findSelectCount", param);
    } // cnt  with searching

    @Override
    public int viewCountReview(String rvno) {
        return sqlSession.update("review.viewsReview", rvno);
    }

    @Override
    public void updatelikes(String rvno) {
        sqlSession.update("review.upLikes", rvno);
    }

    @Override
    public void updateNlikes(String rvno) {
        sqlSession.update("review.noLikes", rvno);
    }

    @Override
    public List<Review> findSelectFReview(Map<String, Object> params) {
        return sqlSession.selectList("review.findFSelect");
    }

    @Override
    public int selectCountFReview() {
        return sqlSession.selectOne("review.findFSelectCount");
    }


}


