package edu.dataworld.snackworld.common;

import edu.dataworld.snackworld.goods.service.GoodsVO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
@Getter @Setter
public class DataSet {

    List<GoodsVO> rows;
    int totCnt;
    int startNum;
    int resultCode;

}
