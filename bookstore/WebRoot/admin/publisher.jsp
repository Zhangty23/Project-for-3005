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
	    
	    <title>Publishers</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,700' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Rosario:400,700' rel='stylesheet' type='text/css'>
		<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
		<script src="js/jquery.min.js"></script>
		<script src="js/hover_pack.js"></script>
		<script>
			$(document).ready(function(){
				getpublisher();
			});
			function getpublisher(){
				$.ajax({
					url:"ReqServ",
					type:"POST",
					data:{
						type:"getpublisher"
					},
					timeout:30000,
					dataType:"json",
					scriptCharset:"utf-8",
					success:function(data){
						console.log(data);
						if(data.data.length==0){
							alert('No publisher in the booksore, please add publisher first!');
							return;
						}
						 var html='<table><thead><tr><th></th><th>name</th><th>phone</th><th>address</th><th>banking_account</th></tr></thead><tbody>';
						for(i in data.data){
							html+='<tr>'
							+'<td>'+(parseInt(i)+1)+'</td>'
							+'<td class="name">'+data.data[i].name+'</td>'
							+'<td>'+data.data[i].phone+'</td>'
							+'<td>'+data.data[i].address+'</td>'
							+'<td>'+data.data[i].banking_account+'</td>'
							+'</tr>';
						}
						html+='</tbody></table>';
						$('#publisher').html(html);
					},
					error:function(XMLHttpRequest,textStatus,errorThrown){
						alert(errorThrown);
					}
				});
			}
		</script>
		<style>
			body{background:url(admin/images/bg.jpeg) repeat;}
			.nav{background-color:transparent;}
			.h_main{height:auto;}
			.h_main,.content{padding:0;}
			#publisher{margin:20px auto;width:900px;padding:10px;height:auto;min-height:200px;}
			#publisher table{width:100%;}
			#publisher td{}
			.cbtn{padding: 5px 10px;}
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
					<div style="margin:10px 10%;"><a href="admin/addpublisher.jsp" type="button" class="btn">add publisher</a></div>
					<div class="content" id="publisher">
					
					</div>
				</div>
				<div style="clear:both;"></div>
			</div>
		</div>
		<!-- start main -->
		<div class="main">
			<div class="wrap">
				<div class="content" id=""><!-- start content -->
					
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