package edu.dataworld.snackworld.standard.web;

import edu.dataworld.snackworld.common.Search;
import edu.dataworld.snackworld.common.Util;
import edu.dataworld.snackworld.goods.service.GoodsService;
import edu.dataworld.snackworld.standard.service.StandardService;
import edu.dataworld.snackworld.standard.service.StandardVO;
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

        System.out.println("로그인아이디" + userId);

        StandardVO userStandard = standardService.getUserStandard(userId);

        model.addAttribute("standard", userStandard);

        return "/standard/standardMng.view";
    }
}
