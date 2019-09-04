package com.neuedu.controller;

import com.neuedu.constant.Constant;
import com.neuedu.pojo.Order;
import com.neuedu.pojo.UserInfo;
import com.neuedu.service.IOrderService;
import com.neuedu.service.impl.OrderServiceImpl;
import com.neuedu.vo.OrderDetailVO;
import com.neuedu.vo.OrderListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller()
@RequestMapping("/user/order")
public class OrderController {

    @Autowired
    OrderServiceImpl orderService;

    //list列表
    @RequestMapping(value = "/list.do",method = RequestMethod.GET)
    public String orderList(@RequestParam(name = "page",required = false,defaultValue = "1")Integer pageNum,
                            @RequestParam(name = "size",required = false,defaultValue = "5")Integer pageSize,
                            HttpSession session){


        session.setAttribute("currentPage",pageNum);
        session.setAttribute("size",pageSize);
        UserInfo user = (UserInfo) session.getAttribute(Constant.CURRENT_USER);
        if (user==null){
            return "login/login";
        }

        List<OrderListVO> orderListVOList = orderService.getOrderList(pageNum,pageSize,session);
        session.setAttribute("orderList",orderListVOList);

        return "order/list";
    }


    @RequestMapping(value = "/detail",method = RequestMethod.GET)
    public String orderDetail(@RequestParam("orderNo")long orderNo,
                              @RequestParam(name = "status")Integer status,
                              @RequestParam(name = "statusDesc")String statusDesc,
                              HttpSession session){

        OrderDetailVO orderDetailVO = orderService.getOrderDetail(orderNo);
        session.setAttribute("orderDTO",orderDetailVO);
        session.setAttribute("status",status);
        session.setAttribute("statusDesc",statusDesc);

        return "order/detail";

    }

    //发货
    @RequestMapping(value = "/send",method = RequestMethod.GET)
    public String send(@RequestParam(name = "orderNo")long orderNo,
                       @RequestParam(name = "status")Integer status,
                       @RequestParam(name = "statusDesc")String statusDesc,
                       HttpSession session){

        orderService.send(orderNo);
        OrderDetailVO orderDetailVO = orderService.getOrderDetail(orderNo);
        session.setAttribute("orderDTO",orderDetailVO);
        session.setAttribute("status",status);
        session.setAttribute("statusDesc",statusDesc);

        return "order/detail";

    }


}
