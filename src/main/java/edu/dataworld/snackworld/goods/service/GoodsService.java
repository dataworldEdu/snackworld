package edu.dataworld.snackworld.goods.service;

import edu.dataworld.snackworld.common.Search;
import edu.dataworld.snackworld.user.service.UserVO;

import java.util.List;

public interface GoodsService {

    List<GoodsVO> retrieve(Search search);
    List<GoodsVO> listSearch(Search search);
    int goodsCnt(Search search);
    void setRowNum();
    GoodsVO selectById(String gdsId);
    void modifyGoods(GoodsVO vo);

}
