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
	    
	    <title>Add books</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,700' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Rosario:400,700' rel='stylesheet' type='text/css'>
		<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
		<script src="js/jquery.min.js"></script>
		<script src="js/hover_pack.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				getPublisher();
			});
			function getPublisher(){
				$.ajax({
					url:"ReqServ",
					type:"POST",
					data:{
						type:"getPublisher",
					},
					timeout:30000,
					dataType:"json",
					scriptCharset:"utf-8",
					success:function(data){
						console.log(data);
						//var html='<option value="0">select a group</option>';
						var html='';
						for(i in data.data){
							html+='<option value="'+data.data[i].pid+'">'+data.data[i].name+'</option>';
						}
						$('#publisher').html(html);
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
			#addbook{margin:20px auto;width:600px;padding:10px;height:auto;}
			#addbook table{width:600px;}
			.cbtn{padding: 5px 10px;}
			.input{width:80%;}
			.sel{width:86%;}
			#publisher{width:79%;}
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
					<div class="content" id="addbook">
						<h5>Add a book</h5>
						<form action="AddBookServ" method="post" enctype="multipart/form-data">
							<table>
					    		<tr>
					    			<td>Book name: </td>
					    			<td><input required="required" type="text" class="input" name="book_name"/><font color="red"> *</font></td>
					    		</tr>
					    		<tr>
					    			<td>Author name: </td>
					    			<td><input required="required" type="text" class="input" name="author_name"><font color="red"> *</font></td>
					    		</tr>
					    		<tr>
					    			<td>ISBN : </td>
					    			<td><input required="required" type="text" class="input" name="ISBN"><font color="red"> *</font></td>
					    		</tr>
					    		<tr>
					    			<td>Genre : </td>
					    			<td>
					    				<select class="input sel" name="genre" id="genre">
					    					<option value="autobiography">autobiography</option>
					    					<option value="dictionary">dictionary</option>
					    					<option value="history">history</option>
					    					<option value="instruction">instruction</option>
					    					<option value="magazine">magazine</option>
					    					<option value="science">science</option>
					    					<option value="textbook">textbook</option>
					    					<option value="other">other</option>
				    					</select>
				    					<font color="red"> *</font>
			    					</td>
					    		</tr>
					    		<tr>
					    			<td>publisher: </td>
					    			<td><select class="input sel" name="pid" id="publisher"><option>select a publisher</option></select><font color="red"> *</font><a href="admin/addpublisher.jsp">add</a></td>
					    		</tr>
					    		<tr>
					    			<td>Unit-Price: </td>
					    			<td><input type="text" class="input" name="price"><font color="red"> *</font></td>
					    		</tr>
					    		<tr>
					    			<td>Cover: </td>
					    			<td>
					    				<input type="text" maxlength="100" required class="input" name="pro" id="file" onclick="upFile.click()"/>
				  						<input type="file" id="upFile" style="display:none;" name="cover" onchange="file.value=this.value"/>
										<font color="red"> *</font>
									</td>
					    		</tr>
					    		<tr>
					    			<td>Number of pages: </td>
					    			<td><input type="number" class="input" name="page_number"><font color="red"> *</font></td>
					    		</tr>
					    		<tr>
					    			<td>Amount: </td>
					    			<td><input type="number" class="input" name="number"><font color="red"> *</font></td>
					    		</tr>
					    		<tr>
					    			<td>Warehouse: </td>
					    			<td><input type="text" class="input" name="warehouse"><font color="red"> *</font></td>
					    		</tr>
					    		<tr>
					    			<td>Percentage for publisher: </td>
					    			<td><input type="text" class="input" name="percentage"><font color="red"> *</font></td>
					    		</tr>
					    		<tr>
					    			<td colspan="2"><input type="submit" class="btn" onclick="" value="Add"/><span style="margin-left:60px;"></span><input type="reset" class="btn" value="Reset"/></td>
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