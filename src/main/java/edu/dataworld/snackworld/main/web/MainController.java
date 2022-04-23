package edu.dataworld.snackworld.main.web;

import com.google.gson.Gson;
import edu.dataworld.snackworld.common.DataSet;
import edu.dataworld.snackworld.common.Search;
import edu.dataworld.snackworld.goods.service.GoodsService;
import edu.dataworld.snackworld.goods.service.GoodsVO;
import edu.dataworld.snackworld.main.service.MainService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class MainController {

    @Resource(name="GoodsService")
    private GoodsService goodsService;

    @RequestMapping(value="/index.do")
    public String index() {
        return "redirect:/login/loginForm.do";
    }

    @RequestMapping(value="/home/main.do")
    public String main() {
        return "/home/home.view";
    }

    @RequestMapping(value="/home/showMain.do", produces="text/plain;charset=UTF-8")
    @ResponseBody   //없으면 AJAX 통신 안되요
    public String showMain(Search param, HttpServletRequest request, HttpServletResponse response, ModelMap model) {
        Gson gson = new Gson();
        DataSet set = new DataSet();
        try {
            int totalCnt = goodsService.goodsCnt(param);  //데이터의 전체 갯수를 가져온다.
            int page = param.getPage();  //파라메터 page값을 받는다.
            if (page==1){
                param.setStartPage(1);
                param.setEndPage(20);  //데이터를 20개씩 가져오겠다.s
            }else{
                param.setStartPage(page+(19*(page-1)));  //10개씩 가져오고싶다면 19->9로
                param.setEndPage(page*20);   //20, 40, 60
            }
            //위에서 구한, 데이터를 가져올 시작 rownum과 끝 rownum을 값을 같이 보낸다. 이 사이의 데이터를 조회
            List<GoodsVO> list = goodsService.retrieve(param);  //조회한 데이터를 가져온다.

            set.setRows(list);
            set.setTotCnt(totalCnt);
            set.setStartNum(param.getStartPage());
            set.setResultCode(200);

        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("gson.toJson(set) : " + gson.toJson(set));
        return gson.toJson(set);
    }
}
