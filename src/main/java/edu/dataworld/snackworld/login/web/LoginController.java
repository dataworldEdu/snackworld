package edu.dataworld.snackworld.login.web;

import edu.dataworld.snackworld.common.Search;
import edu.dataworld.snackworld.common.Util;
import edu.dataworld.snackworld.goods.service.GoodsService;
import edu.dataworld.snackworld.goods.service.GoodsVO;
import edu.dataworld.snackworld.standard.service.StandardService;
import edu.dataworld.snackworld.standard.service.StandardVO;
import edu.dataworld.snackworld.user.service.UserService;
import edu.dataworld.snackworld.user.service.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping(value="/login")
public class LoginController {

    @Resource(name="UserService")
    private UserService userService;

    @Resource(name="StandardService")
    private StandardService standardService;

    @Resource(name = "GoodsService")
    private GoodsService goodsService;

    @RequestMapping("/loginForm.do")
    public String loginForm(Model model, String ok) {
        return "/login/loginForm.view";
    }

    @RequestMapping(value = "/loginAction.do", method = RequestMethod.POST)
    public String loginAction(UserVO vo, Search search, /*HttpServletResponse response,*/ HttpSession session, HttpServletRequest request) throws Exception{


        if(session.getAttribute("login") != null){
            session.removeAttribute("login");
        }
        UserVO currentUser = userService.getUserByLoginId(vo.getUserId());

        if(currentUser == null) {
            return Util.msgAndBack(request,"존재하지 않는 아이디 입니다");
        }

        if(currentUser.getUserPw().equals(vo.getUserPw()) == false) {
            return Util.msgAndBack(request,"비밀번호가 일치하지 않습니다.");
        }


        List<GoodsVO> listSearch = goodsService.listSearch(search);
        session.setAttribute("listSearch", listSearch);

        session.setAttribute("login", currentUser.getUserId());
        session.setAttribute("auth", currentUser.getAuthId());
        session.setAttribute("userName", currentUser.getUserName());
        //카운트 로직

        StandardVO standardVo = standardService.getUserStandard(currentUser.getUserId());

        if(standardVo != null) {
            session.setAttribute("order_amt", standardVo.getOrderAmt());
            session.setAttribute("user_amt", standardVo.getUserAmt());
        } else {
            session.setAttribute("order_amt", 0);
            session.setAttribute("user_amt", 0);
        }


//        return "redirect:/home/main.do";
        return "redirect:/goods/goodsList.do";

    }

    @RequestMapping(value = "/logoutAction.do")
    public String logoutAction(HttpServletResponse response, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null)
            session.invalidate();

        return "redirect:/login/loginForm.do";
    }
}
