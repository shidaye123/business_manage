<%--
  Created by IntelliJ IDEA.
  User: 石头
  Date: 2019/8/7
  Time: 22:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品信息</title>
</head>

<style>
    .head{
        width: 100px;
    }
    .date{
        width: 100px;
    }
</style>
<body>

<h1>商品信息</h1>
<table>
    <thead>
    <tr>
        <th class="head">商品id</th>
        <th class="head">类别id</th>
        <th class="head">商品名称</th>
        <th class="head">商品副标题</th>
        <th class="head">产品主图</th>
        <th class="head">图片地址</th>
        <th class="head">商品详情</th>
        <th class="head">价格</th>
        <th class="head">库存数量</th>
        <th class="head">商品状态</th>
        <th class="head">创建时间</th>
        <th class="head">更新时间</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${productList}" var="product">
        <tr>
            <td class="date">${product.id}</td>
            <td class="date">${product.categoryId}</td>
            <td class="date">${product.name}</td>
            <td class="date">${product.subtitle}</td>
            <td class="date">${product.mainImage}</td>
            <td class="date">${product.subImages}</td>
            <td class="date">${product.detail}</td>
            <td class="date">${product.price}</td>
            <td class="date">${product.stock}</td>
            <td class="date">${product.status}</td>
            <td class="date">${product.createTime}</td>
            <td class="date">${product.updateTime}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
