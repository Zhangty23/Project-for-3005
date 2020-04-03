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
	    
	    <title>Books</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,700' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Rosario:400,700' rel='stylesheet' type='text/css'>
		<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
		<script src="js/jquery.min.js"></script>
		<script src="js/hover_pack.js"></script>
		<script type="text/javascript">
			var threshold=20;
			var placeOrder=[];
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
						if(data.data.length==0){
							alert('No books in the booksore, please add books first!');
							return;
						}
						var html='<table><thead><tr><th>cover</th><th>book name</th><th>author name</th><th>genre</th><th>ISBN</th><th>price</th><th>amount</th><th>page number</th><th>remove book</th></tr></thead><tbody>';
						for(i in data.data){
							html+='<tr>'
							+'<td><a href="detail.jsp?book_id='+data.data[i].id+'"><img style="vertical-align:middle;" height=80px src="'+data.data[i].cover+'"/></a></td>'
							+'<td class="name">'+data.data[i].book_name+'</td>'
							+'<td>'+data.data[i].author_name+'</td>'
							+'<td>'+data.data[i].genre+'</td>'
							+'<td>'+data.data[i].ISBN+'</td>'
							+'<td>'+data.data[i].price+'</td>';
							if(parseInt(data.data[i].number)<threshold){
								html+='<td style="color:red;">'+data.data[i].number+'</td>';
								placeOrder.push(data.data[i].book_name+':'+data.data[i].ISBN);
							}else{
								html+='<td>'+data.data[i].number+'</td>';
							}
							html+='<td>'+data.data[i].page_number+'</td>'
							+'<td><input type="button" class="btn cbtn" value="remove" onclick="deleteBook('+data.data[i].id+')"></td>'
							+'</tr>';
						}
						html+='</tbody></table>';
						$('#book').html(html);
						if(placeOrder.length!=0){
							alert(placeOrder.join('\n')+'\nThese books will place orders for new books automatically!');							
						}
					},
					error:function(XMLHttpRequest,textStatus,errorThrown){
						alert(errorThrown);
					}
				});
			}
			function deleteBook(id){
				$.ajax({
					url:"ReqServ",
					type:"POST",
					data:{
						type:"deleteBook",
						id: id
					},
					timeout:30000,
					dataType:"json",
					scriptCharset:"utf-8",
					success:function(data){
						console.log(data);
						if(data.status=='success'){
							alert('Delete successfully!');
							getBooks();
						}else{
							alert('Delete failed!');
						}
					},
					error:function(XMLHttpRequest,textStatus,errorThrown){
						//alert(errorThrown);
					}
				});
			}
		</script>
		<style>
			body{background:url(admin/images/bg.jpeg) repeat;}
			.nav{background-color:transparent;}
			.h_main{height:auto;}
			.h_main,.content{padding:0;}
			#book{margin:20px auto;width:900px;padding:10px;height:auto;}
			#book img{width:auto;max-width:80px;}
			#book table{width:100%;}
			#book tbody tr:hover{box-shadow: 0 0 11px 0px black;}
			.cbtn{padding: 5px 10px;}
			.input{width:80%;}
			.sel{width:86%;}
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
							<li><a href="admin/publisher.jsp">publisher</a></li>
							<li class="nav"><a href="admin/book.jsp">book</a></li>
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
					<div style="margin:10px 10%;"><a href="admin/addbook.jsp" type="button" class="btn">add book</a></div>
					<div class="content" id="book">
						
					</div>
				</div>
				<div style="clear:both;"></div>
			</div>
		</div>
		<!-- start main -->
		<div class="main">
			<div class="wrap">
				<div class="content"><!-- start content -->
					
					
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