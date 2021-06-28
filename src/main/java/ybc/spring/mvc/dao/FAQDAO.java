package ybc.spring.mvc.dao;

import ybc.spring.mvc.vo.FAQ;
import ybc.spring.mvc.vo.QnA;

import java.util.List;
import java.util.Map;

public interface FAQDAO {
    int insertFAQ(FAQ f);
    int updateFAQ(FAQ f);
    int deleteFAQ(String fno);

    //목록출력
    List<FAQ> selectFAQ(int snum);
    List<FAQ> findSelectFAQ(Map<String, Object> param);
    QnA selectOneFAQ(String fno);

    //게시글 수
    int selectCountFAQ();
    int selectCountFAQ(Map<String, Object> param);
    int viewCountFAQ(String fno);
}
