package ybc.spring.mvc.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ybc.spring.mvc.dao.MemberDAO;
import ybc.spring.mvc.vo.Member;

import javax.servlet.http.HttpSession;

@Service("msrv")
public class MemberServiceImpl implements MemberService{

    @Autowired private MemberDAO mdao;

    @Override
    public String newMember(Member m) {
        String result = "회원정보 저장 실패!";

        int cnt = mdao.insertMember(m);
        if (cnt > 0) result = "회원정보 저장 성공!!";

        return result;
    }

    @Override
    public String findZipcode(String dong) {
        ObjectMapper mapper = new ObjectMapper();
        String json = "";

        dong = dong + "%";

        try {
            json = mapper.writeValueAsString(
                    mdao.selectZipcode(dong)
            );
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return json;
    }

    @Override
    public String checkUserid(String uid) {
        return mdao.selectOneUserid(uid)+"";
    }

    @Override
    public boolean checkLogin(Member m, HttpSession sess) {
        boolean isLogin = false;

        // 로그인 성공시 회원정보를 세션에 저장
        // 입력한 아이디/비밀번호가 member 테이블에 있는지 확인
        // 있으면 : 1을 반환, 없으면 : 0을 반환
        if (mdao.selectLogin(m) > 0) {
            sess.setAttribute("UID", m.getUserid());
            isLogin = true;
        }

        return isLogin;
    }

    @Override
    public Member readOneMember(String userid) {
        return mdao.selectOneMember(userid);
    }
}
