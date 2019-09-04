<html>
<#include  "common/header.ftl">
<body>
<table>
    <thead>
    <tr>
        <th>商品ID</th>
        <th>主图</th>
        <th>副图</th>
    </tr>
    </thead>
    <tbody>
    <#list productList as product>
        <tr>
            <td>${product.id}</td>
            <td><img width="100px" height="100px" src="/uploadpic/${product.mainImage}" alt=""></td>
            <td>
                <#list product.subimage!'' as sub>
                    <img width="100px" height="100px" src="/uploadpic/${sub}" alt="">
                </#list>
            </td>
        </tr>
    </#list>
    </tbody>
</table>
</body>
</html>