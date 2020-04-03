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
	    
	    <title>Book detail</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,700' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Rosario:400,700' rel='stylesheet' type='text/css'>
		<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
		<script src="js/jquery.min.js"></script>
		<script src="js/hover_pack.js"></script>
		<style>
			.nav{background-color:transparent;}
			.book_item{float:left;margin:20px 20px;padding:2px;text-align:center;height:200px;}
			.book_item:hover{box-shadow: 0 0 9px 1px #84daf7;}
			.h_main,.content{padding:0;height:auto;}
			.cbtn{padding: 5px 10px;}
			#sear{width:900px;margin:20px auto;}
			#sear .att{line-height:30px;font-size:18px;margin-top:10px;}
			#sear span{font-weight:bold;font-style:italic;margin-right:10px;}
			#recommend_list{margin:0 auto;width:80%;text-align: center;min-height:200px;}
		</style>
		<script type="text/javascript">
			 $(document).ready(function(){
				getBook();
				getRecommend();
			});
			function getBook(){
				var book_id=<%= request.getParameter("book_id") %>;
				if(book_id==""||book_id==null){
					location.href='index.jsp';
					return;
				}
				$.ajax({
					url:"ReqServ",
					type:"POST",
					data:{
						type:"getBook",
						book_id: book_id
					},
					timeout:30000,
					dataType:"json",
					scriptCharset:"utf-8",
					success:function(data){
						console.log(data);
						if(data.data.length==0){
							location.href='index.jsp';
							return;
						}
						var html='';
						html+='<div style="text-align:center;float:left;"><img width=300px src="'+data.data.cover+'"/></div>'
							+'<div style="margin:10px 40px;width:450px;float:left;margin-left:100px;text-align:left;">'
							 	+'<div class="att"><span>Book name: </span>'+data.data.book_name+'</div>'
							 	+'<div class="att"><span>Author name: </span>'+data.data.author_name+'</div>'
							 	+'<div class="att"><span>Genre: </span>'+data.data.genre+'</div>'
							 	+'<div class="att"><span>ISBN: </span>'+data.data.ISBN+'</div>'
							 	+'<div class="att"><span>Number of page: </span>'+data.data.page_number+'</div>'
							 	+'<div class="att"><span>Amount of inventory: </span>'+data.data.number+'</div>'
							 	+'<div class="att"><span>Warehouse: </span>'+data.data.warehouse+'</div>'
							 	+'<div class="att"><span>Price: </span>$'+data.data.price+'</div>';
						if("admin"!="<%=session.getAttribute("role") %>"){
						 	html+='<div class="att"><button class="btn" onclick="addToCart('+data.data.id+')">Add to Cart</button></div>';
						}
						html+='</div>'; 
						html+='<div style="clear:left;"></div>';
						$('#sear').html(html);
					},
					error:function(XMLHttpRequest,textStatus,errorThrown){
						alert(errorThrown);
					}
				});
			}
			function addToCart(book_id){
				var uid=<%=session.getAttribute("uid") %>
				if(book_id==""||book_id==null){
					location.href='index.jsp';
					return;
				}
				console.log(uid);
				if(uid==""||uid==null){
					location.href='login.jsp';
					return;
				}
				$.ajax({
					url:"ReqServ",
					type:"POST",
					data:{
						type:"addToCart",
						book_id: book_id,
						uid: uid
					},
					timeout:30000,
					dataType:"json",
					scriptCharset:"utf-8",
					success:function(data){
						console.log(data);
						if(data.status=='success'){
							alert('This book has been added to the cart successfully!');
						}else{
							alert('Add failed. Please retry later!');
						}
					},
					error:function(XMLHttpRequest,textStatus,errorThrown){
						alert(errorThrown);
					}
				});
			}
		
			function getRecommend(){
				var book_id=<%= request.getParameter("book_id") %>;
				if(book_id==""||book_id==null){
					location.href='index.jsp';
					return;
				}
				$.ajax({
					url:"ReqServ",
					type:"POST",
					data:{
						type:"getRecommend",
						book_id: book_id
					},
					timeout:30000,
					dataType:"json",
					scriptCharset:"utf-8",
					success:function(data){
						console.log(data);
						if(data.data.length==0){
							$('#recommend_list').html('');
							return;
						}
						var html='<h5>recomment list</h5>';
						for(i in data.data){
							html+='<div class="book_item">'
								+'<a href="detail.jsp?book_id='+data.data[i].id+'">'
									+'<img height=120px src="'+data.data[i].cover+'"/>'
									+'<div style="margin:2px;width:120px;">'
										+'<div style="height:40px;overflow:hidden;">'+data.data[i].book_name+'</div>'
										+'<div>'+data.data[i].author_name+'</div>'
									+'</div>'
								+'</a>'
							+'</div>';
						}
						html+='<div style="clear:left;"></div>';
						$('#recommend_list').html(html);
						<%-- var html='<h5>recomment list</h5>';
						html+='<div style="text-align:center;float:left;"><img width=300px src="'+data.data.cover+'"/></div>'
							+'<div style="margin:40px;width:450px;float:left;margin-left:100px;text-align:left;">'
							 	+'<div class="att"><span>Book name: </span>'+data.data.book_name+'</div>'
							 	+'<div class="att"><span>Author name: </span>'+data.data.author_name+'</div>'
							 	+'<div class="att"><span>Genre: </span>'+data.data.genre+'</div>'
							 	+'<div class="att"><span>ISBN: </span>'+data.data.ISBN+'</div>'
							 	+'<div class="att"><span>Number of page: </span>'+data.data.page_number+'</div>'
							 	+'<div class="att"><span>Amount of inventory: </span>'+data.data.number+'</div>'
							 	+'<div class="att"><span>Warehouse: </span>'+data.data.warehouse+'</div>'
							 	+'<div class="att"><span>Price: </span>$'+data.data.price+'</div>';
						if("admin"!="<%=session.getAttribute("role") %>"){
						 	html+='<div class="att"><button class="btn" onclick="addToCart('+data.data.id+')">Add to Cart</button></div>';
						}
						html+='</div>'; 
						html+='<div style="clear:left;"></div>'; --%>
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
					<!-- not login or user login -->
					<%
						String role = (String)session.getAttribute("role"); 
						if (role==null||role.equals("")||"user".equals(role)) {
					%>
					<div class="logo">
						<h1><a href="index.jsp">Bookstore</a></h1>
					</div>
					<div class="h_nav">
						<ul>
							<li><a href="index.jsp">home</a></li>
							<li><a href="search.jsp">search</a></li>
							<li><a href="mycart.jsp">my cart</a></li>
							<li><a href="myorder.jsp">my order</a></li>
							<li><a href="track.jsp">track</a></li>
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
					<%
						}else{
					%>
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
					<%	
						}
					 %>
					
				</div><!-- end header_left -->
				<div class="h_main">
					<div class="content" id="sear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!-- start main -->
		<div class="main">
			<div class="wrap">
				<div class="content" id="recommend_list"><!-- start content -->
						
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