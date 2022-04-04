package edu.dataworld.snackworld.member.service.impl;

import edu.dataworld.snackworld.member.service.MemberService;
import edu.dataworld.snackworld.member.service.MemberVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("MemberService")
public class MemberServiceImpl extends EgovAbstractServiceImpl implements MemberService {

    @Resource(name="MemberDAO")
    private MemberDAO memberDAO;

    @Override
    public List<MemberVO> retrieve(MemberVO vo) {
        return memberDAO.retrieve(vo);
    }

    @Override
    public void insert(MemberVO vo) {
        memberDAO.insert(vo);
    }

    @Override
    public void update(MemberVO vo) {
        memberDAO.update(vo);
    }
}
