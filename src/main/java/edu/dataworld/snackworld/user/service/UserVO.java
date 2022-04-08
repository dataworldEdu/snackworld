package edu.dataworld.snackworld.user.service;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class UserVO {

    private String userId;
    private String authId;
    private String authName;
    private String userPw;
    private String userName;
    private String delYn;
    private int userSeq;

}
