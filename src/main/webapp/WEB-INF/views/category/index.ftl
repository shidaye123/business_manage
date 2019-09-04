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
                    <form role="form" method="post" action="">
                        <div class="form-group">
                            <label>名字</label>
                            <input required="required" name="name" type="text" class="form-control" value="${(category.name)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>类目</label>
                            <select name="parentId" class="form-control">
                                <option value=""></option>
                                <#list parentCategory as parent>
                                    <option value="${parent.id}"
                                        <#if new != 1>
                                            <#if category.parentId == parent.id>
                                                selected="selected"
                                            </#if>
                                        </#if>
                                    >${parent.name}</option>
                                </#list>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>状态</label>
                            <select required="required" name="status" class="form-control">
                                <option value=""></option>
                                <option value="1"
                                    <#if new != 1>
                                        <#if category.status == 1>
                                            selected="selected"
                                        </#if>
                                    </#if>
                                >正常</option>
                                <option value="2"
                                    <#if new != 1>
                                        <#if category.status == 2>
                                            selected="selected"
                                        </#if>
                                    </#if>
                                >已废弃</option>
                            </select>
                        </div>
                        <input hidden type="text" name="id" value="${(category.id)!''}">
                        <button type="submit" class="btn btn-default">提交</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>