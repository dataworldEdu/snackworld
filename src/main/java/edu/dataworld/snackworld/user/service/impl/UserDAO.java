package edu.dataworld.snackworld.user.service.impl;

import edu.dataworld.egov.cmm.service.impl.EgovComAbstractDAO;
import edu.dataworld.snackworld.common.Search;
import edu.dataworld.snackworld.user.service.UserVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("UserDAO")
public class UserDAO extends EgovComAbstractDAO {

    public List<UserVO> retrieve(Search search) {
        return selectList("user.retrieve", search);
    }

    public UserVO login(UserVO vo){
        return selectOne("user.login", vo);
    }

    public UserVO getUserByLoginId(String userId) {
        return selectOne("user.getUserByLoginId", userId);
    }

    public void setRowNum() { update("user.setRowNum"); }

    public int userCnt() {
        return selectOne("user.userCnt");
    }

    public int addUser(UserVO vo) {
        return insert("user.addUser", vo);
    }

    public int deleteUser(List<String> checkBoxArr) {
        return update("user.deleteUser", checkBoxArr);
    }

    public int modifyUser(UserVO vo) {
        return update("user.updateUser", vo);
    }
}
