<%@page import="com.bookstore.tool.Utility"%>
<%@include file="islogin.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
	<head>
	    <base href="<%=basePath%>">
	    
	    <title>Add publisher</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,700' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Rosario:400,700' rel='stylesheet' type='text/css'>
		<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
		<script src="js/jquery.min.js"></script>
		<script src="js/hover_pack.js"></script>
		<style>
			body{background:url(admin/images/bg.jpeg) repeat;}
			.nav{background-color:transparent;}
			.h_main{height:auto;}
			.h_main,.content{padding:0;}
			#addpublisher{margin:20px auto;width:600px;padding:10px;height:auto;}
			#addpublisher table{width:600px;}
			.cbtn{padding: 5px 10px;}
			.input{width:80%;}
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
						<h1><a href="admin/index.jsp">Bookstore</a></h1>
					</div>
					<div class="h_nav">
						<ul>
							<li><a href="admin/index.jsp">home</a></li>
							<li class="nav"><a href="admin/publisher.jsp">publisher</a></li>
							<li><a href="admin/book.jsp">book</a></li>
							<li><a href="admin/statistic.jsp">statistic</a></li>
			          		<%
			          			String username=(String)session.getAttribute("username");
								if ("".equals(username)||username==null) {
									%>
						             <li><a class="link" href="admin/login.jsp">sign in</a></li>
									<%		
								}else{
									%>
									 <li><%=username %> </li>
									 <li><a href="logout.jsp">quit</a></li>
									<%		
								}
			         	 	%>
						</ul>
					</div>
				</div><!-- end header_left -->
				<div class="h_main">
					<div class="content" id="addpublisher">
						<form action="AddPublisherServ" method="post">
							<h5>Add a publisher</h5>
							<table>
					    		<tr>
					    			<td>Name: </td>
					    			<td><input required="required" type="text" class="input" name="name"/><font color="red"> *</font></td>
					    		</tr>
					    		<tr>
					    			<td>Address: </td>
					    			<td><input required="required" type="text" class="input" name="address"><font color="red"> *</font></td>
					    		</tr>
					    		<tr>
					    			<td>Email: </td>
					    			<td><input required="required" type="email" class="input" name="email"><font color="red"> *</font></td>
					    		</tr>
					    		<tr>
					    			<td>Phone: </td>
					    			<td><input type="text" class="input" name="phone"><font color="red"> *</font></td>
					    		</tr>
					    		<tr>
					    			<td>banking-account: </td>
					    			<td><input type="text" class="input" name="banking_account"><font color="red"> *</font></td>
					    		</tr>
					    		<tr>
					    			<td colspan="2"><input type="submit" class="btn" value="Add Publisher"/><span style="margin-left:60px;"></span><input type="reset" class="btn" value="Reset"/></td>
					    		</tr>
				    		</table>
						</form>
					</div>
				</div>
				<div style="clear:both;"></div>
			</div>
		</div>
		<!-- start main -->
		<div class="main">
			<div class="wrap">
				<div class="content" id="addbook"><!-- start content -->
					
			    </div><!-- end content -->
			    <script>
			 		if("${msg}"!=""){
			 			alert("${msg}");
			 		}
				</script>
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
	</body>
</html>