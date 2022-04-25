package edu.dataworld.snackworld.goods.service.impl;

import edu.dataworld.snackworld.common.Search;
import edu.dataworld.snackworld.goods.service.GoodsService;
import edu.dataworld.snackworld.goods.service.GoodsVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("GoodsService")
public class GoodsServiceImpl implements GoodsService {

    @Resource(name="GoodsDAO")
    private GoodsDAO goodsDAO;

    @Override
    public List<GoodsVO> retrieve(Search search) {
        return goodsDAO.retrieve(search);
    }

    @Override
    public List<GoodsVO> listSearch(Search search) {
        return goodsDAO.listSearch(search);
    }

    @Override
    public GoodsVO selectById(String gdsId) {
        return goodsDAO.selectById(gdsId);
    }

    @Override
    public void modifyGoods(GoodsVO vo) {
        if ("".equals(vo.getGdsUrl())) {
            goodsDAO.updateWithoutURL(vo);
        }else{
            goodsDAO.modifyGoods(vo);
        }
    }

    @Override
    public int goodsCnt(Search search) {
        return goodsDAO.goodsCnt(search);
    }

    @Override
    public void setRowNum() {
        goodsDAO.setRowNum();
    }

    @Override
    public void deleteById(GoodsVO vo) {
        goodsDAO.deleteById(vo);
    }

    @Override
    public List<GoodsVO> goodsList(Search param) {
        return goodsDAO.goodsList(param);
    }

    @Override
    public void registrationGoods(GoodsVO vo) {
        if ("".equals(vo.getGdsUrl())) {
            goodsDAO.insertGoodsWithOutUrl(vo);
        }else{
            goodsDAO.insertGoods(vo);
        }
        System.out.println("vo = " + vo.getGdsId());
    }
}
