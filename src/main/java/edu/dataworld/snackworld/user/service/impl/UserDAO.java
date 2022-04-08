package edu.dataworld.snackworld.user.service.impl;

import edu.dataworld.egov.cmm.service.impl.EgovComAbstractDAO;
import edu.dataworld.snackworld.user.service.UserVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("UserDAO")
public class UserDAO extends EgovComAbstractDAO {

    public List<UserVO> retrieve(UserVO vo) {
        return selectList("user.retrieve", vo);
    }

    public void insert(UserVO vo) {
        insert("user.insert", vo);
    }

    public void update(UserVO vo) {
        update("user.update", vo);
    }

    public UserVO login(UserVO vo){
        return selectOne("user.login", vo);
    }

    public int checkId(UserVO vo) {
        return selectOne("user.checkId", vo);
    }

    public void setRowNum() { update("user.setRowNum"); }
}
