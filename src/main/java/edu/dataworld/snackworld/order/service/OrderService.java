package edu.dataworld.snackworld.order.service;

import edu.dataworld.snackworld.common.Search;
import org.mvel2.ast.Or;

import java.util.List;
import java.util.Map;

public interface OrderService {


    List<OrderVO> cartRetrieve(OrderVO vo);
    int cartInsert(OrderVO vo);
    void cartQtyUpdate(OrderVO vo);
    void cartDelete(String cartId);
    List<OrderVO> listOption();
    int orderCnt(Search search);
    List<OrderVO> orderRetrieve(Search search);
    void orderInsert(String userId, String cartId, String gdsId, String gdsPrice, String qty);
    void orderDetailInsert(OrderVO vo);
    int cancelOrder(List<String> checkBoxArr);
    int sendBack(Map<String, Object> param);
    int signOffOn(String orderId, String orderPrice, String userId, String statusCode);
    List<OrderVO> orderDetailRetrieve(String orderId);
}
