package edu.dataworld.snackworld.order.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderVO {

    private String orderId;
    private String userId;
    private int totalPrice;
    private String status;

}
