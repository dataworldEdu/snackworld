package edu.dataworld.snackworld.user.web;

import edu.dataworld.snackworld.user.service.UserService;
import edu.dataworld.snackworld.user.service.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value="/user")
public class userController {

    @Resource(name="UserService")
    private UserService userService;

    @RequestMapping(value="/userMng.do")
    public String getUser(@ModelAttribute("searchVO") UserVO vo, ModelMap model) {
        List<UserVO> userList = userService.retrieve(vo);
        model.addAttribute("userList", userList);
        return "/user/userMng.view";
    }

    @RequestMapping(value="/userMng")
    public String showUserMng() {
        return "/user/userMng.view";
    }

}
