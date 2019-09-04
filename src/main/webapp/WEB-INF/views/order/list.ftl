<html>
<#include "common/header.ftl">

<body>
<div id="wrapper" class="toggled">

    <#--边栏sidebar-->
    <#include "common/nav.ftl">

    <#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <table class="table table-bordered table-condensed">
                        <thead>
                        <tr>
                            <th>订单编号</th>
                            <th>姓名</th>
                            <th>手机号</th>
                            <th>地址</th>
                            <th>金额</th>
                            <th>订单状态</th>
                            <th>支付状态</th>
                            <th>创建时间</th>
                            <th colspan="2">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <#list orderList as orderDTO>
                        <tr>
                            <td>${orderDTO.orderNo}</td>
                            <td>${orderDTO.receiverName}</td>
                            <td>${orderDTO.receiverPhone}</td>
                            <td>${orderDTO.receiverShipping}</td>
                            <td>${orderDTO.payment}</td>
                            <td>${orderDTO.statusDesc}</td>
                            <td>${orderDTO.paymentTypeDesc}</td>
                            <td>${orderDTO.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td><a href="/user/order/detail?orderNo=${orderDTO.orderNo}&status=${orderDTO.status}&statusDesc=${orderDTO.statusDesc}">详情</a></td>
<#--                            <td>-->
<#--                                <#if orderDTO.getOrderStatusEnum().message == "新订单">-->
<#--                                    <a href="/user/order/detail?orderNo=${orderDTO.orderNo}">取消</a>-->
<#--                                </#if>-->
<#--                            </td>-->
                        </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>

            <#--分页-->
                <div class="col-md-12 column">
                    <ul class="pagination pull-right">
                    <#if currentPage lte 1>
                        <li class="disabled"><a href="#">上一页</a></li>
                    <#else>
                        <li><a href="/user/order/list.do?page=${currentPage - 1}&size=${size}">上一页</a></li>
                    </#if>

<#--                    <#list 1..pageInfo.pages as index>-->
<#--                        <#if currentPage == index>-->
<#--                            <li class="disabled"><a href="#">${index}</a></li>-->
<#--                        <#else>-->
<#--                            <li><a href="/user/order/list.do?page=${index}&size=${size}">${index}</a></li>-->
<#--                        </#if>-->
<#--                    </#list>-->

                        <#if (pageInfo.pages > 0)>
                            <li <#if currentPage == 1>class="disabled"</#if>><a href="/user/order/list.do?page=1&size=${size}" >1</a></li>
                        </#if>
                        <#--如果不止有一页-->
                        <#if (pageInfo.pages > 1)>
                        <#--如果当前页往前查三页不是第二页-->
                            <#if ((currentPage - 3) > 2)>
                                <li><span class="text">…</span></li>
                            </#if>
                        <#--当前页的前三页和后三页-->
                            <#list (currentPage - 3)..(currentPage + 3) as index>
                            <#--如果位于第一页和最后一页之间-->
                                <#if (index > 1) && (index < pageInfo.pages)>
                                    <li <#if currentPage == index>class="disabled"</#if>><a href="/user/order/list.do?page=${index}&size=${size}" >${index}</a></li>
                                </#if>
                            </#list>
                        <#--如果当前页往后查三页不是倒数第二页-->
                            <#if (currentPage + 3) < (pageInfo.pages - 1)>
                                <li><span class="text">…</span></li>
                            </#if>
                        <#--最后页-->
                            <li <#if currentPage == pageInfo.pages>class="disabled"</#if>><a href="/user/order/list.do?page=${pageInfo.pages}&size=${size}" >${pageInfo.pages}</a></li>
                        </#if>

                    <#if currentPage gte pageInfo.pages>
                        <li class="disabled"><a href="#">下一页</a></li>
                    <#else>
                        <li><a href="/user/order/list.do?page=${currentPage + 1}&size=${size}">下一页</a></li>
                    </#if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</div>

<#--弹窗-->
<#--<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">-->
<#--    <div class="modal-dialog">-->
<#--        <div class="modal-content">-->
<#--            <div class="modal-header">-->
<#--                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>-->
<#--                <h4 class="modal-title" id="myModalLabel">-->
<#--                    提醒-->
<#--                </h4>-->
<#--            </div>-->
<#--            <div class="modal-body">-->
<#--                你有新的订单-->
<#--            </div>-->
<#--            <div class="modal-footer">-->
<#--                <button onclick="javascript:document.getElementById('notice').pause()" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>-->
<#--                <button onclick="location.reload()" type="button" class="btn btn-primary">查看新的订单</button>-->
<#--            </div>-->
<#--        </div>-->
<#--    </div>-->
<#--</div>-->

<#--&lt;#&ndash;播放音乐&ndash;&gt;-->
<#--<audio id="notice" loop="loop">-->
<#--    <source src="/sell/mp3/song.mp3" type="audio/mpeg" />-->
<#--</audio>-->

<#--<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>-->
<#--<script src="https://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>-->
<#--<script>-->
<#--    var websocket = null;-->
<#--    if('WebSocket' in window) {-->
<#--        websocket = new WebSocket('ws://sell.natapp4.cc/sell/webSocket');-->
<#--    }else {-->
<#--        alert('该浏览器不支持websocket!');-->
<#--    }-->

<#--    websocket.onopen = function (event) {-->
<#--        console.log('建立连接');-->
<#--    }-->

<#--    websocket.onclose = function (event) {-->
<#--        console.log('连接关闭');-->
<#--    }-->

<#--    websocket.onmessage = function (event) {-->
<#--        console.log('收到消息:' + event.data)-->
<#--        //弹窗提醒, 播放音乐-->
<#--        $('#myModal').modal('show');-->

<#--        document.getElementById('notice').play();-->
<#--    }-->

<#--    websocket.onerror = function () {-->
<#--        alert('websocket通信发生错误！');-->
<#--    }-->

<#--    window.onbeforeunload = function () {-->
<#--        websocket.close();-->
<#--    }-->

<#--</script>-->

</body>
</html>