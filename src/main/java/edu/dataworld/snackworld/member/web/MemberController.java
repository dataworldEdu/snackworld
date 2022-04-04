package edu.dataworld.snackworld.member.web;

import edu.dataworld.snackworld.member.service.MemberService;
import edu.dataworld.snackworld.member.service.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value="/member")
public class MemberController {

    @Resource(name="MemberService")
    private MemberService memberService;

    @RequestMapping(value="/memberMng.do")
    public String getMember(@ModelAttribute("searchVO") MemberVO vo, ModelMap model) {
        List<MemberVO> memberList = memberService.retrieve(vo);
        model.addAttribute("memberList", memberList);
        return "/member/memberMng.view";
    }

}
