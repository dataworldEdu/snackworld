package edu.dataworld.snackworld.member.service;

import java.util.List;

public interface MemberService {

    List<MemberVO> retrieve(MemberVO vo);
    void insert(MemberVO vo);
    void update(MemberVO vo);

}
