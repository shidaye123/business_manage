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
        		width: 80px;
        		color: #125291;
        	}
        	.data{
        		width: 80px;
        		height: 23px;
        		font-size: 12px;
        	}
        	#delete{
        		color: white;
        		font-size: 15px;
        		margin-left: 15px;
        	}
        	#delete:hover{
        		color: red;
        	}
        	#update{
        		color: white;
        		font-size: 15px;
        		margin-left: 15px;
        	}
        	#update:hover{
        		color: #067df4;
        	}
        </style>
    </head>
    <body>
    	<div id="container">
    		<div id="container-top">
    			<span id="username">欢迎  ${username}</span>
    			<span id="title">员工信息</span>
    		</div>
    		<div id="container-middle">
    			<table id="table" border="1px" bordercolor="red">
    				<tr>
    					<th class="head">员工编号</th>
    					<th class="head">员工姓名</th>
    					<th class="head">职位</th>
    					<th class="head">领导编号</th>
    					<th class="head">入职日期</th>
    					<th class="head">工资</th>
    					<th class="head">奖金</th>
    					<th class="head">部门编号</th>
    					<th class="head">操作</th>
    				</tr>
    				<c:forEach  items="${empList}" var="emp">
    					<tr>
    						<td class="data">${emp.empno}</td>
    						<td class="data">${emp.ename}</td>
    						<td class="data">${emp.job}</td>
    						<td class="data">${emp.mgr}</td>
    						<td class="data">${emp.hiredate}</td>
    						<td class="data">${emp.sal}</td>
    						<td class="data">${emp.comm}</td>
    						<td class="data">${emp.deptno}</td>
    						<td class="data">
    							<a href="/delete?empno=${emp.empno}" id="delete">删</a>
    							<a href="/update?empno=${emp.empno}" id="update">改</a>
    						</td>
    					</tr>
    				</c:forEach>
    			</table>
    		</div>
    	</div>
 	</body>
</html>