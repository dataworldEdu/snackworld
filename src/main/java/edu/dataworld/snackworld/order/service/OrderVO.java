package edu.dataworld.snackworld.order.service;

import edu.dataworld.snackworld.goods.service.GoodsVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderVO extends GoodsVO {

    private String cartId;
    private String orderId;
    private String orderDetailId;
    private String userId;
    private String userName;
    private String orderStatusCode;
    private String status;
    private String orderName;
    private String delYn;
    private int qty;
    private int totalPrice;
}
