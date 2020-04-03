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
	    
	    <title>Home</title>
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
			.book_item{float:left;margin:20px 40px;padding:2px;text-align:center;}
			.book_item:hover{box-shadow: 0 0 9px 1px #84daf7;}
			.h_main,.content{padding:0;}
			#book{width:800px;margin:20px auto;}
			.cbtn{padding: 5px 10px;}
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
				getBooks();
			});
			function getBooks(){
				$.ajax({
					url:"ReqServ",
					type:"POST",
					data:{
						type:"getBooks"
					},
					timeout:30000,
					dataType:"json",
					scriptCharset:"utf-8",
					success:function(data){
						console.log(data);
						var html='';
						for(i in data.data){
							/* html+='<div class="item">'
								 +'<div style="text-align:center;float:left;"><a href="detail.jsp?book_id='+data.data[i].id+'"><img width=120px src="'+data.data[i].cover+'"/></a></div>'
								 //+'<div style="text-align:center;float:left;"><img width=80px src="image/poster.jpg"/></div>'
								 +'<div style="margin:2px;width:300px;float:left;">'
								 	+'<div class="att">'+data.data[i].book_name+'</div>'
								 	+'<div class="att">'+data.data[i].author_name+'</div>'
								 	+'<div class="att">'+data.data[i].genre+'</div>'
								 	+'<div class="att">'+data.data[i].ISBN+'</div>'
								 	+'<div class="att">Amount of inventory: '+data.data[i].number+'</div>'
								 	+'<div class="att">Warehouse: '+data.data[i].warehouse+'</div>'
								 	+'<div class="att"><button class="btn" onclick="addCart('+data.data[i].id+')">Add to Cart</button></div>'
								 +'</div>'
							+'</div>'; */
							html+='<div class="book_item">'
								+'<a href="detail.jsp?book_id='+data.data[i].id+'">'
									+'<img height=180px src="'+data.data[i].cover+'"/>'
									+'<div style="margin:2px;width:160px;">'
										+'<div style="height:40px;overflow:hidden;">'+data.data[i].book_name+'</div>'
										+'<div>'+data.data[i].author_name+'</div>'
									+'</div>'
								+'</a>'
							+'</div>';
						}
						html+='<div style="clear:left;"></div>';
						$('#book').html(html);
					},
					error:function(XMLHttpRequest,textStatus,errorThrown){
						//alert(errorThrown);
					}
				});
			}
		</script>
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
							<li class="nav"><a href="admin/index.jsp">home</a></li>
							<li><a href="admin/publisher.jsp">publisher</a></li>
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
					<div class="content" id="book">
					
					</div>
				</div>
				<div class="clear"></div>
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