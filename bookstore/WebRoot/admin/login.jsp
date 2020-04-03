<!doctype html>
<html>
<head>
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<!-- font files  -->
<link href='#css?family=Muli:400,300' rel='stylesheet' type='text/css'>
<link href='#css?family=Nunito:400,300,700' rel='stylesheet' type='text/css'>
<!-- /font files  -->
<!-- css files -->
<link href="/bookstore/admin/css/style.css" rel='stylesheet' type='text/css' media="all" />
<!-- /css files -->
</head>
<body>
<!-- particle background -->
<script type="text/javascript" color="255,255,255" opacity="1.0" count="99" src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
<h1>Login bookstore for administrator</h1>
<div class="log">
	<div class="content2"></div>
	<div class="content1">
		<h2>Sign In</h2>
		<form action="/bookstore/LoginServ" method="post">
			<input type="hidden" name="role" value="admin"/>
			<input type="text" name="username" placeholder="Username">
			<input type="password" name="password" placeholder="Password">
			<div class="button-row">
				<input type="submit" class="sign-in" value="Sign In">
				<input type="reset" class="reset" value="Reset">
				<div class="clear"></div>
			</div>
		</form>
		<a href="/bookstore/login.jsp">Back to user login</a>
	</div>
	<!-- <div class="content2">
		<h2>Sign Up Form</h2>
		<form>
			<input type="text" name="userid" value="USERNAME" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'NAME AND SURNAME';}">
			<input type="tel" name="usrtel" value="PHONE" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'PHONE';}">
			<input type="email" name="email" value="EMAIL ADDRESS" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'EMAIL ADDRESS';}">
			<input type="password" name="psw" value="PASSWORD" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'PASSWORD';}">
			<input type="submit" class="register" value="Register">
		</form>
	</div> -->
	<div class="clear"></div>
</div>
<div class="footer">
	<p>Copyright &copy; 2020. All rights reserved.</p>
</div>
    <script>
 		if("${msg}"!=""){
 			alert("${msg}");
 		}
	</script>
</body>
</html>