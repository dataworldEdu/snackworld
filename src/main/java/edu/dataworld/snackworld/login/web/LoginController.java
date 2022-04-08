package edu.dataworld.snackworld.login.web;

import edu.dataworld.snackworld.user.service.UserService;
import edu.dataworld.snackworld.user.service.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping(value="/login")
public class LoginController {

    @Resource(name="UserService")
    private UserService userService;


    @RequestMapping("/loginForm.do")
    public String loginForm(Model model, String ok) {
        return "/login/loginForm.view";
    }

    @RequestMapping(value = "/loginAction.do", method = RequestMethod.POST)
    public String loginAction(UserVO vo, HttpServletResponse response) throws Exception{
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        // 로그인 성공
        if(userService.checkId(vo) == 1){
            UserVO currentUser = userService.login(vo);
            return "/home/main.view";
        }
        // 로그인 실패
        else{
            out.println("<script>");
            out.println("alert('아이디나 비밀번호를 다시 확인하세요');");
            out.println("history.go(-1);");
            out.println("</script>");
            out.close();
            return "/login/loginForm.view";
        }
    }
}
