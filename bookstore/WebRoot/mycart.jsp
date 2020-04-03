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
	    
	    <title>My shopping cart</title>
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
			#cart_list{margin:10px auto;width:80%;text-align: center;min-height:400px;}
			#cart_list table{width:100%;}
			#cart_list tr:hover{box-shadow: 0 0 11px 0px black;}
			#cart_list td{padding:4px 4px;min-width:50px;}
			.name{min-width:300px;max-width:400px;}
		</style>
		<script type="text/javascript">
			var list=[];
			var item={};
			 $(document).ready(function(){
				getCart();
			});
			function getCart(){
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
						type:"getCart",
						uid: uid
					},
					timeout:30000,
					dataType:"json",
					scriptCharset:"utf-8",
					success:function(data){
						console.log(data);
						var html='<table>';
						for(i in data.data){
							html+='<tr>'
							+'<td><a href="detail.jsp?book_id='+data.data[i].bid+'"><img style="vertical-align:middle;" height=80px src="'+data.data[i].cover+'"/></a></td>'
							+'<td class="name">'+data.data[i].book_name+'</td>'
							+'<td>'+data.data[i].author_name+'</td>'
							+'<td>'+data.data[i].price+'</td>'
							+'<td>'+data.data[i].number+'</td>'
							+'<td><input type="checkbox" name="book_id" onclick="clickCheck('+data.data[i].bid+')" value="'+data.data[i].sid+'"></td>'
							+'<td><input type="button" class="btn cbtn" value="remove" onclick="deleteCartBook('+data.data[i].sid+')"></td>'
							+'</tr>';
						}
						html+='</table>';
						$("#cart_list").html(html);
						if(data.data.length>0){
							$("#infor").html('<h6>Please select the books behind which you wanna purchase first!</h6>');
						}
					},
					error:function(XMLHttpRequest,textStatus,errorThrown){
						alert(errorThrown);
					}
				});
			}
			function deleteCartBook(sid){
				$.ajax({
					url:"ReqServ",
					type:"POST",
					data:{
						type:"deleteCartBook",
						sid: sid
					},
					timeout:30000,
					dataType:"json",
					scriptCharset:"utf-8",
					success:function(data){
						console.log(data);
						if(data.status=='success'){
							getCart();
							alert('Remove successfully!');
						}else{
							alert('Remove failed!');
						}
					},
					error:function(XMLHttpRequest,textStatus,errorThrown){
						alert(errorThrown);
					}
				});
			}
			function clickCheck(bid){
				if(list.indexOf(bid)==-1){
					list.push(bid);
				}else{
					list.splice(list.indexOf(bid), 1);
				}
				//console.log(list);
				getInfor();
			}
			function getInfor(){
				var uid=<%=session.getAttribute("uid") %>
				if(uid==""||uid==null){
					location.href='login.jsp';
					return;
				}
				if(list.length==0){
					$("#infor").html('<h6>Please select the books behind which you wanna purchase first!</h6>');
					return;
				}
				$.ajax({
					url:"ReqServ",
					type:"POST",
					data:{
						type:"getInfor",
						bids: list.join("-"),
						uid: uid
					},
					timeout:30000,
					dataType:"json",
					scriptCharset:"utf-8",
					success:function(data){
						console.log(data);
						var total_price=0;
						var html='<h6>Selected books as followed.</h6>';
						html+='<div class="check">';
						for(var i in data.data){
							html+=(parseInt(i)+1)+'. '+data.data[i].book_name+'<br>';
							total_price+=(parseFloat(data.data[i].price)*parseInt(data.data[i].number));
						}
						html+='<div style="text-align:right;font-style:italic;font-weight:bold;">Total Price: $<span id="total_price">'+total_price+'</span></div>';
						html+='Recipient: <input type="text" class="input" id="name"/>';
						html+='Address: <input type="text" class="input" id="address"/>';
						html+='Telephone: <input type="text" class="input" id="phone"/>';
						html+='<div style="text-align:right;"><input type="button" class="btn" value="check out" onclick="purchase()"/></div></div>'
						$("#infor").html(html);
					},
					error:function(XMLHttpRequest,textStatus,errorThrown){
						alert(errorThrown);
					}
				});
			}
			function purchase(){
				var uid=<%=session.getAttribute("uid") %>
				if(uid==""||uid==null){
					location.href='login.jsp';
					return;
				}
				var name=$("#name").val();
				var address=$("#address").val();
				var phone=$("#phone").val();
				if(name==""||address==""||phone==""){
					alert('Please input the recipient information first.');
					return;
				}
				$.ajax({
					url:"ReqServ",
					type:"POST",
					data:{
						type:"purchase",
						bids: list.join("-"),
						uid: uid,
						total_price:$("#total_price").text(),
						name: name,
						address: address,
						phone: phone
					},
					timeout:30000,
					dataType:"json",
					scriptCharset:"utf-8",
					success:function(data){
						console.log(data);
						if(data.status=='success'){
							alert('You have order these books. You can check in your order.')
							location.href='myorder.jsp';
						}else{
							alert('Check out failed. Please retry later!');
						}
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
							<li class="nav"><a href="mycart.jsp">my cart</a></li>
							<li><a href="myorder.jsp">my order</a></li>
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
					<div class="content" id="infor">
						<h6>You have no books in your cart, please add books to the cart first!</h6>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!-- start main -->
		<div class="main">
			<div class="wrap">
				<div class="content" id="cart_list"><!-- start content -->
						
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