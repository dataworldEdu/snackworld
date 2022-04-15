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

    @RequestMapping(value = "/goodsList.do", method = RequestMethod.GET)
    public String showGoodsList(@ModelAttribute("searchVO") Search search, ModelMap model) {
        model.addAttribute("search", search);

        int listCnt = goodsService.goodsCnt(search);

        //검색 후 페이지
        search.pageInfo(search.getPage(), search.getRange(), listCnt);

        //페이징
        model.addAttribute("pagination", search);

        goodsService.setRowNum();
        List<GoodsVO> goodsList = goodsService.retrieve(search);
        List<GoodsVO> listSearch = goodsService.listSearch(search);
        model.addAttribute("listSearch", listSearch);
        model.addAttribute("goodsList", goodsList);
        model.addAttribute("pageNum", search.getPage());

        return "/goods/goodsList.view";
    }

    @RequestMapping(value = "/regGoods.do")
    public String showRegGoods() {
        return "/goods/regGoods.view";
    }

    @RequestMapping(value = "/goodsDetail.do", method = RequestMethod.GET)
    public String showGoodsDetail(ModelMap model, String Id){
        model.addAttribute("goodsDetail", goodsService.selectById(Id));
        return "/goods/goodsDetail.view";
    }

    @RequestMapping(value = "/modifyGoods.do", method = RequestMethod.GET)
    public String showModifyGoods(ModelMap model, String Id) {
        model.addAttribute("modifyGoods", goodsService.selectById(Id));
        return "/goods/modifyGoods.view";
    }

    @RequestMapping(value = "/modifyGoodsAction.do", method = RequestMethod.GET)
    public String modifyGoodsAction(GoodsVO goodsVO) {
        goodsVO.setCatCode("0" + goodsVO.getCatCode());
        goodsService.modifyGoods(goodsVO);
        System.out.println("success");
        return "redirect:/goods/goodsList.do";
    }
}
