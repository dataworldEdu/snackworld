package edu.dataworld.snackworld.user.service;

import edu.dataworld.snackworld.common.Search;

import java.util.List;

public interface UserService {

    List<UserVO> retrieve(Search search);

    UserVO getUserByLoginId(String userId);
    void setRowNum();
    int userCnt();

    int addUser(UserVO userVO);

    int deleteUser(List<String> checkBoxArr);

}
