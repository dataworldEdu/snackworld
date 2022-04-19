package edu.dataworld.snackworld.user.web;

import com.google.gson.Gson;
import edu.dataworld.snackworld.common.Pagination;
import edu.dataworld.snackworld.common.Search;
import edu.dataworld.snackworld.common.Util;
import edu.dataworld.snackworld.user.service.UserService;
import edu.dataworld.snackworld.user.service.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.registry.infomodel.User;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/user")
public class UserController {

    @Resource(name="UserService")
    private UserService userService;

    @RequestMapping(value="/userMng.do", method = RequestMethod.GET)
    public String showUserList(@ModelAttribute("searchVO") Search search, ModelMap model) {

        model.addAttribute("search", search);

        int listCnt = userService.userCnt(search);

        //검색 후 페이지
        search.pageInfo(search.getPage(), search.getRange(), listCnt);

        //페이징
        model.addAttribute("pagination", search);

        userService.setRowNum();
        List<UserVO> userList = userService.retrieve(search);
        model.addAttribute("userList", userList);
        model.addAttribute("pageNum", search.getPage());

        return "/user/userMng.view";
    }

    @RequestMapping(value="/userAdd.do", method = RequestMethod.POST)
    public String addUser(HttpServletRequest req, @ModelAttribute("userVO") UserVO userVO) throws Exception{

        UserVO existUser = userService.getUserByLoginId(userVO.getUserId());

        if(existUser != null) {
            return Util.msgAndBack(req,userVO.getUserId() + "(은)는 이미 사용중인 로그인 아이디 입니다.");
        }

        int joinUserCount = userService.addUser(userVO);

        if(joinUserCount == 0) {
            return Util.msgAndBack(req,"회원 추가에 실패하였습니다.");
        }
        return Util.msgAndReplace(req,"회원이 추가되었습니다.", "/user/userMng.view");
    }

    @RequestMapping(value="/userModify.do", method = RequestMethod.POST)
    public String modifyUser(HttpServletRequest req, @ModelAttribute("userVO") UserVO userVO) throws Exception{


        int joinUserCount = userService.modifyUser(userVO);

        if(joinUserCount == 0) {
            return Util.msgAndBack(req,"회원 수정에 실패하였습니다.");
        }
        return Util.msgAndReplace(req,"회원 정보가 수정되었습니다.", "/user/userMng.view");
    }

    @ResponseBody
    @RequestMapping(value = "/deleteUser.do", method = RequestMethod.POST)
    public String deleteUser(@RequestParam(value="checkBoxArr[]", required = false) List<String> checkBoxArr, ModelMap result) {
        Gson gson = new Gson();

        int value = userService.deleteUser(checkBoxArr);

        result.put("id", value);

        return gson.toJson(result);
    }

}
