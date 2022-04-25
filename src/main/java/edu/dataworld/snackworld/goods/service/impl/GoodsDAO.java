package edu.dataworld.snackworld.goods.service.impl;

import edu.dataworld.egov.cmm.service.impl.EgovComAbstractDAO;
import edu.dataworld.snackworld.common.Search;
import edu.dataworld.snackworld.goods.service.GoodsVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("GoodsDAO")
public class GoodsDAO extends EgovComAbstractDAO {

    public List<GoodsVO> retrieve(Search search){
        return selectList("goods.retrieve", search);
    }
    public List<GoodsVO> listSearch(Search search){ return selectList("goods.listSearch", search); }
    public void insert(GoodsVO vo) {
        insert("goods.insert", vo);
    }
    public void modifyGoods(GoodsVO vo) {
        update("goods.modifyGoods", vo);
    }
    public void updateWithoutURL(GoodsVO vo) {
        update("goods.updateWithoutURL", vo);
    }
    public void fileUpload(GoodsVO vo) {}
    public void deleteById(GoodsVO vo) { update("goods.deleteById", vo);}
    public GoodsVO selectById(String gdsId){
        return selectOne("goods.selectById", gdsId);
    }
    public int goodsCnt(Search search) {
        return selectOne("goods.goodsCnt", search);
    }
    public void setRowNum() { update("goods.setRowNum"); }

    public List<GoodsVO> goodsList(Search search) {
        return selectList("goods.goodsList", search);
    }
}
