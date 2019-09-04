<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>修改信息</title>
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
        		display: flex;
        		align-items: center;
        		justify-content: center;
        	}
        	#updata{
        		height: 410px;
        		width: 300px;
        		position: relative;
        	}
        	#id{
        		width: 200px;
        		height: 30px;
        		border-radius: 6px;
        		position: absolute;
        		right: 15px;
        		top: 30px;
        		border: 2px solid white;
        		background: none;
        		color: white;
        		text-align: center;
        	}
        	#parentId{
        		width: 200px;
        		height: 30px;
        		border-radius: 6px;
        		position: absolute;
        		right: 15px;
        		top: 70px;
        		border: 2px solid white;
        		background: none;
        		text-align: center;
        		color: white;
        	}
        	#name{
        		width: 200px;
        		height: 30px;
        		border-radius: 6px;
        		position: absolute;
        		right: 15px;
        		top: 110px;
        		border: 2px solid white;
        		background: none;
        		text-align: center;
        		color: white;
        	}
        	#status{
        		width: 200px;
        		height: 30px;
        		border-radius: 6px;
        		position: absolute;
        		right: 15px;
        		top: 150px;
        		border: 2px solid white;
        		background: none;
        		text-align: center;
        		color: white;
        	}
        	#sortOrder{
        		width: 200px;
        		height: 30px;
        		border-radius: 6px;
        		position: absolute;
        		right: 15px;
        		top: 190px;
        		border: 2px solid white;
        		background: none;
        		text-align: center;
        		color: white;
        	}
        	#createTime{
        		width: 200px;
        		height: 30px;
        		border-radius: 6px;
        		position: absolute;
        		right: 15px;
        		top: 230px;
        		border: 2px solid white;
        		background: none;
        		text-align: center;
        		color: white;
        	}
        	#updateTime{
        		width: 200px;
        		height: 30px;
        		border-radius: 6px;
        		position: absolute;
        		right: 15px;
        		top: 270px;
        		border: 2px solid white;
        		background: none;
        		text-align: center;
        		color: white;
        	}
        	#submit{
        		width: 100px;
        		height: 30px;
        		border-radius: 6px;
        		position: absolute;
        		left: 15px;
        		top: 370px;
        		border: 2px solid #2ecc71;
        		background: none;
        		text-align: center;
        		color: white;
        	}
        	#submit:hover{
        		background: #2ecc71;
        	}
        	#back{
        		width: 100px;
        		height: 30px;
        		border-radius: 6px;
        		position: absolute;
        		right: 15px;
        		top: 370px;
        		border: 2px solid red;
        		background: none;
        		text-align: center;
        		color: white;
        	}
        	#back:hover{
        		background: red;
        	}
        	#s1{
        		position: absolute;
        		left: 15px;
        		top: 35px;
        		color: white;
        		font-size: 13px;
        	}
        	#s2{
        		position: absolute;
        		left: 15px;
        		top: 75px;
        		color: white;
        		font-size: 13px;
        	}
        	#s3{
        		position: absolute;
        		left: 15px;
        		top: 115px;
        		color: white;
        		font-size: 13px;
        	}
        	#s4{
        		position: absolute;
        		left: 15px;
        		top: 155px;
        		color: white;
        		font-size: 13px;
        	}
        	#s5{
        		position: absolute;
        		left: 15px;
        		top: 195px;
        		color: white;
        		font-size: 13px;
        	}
        	#s6{
        		position: absolute;
        		left: 15px;
        		top: 235px;
        		color: white;
        		font-size: 13px;
        	}
        	#s7{
        		position: absolute;
        		left: 15px;
        		top: 275px;
        		color: white;
        		font-size: 13px;
        	}
        	#s8{
        		position: absolute;
        		left: 15px;
        		top: 315px;
        		color: white;
        		font-size: 13px;
        	}
			#a1{
				color: white;
			}
        </style>
    </head>
    <body>
    	<div id="container">
    		<div id="container-top">
    			<span id="username">欢迎  ${user.username}</span>
    			<span id="title">修改信息</span>
    		</div>
    		<div id="container-middle">
    			<div id="updata">
    				<form action="" method="post">
    					<span id="s1">类别编号</span>
    					<input type="text" name="id" id="id" placeholder="${category.id}" />
    					<span id="s2">父类编号</span>
    					<input type="text" name="parentId" id="parentId" placeholder="${category.parentId}" />
    					<span id="s3">类别名称</span>
    					<input type="text" name="name" id="name" placeholder="${category.name}" />
    					<span id="s4">类别状态</span>
    					<input type="text" name="status" id="status" placeholder="${category.status}" />
    					<span id="s5">排序编号</span>
    					<input type="text" name="sortOrder" id="sortOrder" placeholder="${category.sortOrder}" />
    					<span id="s6">创建时间</span>
    					<input type="text" name="createTime" id="createTime" placeholder="${category.createTime}" />
    					<span id="s7">更新时间</span>
    					<input type="text" name="updateTime" id="updateTime" placeholder="${category.updateTime}" />
    					<button id="back"><a id="a1" href="/user/category/back">取消</a></button>
    					<input type="submit" id="submit" value="提交"/>
    				</form>
    			</div>
    		</div>
    	</div>
 	</body>
</html>