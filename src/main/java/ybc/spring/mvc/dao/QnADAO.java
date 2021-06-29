package ybc.spring.mvc.dao;

import ybc.spring.mvc.vo.QnA;

import java.util.List;
import java.util.Map;

public interface QnADAO {
    int insertQnA(QnA q);
    int updateQnA(QnA q);
    int deleteQnA(String qno);

    //목록출력
    List<QnA> selectQnA(int snum);
    List<QnA> findSelectQnA(Map<String, Object> param);
    QnA selectOneQnA(String qno);

    //게시글 수
    int selectCountQnA();
    int selectCountQnA(Map<String, Object> param);
    int viewCountQnA(String qno);
}
