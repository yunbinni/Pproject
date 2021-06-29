package ybc.spring.mvc.dao;

import ybc.spring.mvc.vo.Member;
import ybc.spring.mvc.vo.Zipcode;

import java.util.List;

public interface MemberDAO {
    int insertMember(Member m);
    List<Zipcode> selectZipcode(String dong);
    int selectOneUserid(String uid);
    int selectLogin(Member m);
    Member selectOneMember(String userid);
}
