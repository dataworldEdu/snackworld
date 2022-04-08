package edu.dataworld.snackworld.user.service;

import java.util.List;

public interface UserService {

    List<UserVO> retrieve(UserVO vo);
    void insert(UserVO vo);
    void update(UserVO vo);
    void setRowNum();
}
