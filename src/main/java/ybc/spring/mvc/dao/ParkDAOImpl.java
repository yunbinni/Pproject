package ybc.spring.mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ybc.spring.mvc.vo.Park;

import java.util.List;
import java.util.Map;

@Repository("pdao")
public class ParkDAOImpl implements ParkDAO {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Park> selectPark(Map<String, Object> param) {
        return sqlSession.selectList("park.selectPark", param);
    }

    @Override
    public int selectCountPark(Map<String, Object> param) {
        return sqlSession.selectOne("park.selectCnt", param);
    }
}
