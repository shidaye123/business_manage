<html>
<#include  "common/header.ftl">
<style>
    #delete{
        color: red;
        margin-left: 20px;
    }
    .head{
        width: 230px;
    }
    .data{
        width: 230px;
    }
</style>
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
                            <th class="head">类目id</th>
                            <th class="head">所属父类</th>
                            <th class="head">类别名称</th>
                            <th class="head">类别状态</th>
                            <th class="head">创建时间</th>
                            <th class="head">修改时间</th>
                            <th class="head">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <#list categoryList as category>
                        <tr>
                            <td class="data">${category.id}</td>
                            <td class="data">
                                <#list parentCategory as parent>
                                    <#if category.parentId == parent.id>
                                        ${parent.name}
                                    </#if>
                                </#list>
                            </td>
                            <td class="data">${category.name}</td>
                            <td class="data">
                                <#if category.status == 1>
                                    正常
                                <#elseif category.status == 2>
                                    已废弃
                                </#if>
                            </td>
                            <td class="data">${category.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td class="data">${category.updateTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td class="data">
                                <a href="/user/category/update?id=${category.id}">修改</a>
                                <a id="delete" href="/user/category/delete?id=${category.id}">删除</a>
                            </td>
                        </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>