package edu.dataworld.snackworld.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @RequestMapping(value="/index.do")
    public String index() {
        return "redirect:/login/loginForm.do";
    }

    @RequestMapping(value="/")
    public String showMainRoot() {
        return "redirect:/home/main.view";
    }

    @RequestMapping(value="/home/main")
    public String showMain() {
        return "/home/main.view";
    }

    @RequestMapping(value="/login/loginForm")
    public String showLogin() {
        return "/login/loginForm.view";
    }
}
