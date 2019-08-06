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
        		opacity: 0.5;
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
        	#empno{
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
        	#ename{
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
        	#job{
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
        	#mgr{
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
        	#hiredate{
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
        	#sal{
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
        	#comm{
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
        	#deptno{
        		width: 200px;
        		height: 30px;
        		border-radius: 6px;
        		position: absolute;
        		right: 15px;
        		top: 310px;
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
        		top: 33px;
        		color: white;
        		font-size: 13px;
        	}
        	#s2{
        		position: absolute;
        		left: 15px;
        		top: 73px;
        		color: white;
        		font-size: 13px;
        	}
        	#s3{
        		position: absolute;
        		left: 15px;
        		top: 113px;
        		color: white;
        		font-size: 13px;
        	}
        	#s4{
        		position: absolute;
        		left: 15px;
        		top: 153px;
        		color: white;
        		font-size: 13px;
        	}
        	#s5{
        		position: absolute;
        		left: 15px;
        		top: 193px;
        		color: white;
        		font-size: 13px;
        	}
        	#s6{
        		position: absolute;
        		left: 15px;
        		top: 233px;
        		color: white;
        		font-size: 13px;
        	}
        	#s7{
        		position: absolute;
        		left: 15px;
        		top: 273px;
        		color: white;
        		font-size: 13px;
        	}
        	#s8{
        		position: absolute;
        		left: 15px;
        		top: 313px;
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
    			<span id="username">欢迎  ${username}</span>
    			<span id="title">修改信息</span>
    		</div>
    		<div id="container-middle">
    			<div id="updata">
    				<form action="/update1">
    					<span id="s1">员工编号</span>
    					<input type="text" name="empno" id="empno" placeholder="${emp.empno}" />
    					<span id="s2">员工姓名</span>
    					<input type="text" name="ename" id="ename" placeholder="${emp.ename}" />
    					<span id="s3">职&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp位</span>
    					<input type="text" name="job" id="job" placeholder="${emp.job}" />
    					<span id="s4">领导编号</span>
    					<input type="text" name="mgr" id="mgr" placeholder="${emp.mgr}" />
    					<span id="s5">入职日期</span>
    					<input type="text" name="hiredate" id="hiredate" placeholder="${emp.hiredate}" />
    					<span id="s6">工&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp资</span>
    					<input type="text" name="sal" id="sal" placeholder="${emp.sal}" />
    					<span id="s7">奖&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp金</span>
    					<input type="text" name="comm" id="comm" placeholder="${emp.comm}" />
    					<span id="s8">部门编号</span>
    					<input type="text" name="deptno" id="deptno" placeholder="${emp.deptno}" />
    					<button id="back"><a id="a1" href="/back">取消</a></button>
    					<input type="submit" id="submit" value="提交"/>
    				</form>
    			</div>
    		</div>
    	</div>
 	</body>
</html>