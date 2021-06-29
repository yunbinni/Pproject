package ybc.spring.mvc.service;

import ybc.spring.mvc.vo.FAQ;
import ybc.spring.mvc.vo.QnA;

import java.util.List;

public interface FAQService {

    boolean newFAQ(FAQ f);
    boolean modifyFAQ(FAQ f);
    boolean removeFAQ(String fno);

    //목록출력
    List<FAQ> readFAQ(String cp);
    List<FAQ> readFAQ(String cp, String ftype, String fkey);
    QnA readOneFAQ(String fno);

    //게시글 수
    int countFAQ();
    int countFAQ(String ftype, String fkey);
    boolean viewCountFAQ(String fno);
}
