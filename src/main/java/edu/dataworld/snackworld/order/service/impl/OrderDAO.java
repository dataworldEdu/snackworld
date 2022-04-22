package edu.dataworld.snackworld.order.service.impl;

import edu.dataworld.egov.cmm.service.impl.EgovComAbstractDAO;
import edu.dataworld.snackworld.order.service.OrderVO;
import org.springframework.stereotype.Repository;

import java.util.List;

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

    public void cartDelete(OrderVO vo) {
        update("order.cartDelete", vo);
    }
}
