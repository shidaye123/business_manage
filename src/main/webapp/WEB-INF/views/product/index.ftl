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
                    <form role="form" method="post" action="" enctype="multipart/form-data">
                        <div class="form-group">
                            <label>名称</label>
                            <input name="name" type="text" class="form-control" value="${(productInfo.name)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>商品副标题</label>
                            <input name="subtitle" type="text" class="form-control" value="${(productInfo.subtitle)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>价格</label>
                            <input name="price" type="text" class="form-control" value="${(productInfo.price)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>库存</label>
                            <input name="stock" type="number" class="form-control" value="${(productInfo.stock)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>描述</label>
                            <input name="detail" type="text" class="form-control" value="${(productInfo.detail)!''}"/>
                        </div>
                        <div class="form-group">

                            <label>主图</label>
                            <input id="productIcon" name="mainImage" type="text" hidden="hidden" value="${(productInfo.mainImage)!''}"/>

                            <div class="file-loading">
                                <input id="input-id" name="pic" type="file">
                                <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过1M</p>
                            </div>
                        </div>
                        <div class="form-group">

                            <label>子图(最多允许上传10张图片)</label>
                            <input id="productIcon2" name="subImages" type="text" hidden="hidden" value="${(productInfo.subImages)!''}"/>

                            <div class="file-loading">
                                <input id="sub-input-id" name="subpic" type="file" multiple="multiple">
                                <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过1M</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>类目</label>
                            <select name="categoryId" class="form-control">
                                <#list categoryList as category>
                                    <option value="${category.id}">${category.name}</option>
                                </#list>
                            </select>
                        </div>
                        <input hidden type="text" name="id" value="${(productInfo.id)!''}">
                        <input hidden type="text" name="currentPage" value="${(currentPage)!''}">
                        <input hidden type="text" name="size" value="${(size)!''}">
                        <button type="submit" class="btn btn-default">提交</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-fileinput/4.4.8/js/fileinput.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-fileinput/4.4.8/js/locales/zh.min.js"></script>
<script>

    $(function () {
        var initialPreview = [];
        if ('${(productInfo.productIcon)!""}' != '') {
            initialPreview = "<img class='kv-preview-data file-preview-image' src='${(productInfo.productIcon)!""}'>"
        }

        $("#input-id").fileinput({
            uploadUrl: 'localhost:8080/uploadpic',
            language: 'zh',
            browseClass: "btn btn-primary btn-block",
            showCaption: false,
            showRemove: false,
            showUpload: false,
            allowedFileExtensions: [ 'jpg', 'jpeg', 'png', 'gif' ],
            maxFileSize: 1024,
            autoReplace: true,
            overwriteInitial: true,
            maxFileCount: 1,
            initialPreview: initialPreview,
        });


        $("#sub-input-id").fileinput({
            uploadUrl: '/uploadpic',
            language: 'zh',
            browseClass: "btn btn-primary btn-block",
            showCaption: false,
            showRemove: false,
            showUpload: false,
            allowedFileExtensions: [ 'jpg', 'jpeg', 'png', 'gif' ],
            maxFileSize: 2048,
            autoReplace: true,
            overwriteInitial: true,
            maxFileCount: 10,
            initialPreview: initialPreview,
        });
    });
    //上传完成设置表单内容
    $('#input-id').on('fileuploaded', function(event, data, previewId, index) {
        if (data.response.code != 0) {
            alert(data.response.msg)
            return
        }
        $('#productIcon').val(data.response.data.fileName)
    });
    //上传完成设置表单内容
    $('#sub-input-id').on('fileuploaded', function(event, data, previewId, index) {
        if (data.response.code != 0) {
            alert(data.response.msg)
            return
        }
        $('#productIcon').val(data.response.data.fileName)
    });

</script>
</body>
</html>