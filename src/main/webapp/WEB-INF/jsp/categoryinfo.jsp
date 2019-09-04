<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>商品信息</title>
        <style>
        	*{
        		padding: 0;
        		margin: 0;
        	}
        	body{
        		background-image: linear-gradient(120deg,#487eb0,#fbc531);
        	}
        	#container{
        		width: 800px;
        		height: 600px;
        		border: 2px solid black;
        		margin-top: 100px;
        		margin-left: 380px;
        		background: black;
        		opacity: 0.7;
        		position: relative;
        	}
        	#container-top{
        		width: 100%;
        		height: 100px;
        		position: relative;
        		border-bottom: 1px solid red;
        	}
        	#username{
        		color: white;
        	}
        	#title{
        		color: white;
        		font-size: 28px;
        		position: absolute;
        		bottom: 2px;
        		left: 350px;
        	}
        	#container-middle{
        		width: 750px;
        		height: 400px;
        		position: absolute;
        		top: 120px;
        		left: 25px;
        	}
        	#table{
        		color: white;
        	}
        	.head{
        		width: 90px;
        		color: #125291;
        	}
        	.data{
        		width: 90px;
        		height: 23px;
        		font-size: 12px;
        	}
        	#delete{
        		color: white;
        		font-size: 15px;
        		margin-left: 20px;
        	}
        	#delete:hover{
        		color: red;
        	}
        	#update{
        		color: white;
        		font-size: 15px;
        		margin-left: 20px;
        	}
        	#update:hover{
        		color: #067df4;
        	}
        	#insert{
        		width: 100px;
        		height: 30px;
        		border-radius: 6px;
        		position: absolute;
        		right: 15px;
        		bottom: 20px;
        		border: 2px solid deepskyblue;
        		background: none;
        		text-align: center;
        	}
        	#insert:hover{
        		background: deepskyblue;
        	}
        	#insertA{
        		color: white;
        	}
        </style>
    </head>
    <body>
    	<div id="container">
    		<div id="container-top">
    			<span id="username">欢迎  ${user.username}</span>
    			<span id="title">种类信息</span>
    			<button id="insert"><a id="insertA" href="/user/category/insert">添加</a></button>
    		</div>
    		<div id="container-middle">
    			<table id="table" border="1px" bordercolor="red">
    				<tr>
    					<th class="head">类别编号</th>
    					<th class="head">父类编号</th>
    					<th class="head">类别名称</th>
    					<th class="head">类别状态</th>
    					<th class="head">排序编号</th>
    					<th class="head">创建时间</th>
    					<th class="head">更新时间</th>
    					<th class="head">操作</th>
    				</tr>
    				<c:forEach  items="${categoryList}" var="category">
    					<tr>
    						<td class="data">${category.id}</td>
    						<td class="data">${category.parentId}</td>
    						<td class="data">${category.name}</td>
    						<td class="data">${category.status}</td>
    						<td class="data">${category.sortOrder}</td>
    						<td class="data">${category.createTime}</td>
    						<td class="data">${category.updateTime}</td>
    						<td class="data">
    							<a href="/user/category/delete?id=${category.id}" id="delete">删</a>
    							<a href="/user/category/update?id=${category.id}" id="update">改</a>
    						</td>
    					</tr>
    				</c:forEach>
    			</table>
    		</div>
    	</div>
 	</body>
</html>