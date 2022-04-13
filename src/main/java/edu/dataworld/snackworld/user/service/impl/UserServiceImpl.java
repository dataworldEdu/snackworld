package edu.dataworld.snackworld.user.service.impl;

import edu.dataworld.snackworld.common.Search;
import edu.dataworld.snackworld.user.service.UserService;
import edu.dataworld.snackworld.user.service.UserVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("UserService")
public class UserServiceImpl extends EgovAbstractServiceImpl implements UserService {

    @Resource(name="UserDAO")
    private UserDAO userDAO;

    @Override //조회
    public List<UserVO> retrieve(Search search) {
        return userDAO.retrieve(search);
    }

    @Override
    public void insert(UserVO vo) {
        userDAO.insert(vo);
    }

    @Override
    public void update(UserVO vo) {
        userDAO.update(vo);
    }

    @Override
    public UserVO getUserByLoginId(String userId) {
        return userDAO.getUserByLoginId(userId);
    }


    @Override
    public void setRowNum() {
        userDAO.setRowNum();
    }

    @Override
    public int userCnt() {
        return userDAO.userCnt();
    }

    @Override
    public int addUser(UserVO vo) {
        return userDAO.addUser(vo);
    }

    @Override
    public int deleteUser(List<String> checkBoxArr) {
        return userDAO.deleteUser(checkBoxArr);
    }
}
