<html>
<#include "common/header.ftl">

<style>
    #delete{
        color: red;
        margin-left: 20px;
    }
    .head{
        width: 160px;
    }
    .data{
        width: 160px;
    }
    .distance{
        margin-bottom: 50px;
    }
    #search{
        position: absolute;
        right: 16px;
        top: 24px;
    }
</style>

<body>
<div id="wrapper" class="toggled">

    <#--边栏sidebar-->
    <#include "common/nav.ftl">

    <form action="/user/product/info" class="form-inline" id="search">
        <div class="form-group">
            <label class="sr-only" for="exampleInputAmount"></label>
            <div class="input-group">
                <input type="text" class="form-control" id="exampleInputAmount" name="searchKey" placeholder="商品关键字" value="${(searchKey)!''}">
            </div>
        </div>
        <button type="submit" class="btn btn-primary">搜索</button>
    </form>
    <#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">



                    <table class="table table-bordered table-condensed">
                        <thead>
                        <tr>
                            <th class="head">商品id</th>
                            <th class="head">名称</th>
                            <th class="head">主图</th>
                            <th class="head">副图</th>
                            <th class="head">单价</th>
                            <th class="head">库存</th>
                            <th class="head">描述</th>
                            <th class="head">类目</th>
                            <th class="head">创建时间</th>
                            <th class="head">修改时间</th>
                            <th class="head" colspan="2">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <#list productList as productInfo>
                        <tr>
                            <td class="data">${productInfo.id}</td>
                            <td class="data">${productInfo.name}</td>
                            <td class="data">
                                <a href="http://img.cdn.imbession.top/${productInfo.mainImage}" target="_blank">
                                    <img height="100" width="100"  src="http://img.cdn.imbession.top/${productInfo.mainImage}" alt="">
                                </a>
                            </td>
                            <td class="data">
                                <#list productInfo.subimage!'' as subimg>
                                    <a href="http://img.cdn.imbession.top/${subimg}" target="_blank">
                                        <img height="100" width="100" src="http://img.cdn.imbession.top/${subimg}" alt="">
                                    </a>
                                </#list>
                            </td>
                            <td class="data">${productInfo.price}</td>
                            <td class="data">${productInfo.stock}</td>
                            <td class="data"></td>
                            <td class="data">
                                <#list parentCategory as parentCategory>
                                    <#if parentCategory.id == productInfo.categoryId>
                                        ${parentCategory.name}
                                    </#if>
                                </#list>
                            </td>
                            <td class="data">${productInfo.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td class="data">${productInfo.updateTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td class="data">
                                <a href="/user/product/update?id=${productInfo.id}&page=${currentPage}&size=${size}">修改</a>
                                <a id="delete" href="/user/product/delete?id=${productInfo.id}&page=${currentPage}&size=${size}">删除</a>
                                <#if productInfo.status == 1>
                                    <a class="distance" href="/user/product/grounding?id=${productInfo.id}&page=${currentPage}&size=${size}">下架</a>
                                <#elseif productInfo.status == 2>
                                    <a class="distance" href="/user/product/undercarriage?id=${productInfo.id}&page=${currentPage}&size=${size}">上架</a>
                                </#if>
                            </td>
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
                            <li><a href="/user/product/info?page=${currentPage - 1}&size=${size}&searchKey=${(searchKey)!''}">上一页</a></li>
                        </#if>

<#--                        <#list 1..pageInfo.pages as index>-->
<#--                            <#if currentPage == index>-->
<#--                                <li class="disabled"><a href="#">${index}</a></li>-->
<#--                            <#else>-->
<#--                                <li><a href="/user/order/list.do?page=${index}&size=${size}">${index}</a></li>-->
<#--                            </#if>-->
<#--                        </#list>-->

                        <#--第一页-->
                        <#if (pageInfo.pages > 0)>
                            <li <#if currentPage == 1>class="disabled"</#if>><a href="/user/product/info?page=1&size=${size}&searchKey=${(searchKey)!''}" >1</a></li>
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
                                    <li <#if currentPage == index>class="disabled"</#if>><a href="/user/product/info?page=${index}&size=${size}&searchKey=${(searchKey)!''}" >${index}</a></li>
                                </#if>
                            </#list>
                        <#--如果当前页往后查三页不是倒数第二页-->
                            <#if (currentPage + 3) < (pageInfo.pages - 1)>
                                <li><span class="text">…</span></li>
                            </#if>
                        <#--最后页-->
                            <li <#if currentPage == pageInfo.pages>class="disabled"</#if>><a href="/user/product/info?page=${pageInfo.pages}&size=${size}&searchKey=${(searchKey)!''}" >${pageInfo.pages}</a></li>
                        </#if>

                        <#if currentPage gte pageInfo.pages>
                            <li class="disabled"><a href="#">下一页</a></li>
                        <#else>
                            <li><a href="/user/order/list.do?page=${currentPage + 1}&size=${size}&searchKey=${(searchKey)!''}">下一页</a></li>
                        </#if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>