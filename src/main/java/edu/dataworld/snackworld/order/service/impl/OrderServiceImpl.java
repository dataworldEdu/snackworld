package edu.dataworld.snackworld.order.service.impl;

import edu.dataworld.snackworld.order.service.OrderService;
import edu.dataworld.snackworld.order.service.OrderVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("OrderService")
public class OrderServiceImpl extends EgovAbstractServiceImpl implements OrderService {

    @Resource(name = "OrderDAO")
    private OrderDAO orderDAO;

    @Override
    public List<OrderVO> cartRetrieve(OrderVO vo) {
        return orderDAO.cartRetrieve(vo);
    }

    @Override
    public int cartInsert(OrderVO vo) {
        return orderDAO.cartInsert(vo);
    }

    @Override
    public void cartQtyUpdate(OrderVO vo) {
        orderDAO.cartQtyUpdate(vo);
    }

    @Override
    public void cartDelete(OrderVO vo) {
        orderDAO.cartDelete(vo);
    }
}
