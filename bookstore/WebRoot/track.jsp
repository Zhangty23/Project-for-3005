<%@page import="com.bookstore.tool.Utility"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
	<head>
	    <base href="<%=basePath%>">
	    
	    <title>Track your order</title>
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
			#infor{margin:60px 40px;padding:20px;}
			.input{width:50%;}
			#search_list{margin:0 auto;width:70%;text-align: center;min-height:200px;}
		</style>
		<script type="text/javascript">
			function track(){
				$.ajax({
					url:"ReqServ",
					type:"POST",
					data:{
						type:"track",
						oid: $("#orderID").val()
					},
					timeout:30000,
					dataType:"json",
					scriptCharset:"utf-8",
					success:function(data){
						console.log(data);
						var html='';
						if(data.data.length==0){
							$('#search_list').html('');
							alert('Sorry! No result has been return, please check your order ID!');
							return;
						}
						for(i in data.data){
							html+='<div>At '+data.data[i].place+', on '+data.data[i].datetime+'</div>';
						}
						$('#infor').html(html);
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
							<li><a href="myorder.jsp">my order</a></li>
							<li class="nav"><a href="track.jsp">track</a></li>
			          		<%
			          			String username=(String)session.getAttribute("username");
								if ("".equals(username)||username==null) {
									%>
						             <li><a class="link" href="login.jsp">sign in</a></li>
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
					<div class="content">
						<input type="text" class="input" placeholder="Input the order ID" id="orderID"/>
					 	<input type="button" class="btn" value="track" onclick="track()"/><br>
					 	<div id="infor"></div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!-- start main -->
		<div class="main">
			<div class="wrap">
				<div class="content" id="search_list"><!-- start content -->
						
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