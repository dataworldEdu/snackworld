package edu.dataworld.snackworld.order.web;

import edu.dataworld.snackworld.common.Util;
import edu.dataworld.snackworld.order.service.OrderService;
import edu.dataworld.snackworld.order.service.OrderVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value="/order")
public class OrderController {

    @Resource(name = "OrderService")
    private OrderService orderService;

    @RequestMapping(value="/orderList.do")
    public String showOrderList() {
        return "/order/orderList.view";
    }

    @RequestMapping(value="/orderDetail.do")
    public String showOrderDetail() {
        return "/order/orderDetail.view";
    }

    @ResponseBody
    @RequestMapping(value = "/addCartAction.do", method = RequestMethod.GET)
    public String addCartAction(OrderVO vo, String Id, HttpSession session, HttpServletRequest request){
        vo.setUserId((String) session.getAttribute("login"));
        vo.setGdsId(Id);

        if(orderService.cartInsert(vo) == 1){
            return Util.msgAndReplace(request, "상품을 장바구니에 담았습니다.", "/goods/goodsList.do");
        } else {
            return Util.msgAndReplace(request, "상품을 장바구니에 담는데 실패했습니다.", "/goods/goodsList.do");
        }
    }

    @RequestMapping(value="/cart.do")
    public String showCart(ModelMap model, OrderVO vo, HttpSession session) {
        vo.setUserId((String) session.getAttribute("login"));
        model.addAttribute("cartList", orderService.cartRetrieve(vo));
        return "/order/cart.view";
    }

}
