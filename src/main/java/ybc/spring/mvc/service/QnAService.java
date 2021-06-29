package ybc.spring.mvc.service;

import ybc.spring.mvc.vo.QnA;

import java.util.List;

public interface QnAService {

    boolean newQnA(QnA q);
    boolean modifyQnA(QnA q);
    boolean removeQnA(String qno);

    //목록출력
    List<QnA> readQnA(String cp);
    List<QnA> readQnA(String cp, String ftype, String fkey);
    QnA readOneQnA(String qno);

    //게시글 수
    int countQnA();
    int countQnA(String ftype, String fkey);
    boolean viewCountQnA(String qno);

}
