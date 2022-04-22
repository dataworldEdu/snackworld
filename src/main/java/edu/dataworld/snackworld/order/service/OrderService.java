package edu.dataworld.snackworld.order.service;

import java.util.List;

public interface OrderService {


    List<OrderVO> cartRetrieve(OrderVO vo);
    int cartInsert(OrderVO vo);
    void cartQtyUpdate(OrderVO vo);
    void cartDelete(OrderVO vo);

}
