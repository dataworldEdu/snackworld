package edu.dataworld.snackworld.goods.service;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class GoodsVO {

    //goods info
    private String gdsId;
    private String gdsName;
    private int gdsPrice;
    private String catCode;
    private String delYn;
    private int gdsSeq;

    // img file
    private String storedFileName;
}
