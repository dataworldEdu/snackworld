package edu.dataworld.snackworld.order.service;

import edu.dataworld.snackworld.common.Search;
import edu.dataworld.snackworld.goods.service.GoodsVO;
import edu.dataworld.snackworld.user.service.UserVO;

import java.util.List;

public interface OrderService {


    List<OrderVO> cartRetrieve(OrderVO vo);
    int cartInsert(OrderVO vo);
    void cartQtyUpdate(OrderVO vo);
    void cartDelete(OrderVO vo);
    List<OrderVO> listOption();

    int orderCnt(Search search);

    List<OrderVO> orderRetrieve(Search search);
}
