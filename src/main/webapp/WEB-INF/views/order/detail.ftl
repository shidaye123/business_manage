<html>
<#include "common/header.ftl">


<body>
<div id="wrapper" class="toggled">

    <#--边栏sidebar-->
    <#include "common/nav.ftl">


    <#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-4 column">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>订单编号</th>
                            <th>订单总金额</th>
                            <th>订单状态</th>
                            <th>是否发货</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>${orderDTO.orderNo}</td>
                            <td>${orderDTO.payment}</td>
                            <td>${statusDesc}</td>
                            <td>
                                <#if status == 20>
                                    <a href="/user/order/send?orderNo=${orderDTO.orderNo}&status=${orderDTO.status}&statusDesc=${orderDTO.statusDesc}">发货</a>
                                <#elseif status gte 40>
                                    <p>已发货</p>
                                <#elseif status == 10>
                                    <p>未付款</p>
                                <#elseif status == 0>
                                    <p>已取消</p>
                                </#if>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

            <#--订单详情表数据-->
                <div class="col-md-12 column">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>商品id</th>
                            <th>商品名称</th>
                            <th>价格</th>
                            <th>数量</th>
                            <th>总额</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list orderDTO.orderItemList as orderDetail>
                        <tr>
                            <td>${orderDetail.productId}</td>
                            <td>${orderDetail.productName}</td>
                            <td>${orderDetail.currentUnitPrice}</td>
                            <td>${orderDetail.quantity}</td>
                            <td>${orderDetail.quantity * orderDetail.currentUnitPrice}</td>
                        </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>

            <#--操作-->
                <div class="col-md-12 column">
                <#if orderDTO.getOrderStatusEnum().message == "新订单">
                    <a href="/sell/seller/order/finish?orderId=${orderDTO.orderId}" type="button" class="btn btn-default btn-primary">完结订单</a>
                    <a href="/sell/seller/order/cancel?orderId=${orderDTO.orderId}" type="button" class="btn btn-default btn-danger">取消订单</a>
                </#if>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>