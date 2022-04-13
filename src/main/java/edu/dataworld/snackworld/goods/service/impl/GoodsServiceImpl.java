package edu.dataworld.snackworld.goods.service.impl;

import edu.dataworld.snackworld.common.Search;
import edu.dataworld.snackworld.goods.service.GoodsService;
import edu.dataworld.snackworld.goods.service.GoodsVO;
import edu.dataworld.snackworld.user.service.impl.UserDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("GoodsService")
public class GoodsServiceImpl implements GoodsService {

    @Resource(name="GoodsDAO")
    private GoodsDAO goodsDAO;

    @Override
    public List<GoodsVO> retrieve(Search search) {
        List<GoodsVO> beforeList = goodsDAO.retrieve(search);
        List<GoodsVO> afterList = new ArrayList<>();
        for(GoodsVO temp : beforeList){
            switch (temp.getCatCode()){
                case "01":
                    temp.setCatCode("스낵");
                    afterList.add(temp);
                    break;
                case "02":
                    temp.setCatCode("사탕");
                    afterList.add(temp);
                    break;
                case "03":
                    temp.setCatCode("초콜릿");
                    afterList.add(temp);
                    break;
                case "04":
                    temp.setCatCode("젤리");
                    afterList.add(temp);
                    break;
                case "05":
                    temp.setCatCode("파이류");
                    afterList.add(temp);
                    break;
            }
        }
        return afterList;
//        return goodsDAO.retrieve(search);
    }

    @Override
    public GoodsVO selectById(String gdsId) {
        return goodsDAO.selectById(gdsId);
    }

    @Override
    public int goodsCnt() {
        return goodsDAO.goodsCnt();
    }

    @Override
    public void setRowNum() {
        goodsDAO.setRowNum();
    }
}
