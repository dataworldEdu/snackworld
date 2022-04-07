package edu.dataworld.snackworld.goods.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/goods")
public class GoodsController {

    @RequestMapping(value = "/goodsDetail")
    public String showGoodsDetail(){
        return "/goods/goodsDetail.view";
    }

    @RequestMapping(value = "/goodsList")
    public String showGoodsList() {
        return "/goods/goodsList.view";
    }

    @RequestMapping(value = "/regGoods")
    public String showRegGoods() {
        return "/goods/regGoods.view";
    }

    @RequestMapping(value = "/modifyGoods")
    public String showModifyGoods() {
        return "/goods/modifyGoods.view";
    }

}
