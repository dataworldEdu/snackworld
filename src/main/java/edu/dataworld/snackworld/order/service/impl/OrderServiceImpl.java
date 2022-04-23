package edu.dataworld.snackworld.order.service.impl;

import edu.dataworld.snackworld.common.Search;
import edu.dataworld.snackworld.order.service.OrderService;
import edu.dataworld.snackworld.order.service.OrderVO;
import edu.dataworld.snackworld.user.service.UserVO;
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

    @Override
    public List<OrderVO> listOption() {
        return orderDAO.listOption();
    }

    @Override
    public int orderCnt(Search search) {
        return orderDAO.orderCnt(search);
    }

    @Override
    public List<OrderVO> orderRetrieve(Search search) {
        return orderDAO.orderRetrieve(search);
    }

    @Override
    public int orderInsert(OrderVO vo) {
        return orderDAO.orderInsert(vo);
    }

    @Override
    public void orderDetailInsert(OrderVO vo) {
        orderDAO.orderDetailInsert(vo);
    }
}
