package edu.dataworld.snackworld.user.service;

import edu.dataworld.snackworld.common.Search;

import java.util.List;

public interface UserService {

    List<UserVO> retrieve(Search search);
    void insert(UserVO vo);
    void update(UserVO vo);

    UserVO getUserByLoginId(String userId);
    void setRowNum();
    int userCnt();
}
