package edu.dataworld.snackworld.user.service;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface UserService {

    List<UserVO> retrieve(UserVO vo);
    void insert(UserVO vo);
    void update(UserVO vo);

    UserVO login(UserVO vo);
    UserVO getUserByLoginId(String userId);
    void setRowNum();
}
