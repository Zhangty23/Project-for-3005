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
	    
	    <title>Statistic</title>
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
			.cbtn{padding: 5px 10px;}
			#nav h5{font-size: 1.5em;}
			#nav{width:800px;margin:20px auto;}
			#book,#author,#genre{min-height:200px;box-shadow: 0 0 10px 1px #2babb1;padding:2px;}
			#genre,#author{float:left;width:45%;margin:2%;min-height:300px;}
			#book table,#author table,#genre table{width:100%;}
			#book{margin:20px;}
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
				getBooks("book");
				getBooks("author");
				getBooks("genre");
			});
			function getBooks(command){
				$.ajax({
					url:"ReqServ",
					type:"POST",
					data:{
						type:"statistic",
						command:command
					},
					timeout:30000,
					dataType:"json",
					scriptCharset:"utf-8",
					success:function(data){
						console.log(data);
						var html='<h5> sales per '+command+(command=='genre'?'':' (Top 5)')+'</h5>';
						html+='<table><tr><th> </th><th>'+command+'</th><th>sales number</th><th>total price</th></tr>';
						for(i in data.data){
							html+='<tr>'
								+'<td>'+(parseInt(i)+1)+'</td>'
								+'<td>'+data.data[i].type+'</td>'
								+'<td>'+data.data[i].number+'</td>'
								+'<td>$'+data.data[i].total_price+'</td>'
								+'</tr>';
						}
						html+='</table>';
						$('#'+command).html(html);
						/* var html='';
						for(i in data.data){
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
						$('#book').html(html); */
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
							<li><a href="admin/index.jsp">home</a></li>
							<li><a href="admin/publisher.jsp">publisher</a></li>
							<li><a href="admin/book.jsp">book</a></li>
							<li class="nav"><a href="admin/statistic.jsp">statistic</a></li>
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
					<div class="content" id="nav">
						<div id="genre"></div>
						<div id="author"></div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!-- start main -->
		<div class="main">
			<div class="wrap">
				<div class="content" id="book"><!-- start content -->
						
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