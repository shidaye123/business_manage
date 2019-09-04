package com.neuedu.dao;

import com.neuedu.pojo.OrderItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderItemMapper {
    //添加订单明细
    int insertOrderItems(@Param("orderItemList") List<OrderItem> orderItemList);
    //获取订单商品信息
    List<OrderItem> getOrderProductInfo(Integer userId);
    //获取订单商品信息
    List<OrderItem> getOrderProductByOrderNo(@Param("orderNo") long orderNo);
    //删除订单详情
    int cancelOrder(@Param("orderNo") long orderNo, @Param("userId") Integer userId);
    //根据订单号获取订单详情
    List<OrderItem> getOrderItemByOrderNo(@Param("orderNo") long orderNo);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table neuedu_order_item
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table neuedu_order_item
     *
     * @mbggenerated
     */
    int insert(OrderItem record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table neuedu_order_item
     *
     * @mbggenerated
     */
    OrderItem selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table neuedu_order_item
     *
     * @mbggenerated
     */
    List<OrderItem> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table neuedu_order_item
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(OrderItem record);
}