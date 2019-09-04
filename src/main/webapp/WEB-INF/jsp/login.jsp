<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>管理员登录</title>
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
        	#login{
        		height: 230px;
        		width: 250px;
        		border: 1px solid red;
        		position: relative;
        	}
        	#username{
        		width: 200px;
        		height: 30px;
        		border-radius: 16px;
        		position: absolute;
        		left: 25px;
        		top: 30px;
        		border: 2px solid #3498db;
        		background: none;
        		color: white;
        		text-align: center;
        	}
        	#password{
        		width: 200px;
        		height: 30px;
        		border-radius: 16px;
        		position: absolute;
        		left: 25px;
        		top: 80px;
        		border: 2px solid #3498db;
        		background: none;
        		text-align: center;
        		color: white;
        	}
        	#submit{
        		width: 200px;
        		height: 30px;
        		border-radius: 16px;
        		position: absolute;
        		left: 25px;
        		top: 130px;
        		border: 2px solid #2ecc71;
        		background: none;
        		color: white;
        	}
        	#submit:hover{
        		background: #2ecc71;
        	}
        </style>
    </head>
    <body>
    	<div id="container">
    		<div id="container-top">
    			<span id="title">LOGIN</span>
    		</div>
    		<div id="container-middle">
    			<div id="login">
    				<form action="" method="post">
    					<input type="text" name="username" id="username" placeholder="Username" />
    					<input type="password" name="password" id="password" placeholder="Password" /><br />
    					<input type="submit" id="submit" value="Login" />
    				</form>
    			</div>
    		</div>
    	</div>
 	</body>
</html>