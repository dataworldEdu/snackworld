package edu.dataworld.snackworld.user.service.impl;

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
    public List<UserVO> retrieve(UserVO vo) {
        return userDAO.retrieve(vo);
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
    public UserVO login(UserVO vo) {
        return userDAO.login(vo);
    }

    @Override
    public int checkId(UserVO vo) {
        return userDAO.checkId(vo);
    }

    @Override
    public void setRowNum() {
        userDAO.setRowNum();
    }
}
