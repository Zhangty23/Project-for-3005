<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Login</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,700' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Rosario:400,700' rel='stylesheet' type='text/css'>
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<script src="js/jquery.min.js"></script>
	<script src="js/hover_pack.js"></script>
	<script type="text/javascript">
		function change(img){
			img.src=img.src+"?"+new Date().getTime();
		}
	</script>
	<style>
		/* #main{width:1000px;margin:0 auto;background-color: #F0F0F0;border-bottom:1px dotted #000;border-top:1px dotted #000;}
		h1{text-align:center;}*/
		.h_main,.content{padding:1px 0;}
		.h_main{height:420px;}
		#login{width:600px;margin:10px auto;} 
		#login table{width:500px;margin:10px auto;}
		#login tr td{padding:5px;}
		.code{width:56%;}
	</style>
  </head>
  <body>
    <!-- start header -->
	<div class="header">
		<div class="wrap1">
			<div class="soc_icons">
				<ul class="tt-wrapper">
					<li><a class="tt-gplus" href="javascript:alert('Developing!');"><span>twitter</span></a></li>
					<li><a class="tt-dribbble" href="javascript:alert('Developing!');"><span>facebook</span></a></li>
					<li><a class="tt-facebook" href="javascript:alert('Developing!');"><span>youtube</span></a></li>
					<li><a class="tt-linkedin" href="javascript:alert('Developing!');"><span>skype</span></a></li>
				</ul>
			</div>
			<div class="clear"></div>
			<div class="header_left"><!-- start header_left -->
				<div class="logo">
					<h1><a href="index.jsp">Bookstore</a></h1>
				</div>
				<div class="h_nav">
					<ul>
						<li><a href="index.jsp">home</a></li>
						<li><a href="search.jsp">search</a></li>
						<li><a href="track.jsp">track</a></li>
						<li class="nav"><a href="login.jsp">sign in</a></li>
					    <li><a href="register.jsp">sign up</a></li>
					</ul>
				</div>
			</div><!-- end header_left -->
			<div class="h_main">
				<div class="content" id="login">
					<h5>Login</h5>
			    	<form action="LoginServ" method="post">
			    		<input type="hidden" value="user" name="role"/>
				    	<table style="margin:20px;">
				    		<tr>
				    			<td>Username:</td>
				    			<td><input required="required" type="text" class="input" name="username"><font color="red"> *</font></td>
				    		</tr>
				    		<tr>
				    			<td>Password:</td>
				    			<td><input required="required" type="password" class="input" name="password"><font color="red"> *</font></td>
				    		</tr>
				    		<tr>
				    			<td>Checkcode:</td>
				    			<td>
				    				<input required="required" maxlength="4" type="text" class="input code" name="checkCode"/><font color="red"> * </font>
				    				<img src="CheckCode" style="cursor:hand;" onclick="change(this)"/>
			    				</td>
				    		</tr>
				    		<tr>
				    			<td colspan="2"><input type="submit" class="btn" value="login"/><span style="margin-left:60px;"></span><input type="reset" class="btn" value="reset"/></td>
				    		</tr>
				    		<tr align="center">
				    			<td colspan="2"><a href="register.jsp">You didn't have a count?Register Now!</a></td>
				    		</tr>
				    		<tr align="center">
				    			<td colspan="2"><a href="admin/login.jsp">I am the administrator for the bookstore!</a></td>
				    		</tr>
				    	</table>
				    </form>
			    </div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
    <!-- start footer -->
	<div class="footer_bg">
		<div class="footer">
			<div class="copy">
				<p class="link">Copyright &copy; 2020. All rights reserved.</p>
			</div>
			<div class="clear"></div>
		</div>
	</div>
    <script>
 		if("${msg}"!=""){
 			alert("${msg}");
 		}
	</script>
  </body>
</html>
