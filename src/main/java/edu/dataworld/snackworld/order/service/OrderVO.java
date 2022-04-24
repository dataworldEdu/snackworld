package edu.dataworld.snackworld.order.service;

import edu.dataworld.snackworld.goods.service.GoodsVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderVO extends GoodsVO {

    private String cartId;
    private String orderId;
    private String orderName;
    private String orderDetailId;
    private String orderStatusCode;
    private String orderStatus;
    private String userId;
    private String userName;
    private int qty;
    private int totalPrice;
}
