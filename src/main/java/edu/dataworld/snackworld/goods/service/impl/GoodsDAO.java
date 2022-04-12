package edu.dataworld.snackworld.goods.service.impl;

import edu.dataworld.egov.cmm.service.impl.EgovComAbstractDAO;
import edu.dataworld.snackworld.goods.service.GoodsVO;
import edu.dataworld.snackworld.user.service.UserVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("GoodsDAO")
public class GoodsDAO extends EgovComAbstractDAO {

    public List<GoodsVO> retrieve(GoodsVO vo){
        return selectList("goods.retrieve",vo);
    }
    public void insert(GoodsVO vo) {
        insert("goods.insert", vo);
    }

    public void update(GoodsVO vo) {
        update("goods.update", vo);
    }

    public void fileUpload(GoodsVO vo) {}
}
