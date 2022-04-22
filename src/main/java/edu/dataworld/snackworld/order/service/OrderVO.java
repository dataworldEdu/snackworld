package edu.dataworld.snackworld.order.service;

import edu.dataworld.snackworld.goods.service.GoodsVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderVO extends GoodsVO {

    private String orderId;
    private String userId;
    private int totalPrice;
    private String status;

    //cart
    private String cartId;
    private String gdsId;
    private int qty;
    private String delYn;
}
