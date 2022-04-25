package edu.dataworld.snackworld.order.service.impl;

import edu.dataworld.egov.cmm.service.impl.EgovComAbstractDAO;
import edu.dataworld.snackworld.common.Search;
import edu.dataworld.snackworld.order.service.OrderVO;
import edu.dataworld.snackworld.standard.service.StandardVO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("OrderDAO")
public class OrderDAO extends EgovComAbstractDAO {


    public List<OrderVO> cartRetrieve(OrderVO vo) {
        return selectList("order.cartRetrieve", vo);
    }

    public int cartInsert(OrderVO vo) {
        return insert("order.cartInsert", vo);
    }

    public void cartQtyUpdate(OrderVO vo) {
        update("order.cartQtyUpdate", vo);
    }

    public void cartDelete(String cartId) {
        update("order.cartDelete", cartId);
    }

    public List<OrderVO> listOption() {
        return selectList("order.listOption");
    }

    public int orderCnt(Search search) {
        return selectOne("order.orderCnt", search);
    }

    public List<OrderVO> orderRetrieve(Search search) {
        return selectList("order.orderRetrieve", search);
    }

    public int orderInsert(OrderVO vo) { return insert("order.orderInsert", vo); }

    public void orderDetailInsert(OrderVO vo){
        insert("order.orderDetailInsert", vo);
    }

    public int cancelOrder(List<String> checkBoxArr) {
        return update("order.cancelOrder", checkBoxArr);
    }

    public int sendBack(Map<String, Object> param) {
        return update("order.sendBack", param);
    }

    public int signOffOn(Map<String, Object> param) {
        return update("order.signOffOn", param);
    }

    public int modifyAmt(Map<String, Object> param) {
        return update("order.modifyAmt", param);
    }

    public StandardVO getStandard(String userId) {
        return selectOne("order.getStandard", userId);
    }

    public List<OrderVO> orderDetailRetrieve(String orderId) {
        return selectList("orderDetailRetrieve", orderId);
    }

    public void signOffOnDetail(Map<String, Object> param) {
        update("order.signOffOnDetail", param);
    }
}
