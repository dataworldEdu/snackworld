package edu.dataworld.snackworld.user.service;

import edu.dataworld.snackworld.common.Search;

import java.util.List;

public interface UserService {

    List<UserVO> retrieve(Search search);

    UserVO getUserByLoginId(String userId);
    void setRowNum();
    int userCnt(Search search);

    int addUser(UserVO userVO);

    int deleteUser(List<String> checkBoxArr);

    int modifyUser(UserVO vo);
}
