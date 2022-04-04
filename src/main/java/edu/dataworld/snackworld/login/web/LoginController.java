package edu.dataworld.snackworld.login.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/login")
public class LoginController {

    @RequestMapping("/loginForm.do")
    public String loginForm() {
        return "/login/loginForm.view";
    }
}
