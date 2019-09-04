package com.neuedu.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neuedu.constant.Constant;
import com.neuedu.dao.OrderItemMapper;
import com.neuedu.dao.OrderMapper;
import com.neuedu.dao.ShippingMapper;
import com.neuedu.exception.MyException;
import com.neuedu.pojo.Order;
import com.neuedu.pojo.OrderItem;
import com.neuedu.pojo.Shipping;
import com.neuedu.service.IOrderService;
import com.neuedu.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Service
public class OrderServiceImpl implements IOrderService {

    @Autowired
    OrderMapper orderMapper;
    @Autowired
    OrderItemMapper orderItemMapper;
    @Autowired
    ShippingMapper shippingMapper;

    //订单列表
    @Override
    public List<OrderListVO> getOrderList(Integer pageNum, Integer pageSize, HttpSession session) {

        List<OrderListVO> orderListVOList = new ArrayList<>();
        List<OrderVO> orderVOList = new ArrayList<>();
        Page page = PageHelper.startPage(pageNum,pageSize);
        List<Order> orderList = orderMapper.selectAll();
        if (orderList!=null&&orderList.size()>0){
            for (Order order:orderList){
                List<OrderItem> orderItemList = orderItemMapper.getOrderProductByOrderNo(order.getOrderNo());
                Integer shippingId = order.getShippingId();
                if (orderItemList==null||orderItemList.size()<=0){
                    throw new MyException("未查询到订单详情信息！");
                }
                if (shippingId==null){
                    throw new MyException("未获取到收获地址！");
                }
                OrderVO orderVO = getOrderVO(order,orderItemList,shippingId,order.getUserId());
                if (orderVO!=null){
                    orderVOList.add(orderVO);
                }
            }
        }else {
            throw new MyException("未查询到订单信息！");
        }

        PageInfo pageInfo = new PageInfo(page);
        pageInfo.setList(orderVOList);
        session.setAttribute("pageInfo",pageInfo);

        if (orderVOList!=null&&orderVOList.size()>0){
            for (OrderVO orderVO:orderVOList){
                OrderListVO orderListVO = new OrderListVO();
                orderListVO.setOrderId(orderVO.getOrderId());
                orderListVO.setOrderNo(orderVO.getOrderNo());
                ShippingVO shippingVO = orderVO.getShippingVO();
                orderListVO.setReceiverName(shippingVO.getReceiverName());
                orderListVO.setReceiverPhone(shippingVO.getReceiverPhone());
                orderListVO.setReceiverShipping(shippingVO.getReceiverProvince()+shippingVO.getReceiverCity()+shippingVO.getReceiverDistrict()+shippingVO.getReceiverAdress());
                orderListVO.setPayment(orderVO.getPayment());
                orderListVO.setStatus(orderVO.getStatus());
                orderListVO.setStatusDesc(orderVO.getStatusDesc());
                orderListVO.setPaymentType(orderVO.getPaymentType());
                orderListVO.setPaymentTypeDesc(orderVO.getPaymentTypeDesc());
                orderListVO.setCreateTime(orderVO.getCreateTime());
                orderListVOList.add(orderListVO);
            }
        }

        if (orderListVOList==null){
            throw new MyException("没有订单");
        }

        return orderListVOList;

    }

    //订单详情
    @Override
    public OrderDetailVO getOrderDetail(long orderNo) {

        OrderDetailVO orderDetailVO = new OrderDetailVO();
        Order order = orderMapper.getOrderDetailByOrderNo(orderNo);
        if (order==null){
            throw new MyException("没有此订单");
        }
        //赋值order属性
        orderDetailVO.setId(order.getId());
        orderDetailVO.setOrderNo(order.getOrderNo());
        orderDetailVO.setUserId(order.getUserId());
        orderDetailVO.setShippingId(order.getShippingId());
        orderDetailVO.setPayment(order.getPayment());
        orderDetailVO.setPaymentType(order.getPaymentType());
        orderDetailVO.setPostage(order.getPostage());
        orderDetailVO.setStatus(order.getStatus());
        orderDetailVO.setPaymentTime(order.getPaymentTime());
        orderDetailVO.setSendTime(order.getSendTime());
        orderDetailVO.setEndTime(order.getEndTime());
        orderDetailVO.setCloseTime(order.getCloseTime());
        orderDetailVO.setCreateTime(order.getCreateTime());

        List<OrderItem> orderItemList = orderItemMapper.getOrderItemByOrderNo(orderNo);
        if (orderItemList!=null&&orderItemList.size()>0){
            orderDetailVO.setOrderItemList(orderItemList);
        }

        if (orderDetailVO==null){
            throw new MyException("详情为空");
        }

        return orderDetailVO;
    }

    //发货
    @Override
    public int send(long orderNo) {

        int result = orderMapper.send(orderNo);
        if (result==0){
            throw new MyException("订单不存在");
        }
        return 1;
    }

    //orderVO
    private OrderVO getOrderVO(Order order,List<OrderItem> orderItemList,Integer shippingId,Integer userId){

        OrderVO orderVO = new OrderVO();
        orderVO.setOrderId(order.getId());
        orderVO.setOrderNo(order.getOrderNo());
        orderVO.setPayment(order.getPayment());
        orderVO.setPaymentType(order.getPaymentType());
        Constant.paymentTypeEnum paymentTypeEnum = Constant.paymentTypeEnum.codeof(order.getPaymentType());
        if (paymentTypeEnum!=null){
            orderVO.setPaymentTypeDesc(paymentTypeEnum.getPaymentTypeMsg());
        }
        orderVO.setPostage(order.getPostage());
        orderVO.setStatus(order.getStatus());
        Constant.orderStatusEnum orderStatusEnum = Constant.orderStatusEnum.codeof(order.getStatus());
        if (orderStatusEnum!=null){
            orderVO.setStatusDesc(orderStatusEnum.getOrderStatusMsg());
        }
        orderVO.setPaymentTime(order.getPaymentTime());
        orderVO.setSendTime(order.getSendTime());
        orderVO.setEndTime(order.getEndTime());
        orderVO.setCloseTime(order.getCloseTime());
        orderVO.setCreateTime(order.getCreateTime());
        List<OrderItemVO> orderItemVOList = new ArrayList<>();
        if (orderItemList!=null&&orderItemList.size()>0){
            for (OrderItem orderItem:orderItemList){
                OrderItemVO orderItemVO = getOrderItemVO(orderItem);
                if (orderItemVO!=null){
                    orderItemVOList.add(orderItemVO);
                }
            }
        }
        orderVO.setOrderItemVOList(orderItemVOList);
        orderVO.setShippingId(shippingId);
        ShippingVO shippingVO = getShippingVO(shippingId,userId);
        orderVO.setReceiverName(shippingVO.getReceiverName());
        orderVO.setShippingVO(shippingVO);

        return orderVO;
    }

    //shippingVO
    private ShippingVO getShippingVO(Integer shippingId, Integer userId){

        ShippingVO shippingVO = new ShippingVO();
        Shipping shipping = shippingMapper.getDetailAdress(shippingId,userId);
        shippingVO.setReceiverName(shipping.getReceiverName());
        shippingVO.setReceiverPhone(shipping.getReceiverPhone());
        shippingVO.setReceiverMobile(shipping.getReceiverMobile());
        shippingVO.setReceiverProvince(shipping.getReceiverProvince());
        shippingVO.setReceiverCity(shipping.getReceiverCity());
        shippingVO.setReceiverDistrict(shipping.getReceiverDistrict());
        shippingVO.setReceiverAdress(shipping.getReceiverAddress());
        shippingVO.setReceiverZip(shipping.getReceiverZip());

        return shippingVO;

    }

    //orderItermVO
    private OrderItemVO getOrderItemVO(OrderItem orderItem){

        OrderItemVO orderItemVO = new OrderItemVO();

        orderItemVO.setOrderNo(orderItem.getOrderNo());
        orderItemVO.setProductId(orderItem.getProductId());
        orderItemVO.setProductName(orderItem.getProductName());
        orderItemVO.setProductImage(orderItem.getProductImage());
        orderItemVO.setCurrentUnitPrice(orderItem.getCurrentUnitPrice());
        orderItemVO.setQuantity(orderItem.getQuantity());
        orderItemVO.setTotalPrice(orderItem.getTotalPrice());
        orderItemVO.setCreateTime(orderItem.getCreateTime());

        return orderItemVO;
    }

}
