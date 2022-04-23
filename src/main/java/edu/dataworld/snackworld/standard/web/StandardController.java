package edu.dataworld.snackworld.standard.web;

import edu.dataworld.snackworld.common.Search;
import edu.dataworld.snackworld.common.Util;
import edu.dataworld.snackworld.goods.service.GoodsService;
import edu.dataworld.snackworld.order.service.OrderVO;
import edu.dataworld.snackworld.standard.service.StandardService;
import edu.dataworld.snackworld.standard.service.StandardVO;
import edu.dataworld.snackworld.user.service.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value="/standard")
public class StandardController {

    @Resource(name = "StandardService")
    private StandardService standardService;

    @RequestMapping(value="standardMng.do", method = RequestMethod.GET)
    public String showStandardMng(@ModelAttribute("searchVO") Search search, ModelMap model, HttpSession session) {

        model.addAttribute("search", search);
        String userId = session.getAttribute("login").toString();

        StandardVO userStandard = standardService.getUserStandard(userId);

        model.addAttribute("standard", userStandard);

        return "/standard/standardMng.view";
    }

    @RequestMapping(value = "/addStandard.do", method = RequestMethod.POST)
    public String addStandard(HttpSession session, HttpServletRequest req, @ModelAttribute("standardVO") StandardVO vo){

        String userId = session.getAttribute("login").toString();
        vo.setUserId(userId);
        StandardVO existStandard = standardService.getUserStandard(userId);

        int flag = 0;
        if(existStandard != null) {
            standardService.setDelStandard(vo);
        }
        flag = standardService.addStandard(vo);

        if(flag == 0) {
            return Util.msgAndBack(req,"기준 추가에 실패하였습니다.");
        }
        return Util.msgAndReplace(req,"기준이 추가되었습니다.", "/standard/standardMng.do");
    }
}
