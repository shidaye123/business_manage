package com.neuedu.service;

import com.neuedu.pojo.Order;
import com.neuedu.vo.OrderDetailVO;
import com.neuedu.vo.OrderListVO;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface IOrderService {

    //订单列表
    List<OrderListVO> getOrderList(Integer pageNum, Integer pageSize, HttpSession session);
    //订单详情
    OrderDetailVO getOrderDetail(long orderNo);
    //发货
    int send(long orderNo);

}
