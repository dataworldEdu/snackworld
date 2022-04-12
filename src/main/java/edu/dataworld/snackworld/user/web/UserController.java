package edu.dataworld.snackworld.user.web;

import edu.dataworld.snackworld.common.Pagination;
import edu.dataworld.snackworld.common.Search;
import edu.dataworld.snackworld.user.service.UserService;
import edu.dataworld.snackworld.user.service.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.xml.registry.infomodel.User;
import java.util.List;

@Controller
@RequestMapping(value="/user")
public class UserController {

    @Resource(name="UserService")
    private UserService userService;

//    @RequestMapping(value="/userMng.do")
//    public String getUser(@ModelAttribute("searchVO") UserVO vo, ModelMap model) {
//        List<UserVO> userList = userService.retrieve(vo);
//        model.addAttribute("userList", userList);
//        return "/user/userMng.view";
//    }

    @RequestMapping(value="/userMng", method = RequestMethod.GET)
    public String showUserList(
            @RequestParam(required=false,defaultValue="1")int page
            , @RequestParam(required=false,defaultValue="1")int range
            , @RequestParam(required=false)String searchType
            , @RequestParam(required=false)String keyword
            , @ModelAttribute("searchVO") Search search, ModelMap model) {

        model.addAttribute("search", search);
        search.setSearchType(searchType);
        search.setKeyword(keyword);

        int listCnt = userService.userCnt();

        //검색 후 페이지
        search.pageInfo(page, range, listCnt);

        //페이징
        model.addAttribute("pagination", search);

        userService.setRowNum();
        List<UserVO> userList = userService.retrieve(search);
        model.addAttribute("userList", userList);
        model.addAttribute("pageNum", search.getPage());
        return "/user/userMng.view";
    }

    @RequestMapping(value="/userAdd", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("userVO") UserVO userVO) {

        return "/user/userMng.view";
    }



}
