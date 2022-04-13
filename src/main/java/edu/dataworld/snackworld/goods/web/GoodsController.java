package edu.dataworld.snackworld.goods.web;

import edu.dataworld.snackworld.common.Search;
import edu.dataworld.snackworld.goods.service.GoodsService;
import edu.dataworld.snackworld.goods.service.GoodsVO;
import edu.dataworld.snackworld.user.service.UserService;
import edu.dataworld.snackworld.user.service.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value = "/goods")
public class GoodsController {

    @Resource(name="GoodsService")
    private GoodsService goodsService;

    @RequestMapping(value = "/goodsDetail")
    public String showGoodsDetail(){
        return "/goods/goodsDetail.view";
    }

    @RequestMapping(value = "/goodsList", method = RequestMethod.GET)
    public String showGoodsList(
            @RequestParam(required=false,defaultValue="1")int page
            , @RequestParam(required=false,defaultValue="1")int range
            , @RequestParam(required=false)String searchType
            , @RequestParam(required=false)String keyword
            , @ModelAttribute("searchVO") Search search, ModelMap model) {
        model.addAttribute("search", search);
        search.setSearchType(searchType);
        search.setKeyword(keyword);

        int listCnt = goodsService.goodsCnt();

        //검색 후 페이지
        search.pageInfo(page, range, listCnt);

        //페이징
        model.addAttribute("pagination", search);

        goodsService.setRowNum();
        List<GoodsVO> goodsList = goodsService.retrieve(search);
        model.addAttribute("goodsList", goodsList);
        model.addAttribute("pageNum", search.getPage());

        return "/goods/goodsList.view";
    }

    @RequestMapping(value = "/regGoods")
    public String showRegGoods() {
        return "/goods/regGoods.view";
    }

    @RequestMapping(value = "/modifyGoods", method = RequestMethod.GET)
    public String showModifyGoods(ModelMap model, String Id) {
        GoodsVO goodsVO = goodsService.selectById(Id);
        model.addAttribute("modifyGoods", goodsVO);
        return "/goods/modifyGoods.view";
    }

    @RequestMapping(value = "/modifyGoodsAction", method = RequestMethod.GET)
    public String modifyGoodsAction(String catCode, String gdsName, String gdsPrice, String gdsURL, String imgPath){

        return "redirect:/goods/goodsList";
    }

}
