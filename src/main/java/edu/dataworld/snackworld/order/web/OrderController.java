package edu.dataworld.snackworld.order.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/order")
public class OrderController {

    @RequestMapping(value="/orderList")
    public String showOrderList() {
        return "/order/orderList.view";
    }

    @RequestMapping(value="/orderDetail")
    public String showOrderDetail() {
        return "/order/orderDetail.view";
    }

    @RequestMapping(value="/standardMng")
    public String showStandardMng() {
        return "/order/standardMng.view";
    }

    @RequestMapping(value="/cart")
    public String showCart() {
        return "/order/cart.view";
    }

}
