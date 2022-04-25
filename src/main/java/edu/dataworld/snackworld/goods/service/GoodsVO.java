package edu.dataworld.snackworld.goods.service;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class GoodsVO {

    private String gdsId;
    private int gdsPrice;
    private String catCode;
    private String gdsName;
    private String gdsUrl;
    private String storedFileName; // img file
    private String imgUrl; // img file
    private String delYn;
    private int gdsSeq;

    private String userId;

}
