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
	    
	    <title>My order</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,700' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Rosario:400,700' rel='stylesheet' type='text/css'>
		<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
		<script src="js/jquery.min.js"></script>
		<script src="js/hover_pack.js"></script>
		<style>
			.nav{background-color:transparent;}
			.movie_item{float:left;margin:20px 40px;padding:2px;text-align:center;}
			.h_main,.content{padding:0;height:auto;}
			.cbtn{padding: 5px 10px;}
			#infor h6{width:auto;text-align:center;}
			#infor .check{line-height:36px;font-size:18px;}
			#infor{min-height:200px;width:60%;margin:10px auto;text-align:left;}
			#order_list{margin:10px auto;width:80%;text-align: center;min-height:400px;}
			#order_list table{box-shadow: 0 0 11px 0px black;margin:20px auto;width:100%;}
			#order_list td{padding:4px 4px;min-width:50px;}
			#order_list th{text-align:center;}
			.name{min-width:300px;max-width:400px;}
		</style>
		<script type="text/javascript">
			var list=[];
			var item={};
			 $(document).ready(function(){
				getOrder();
			});
			function getOrder(){
				list=[];
				var uid=<%=session.getAttribute("uid") %>
				if(uid==""||uid==null){
					location.href='login.jsp';
					return;
				}
				$.ajax({
					url:"ReqServ",
					type:"POST",
					data:{
						type:"getOrder",
						uid: uid
					},
					timeout:30000,
					dataType:"json",
					scriptCharset:"utf-8",
					success:function(data){
						console.log(data);
						if(data.data.length==0)return;
						var html='';
						for(i in data.data){
							var d=data.data[i];
							html+='<table><tr>'
							+'<th>ID: '+d.order.oid+'</th>'
							+'<th>status: '+d.order.status+'</th>'
							+'<th>$'+d.order.total_price+'</th>'
							+'<th colspan=2>'+d.order.datetime+'</th>';
							html+='</tr>';
							for(j in d.Item){
								html+='<tr>'
									+'<td><a href="detail.jsp?book_id='+d.Item[j].bid+'"><img style="vertical-align:middle;" height=80px src="'+d.Item[j].cover+'"/></a></td>'
									+'<td class="name">'+d.Item[j].book_name+'</td>'
									+'<td>'+d.Item[j].author_name+'</td>'
									+'<td>'+d.Item[j].sale_price+'</td>'
									+'<td>'+d.Item[j].number+'</td>'
									+'</tr>';
							}
							html+='</table>';
						}
						$("#order_list").html(html);
					},
					error:function(XMLHttpRequest,textStatus,errorThrown){
						alert(errorThrown);
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
						<h1><a href="index.jsp">Bookstore</a></h1>
					</div>
					<div class="h_nav">
						<ul>
							<li><a href="index.jsp">home</a></li>
							<li><a href="search.jsp">search</a></li>
							<li><a href="mycart.jsp">my cart</a></li>
							<li class="nav"><a href="myorder.jsp">my order</a></li>
							<li><a href="track.jsp">track</a></li>
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
					<div class="content" id="order_list">
						<h6>You have no orders now. Please check out first!</h6>
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
				<div style="clear:left;"></div>
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