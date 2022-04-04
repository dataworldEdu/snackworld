package edu.dataworld.snackworld.member.service.impl;

import edu.dataworld.egov.cmm.service.impl.EgovComAbstractDAO;
import edu.dataworld.snackworld.member.service.MemberVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("MemberDAO")
public class MemberDAO extends EgovComAbstractDAO {

    public List<MemberVO> retrieve(MemberVO vo) {
        return selectList("member.retrieve", vo);
    }

    public void insert(MemberVO vo) {
        insert("member.insert", vo);
    }

    public void update(MemberVO vo) {
        update("member.update", vo);
    }


}
