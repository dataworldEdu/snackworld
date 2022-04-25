package edu.dataworld.snackworld.order.service.impl;

import edu.dataworld.snackworld.common.Search;
import edu.dataworld.snackworld.order.service.OrderService;
import edu.dataworld.snackworld.order.service.OrderVO;
import edu.dataworld.snackworld.standard.service.StandardVO;
import edu.dataworld.snackworld.user.service.impl.UserDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

@Service("OrderService")
public class OrderServiceImpl extends EgovAbstractServiceImpl implements OrderService {

    @Resource(name = "OrderDAO")
    private OrderDAO orderDAO;

    @Override
    public List<OrderVO> cartRetrieve(OrderVO vo) {
        return orderDAO.cartRetrieve(vo);
    }

    @Override
    public int cartInsert(OrderVO vo) {
        return orderDAO.cartInsert(vo);
    }

    @Override
    public void cartQtyUpdate(OrderVO vo) {
        orderDAO.cartQtyUpdate(vo);
    }

    @Override
    public void cartDelete(String cartId) {
        List<String> cartIdList = Arrays.asList(cartId.split(","));

        for(String target : cartIdList){
            orderDAO.cartDelete(target);
        }
    }

    @Override
    public List<OrderVO> listOption() {
        return orderDAO.listOption();
    }

    @Override
    public int orderCnt(Search search) {
        return orderDAO.orderCnt(search);
    }

    @Override
    public List<OrderVO> orderRetrieve(Search search) {
        return orderDAO.orderRetrieve(search);
    }

    @Override
    public void orderInsert(String userId, String cartId, String gdsId, String gdsPrice, String qty) {

        List<String> cartIdList = Arrays.asList(cartId.split(","));
        List<String> gdsIdList = Arrays.asList(gdsId.split(","));
        List<String> gdsPriceList = Arrays.asList(gdsPrice.split(","));
        List<String> qtyList = Arrays.asList(qty.split(","));

        List<OrderVO> vo = new ArrayList<>();

        int totalPrice = 0;
        for(int i = 0 ; i < cartIdList.size() ; i++){
            int tempPrice = Integer.parseInt(gdsPriceList.get(i));
            int tempQty = Integer.parseInt(qtyList.get(i));
            totalPrice += (tempPrice * tempQty);

            OrderVO temp = new OrderVO();

            temp.setCartId(cartIdList.get(i));
            temp.setGdsId(gdsIdList.get(i));
            temp.setGdsPrice(tempPrice);
            temp.setQty(tempQty);
            vo.add(temp);
        }

        OrderVO orderVO = new OrderVO();

        orderVO.setUserId(userId);
        orderVO.setTotalPrice(totalPrice);

        orderDAO.orderInsert(orderVO);

        for(OrderVO item : vo){
            item.setOrderId(orderVO.getOrderId());
            item.setUserId(userId);
            orderDAO.orderDetailInsert(item);
            orderDAO.cartDelete(item.getCartId());
        }
    }

    @Override
    public void orderDetailInsert(OrderVO vo) {
        orderDAO.orderDetailInsert(vo);
    }

    @Override
    public int cancelOrder(List<String> checkBoxArr) {
        return orderDAO.cancelOrder(checkBoxArr);
    }

    @Override
    public int sendBack(Map<String, Object> param) {
        return orderDAO.sendBack(param);
    }
    @Override
    public int signOffOn(String orderId, String orderPrice, String userId, String statusCode) {

        List<String> orderIdList = Arrays.asList(orderId.split(","));
        List<String> priceList = Arrays.asList(orderPrice.split(","));
        List<String> userIdList = Arrays.asList(userId.split(","));

        Map<String, Object> param = new HashMap();

        for(int i= 0; i < orderIdList.size(); i++) {

            StandardVO standard = orderDAO.getStandard(userIdList.get(i));

            int price = Integer.parseInt(priceList.get(i));
            int orderAmt = standard.getOrderAmt() - price < 0 ? 0 : standard.getOrderAmt() - price;
            int userAmt = standard.getUserAmt() - price < 0 ? 0 : standard.getUserAmt() - price;

            param.put("orderId", orderIdList.get(i));
            param.put("orderAmt", orderAmt);
            param.put("userAmt", userAmt);
            param.put("userId", userIdList.get(i));
            param.put("statusCode", statusCode);

            orderDAO.signOffOn(param);
            orderDAO.modifyAmt(param);
        }

        return orderIdList.size();
    }

}
