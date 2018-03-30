<%--
  Created by IntelliJ IDEA.
  Date: 2018/3/25
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>注册</title>
	<link rel="stylesheet" href="<%= request.getContextPath() + "/static/css/bootstrap.css"%>">
	<script src="<%= request.getContextPath() + "/static/js/jquery.js"%>"></script>
	<script src="<%= request.getContextPath() + "/static/js/bootstrap.js"%>"></script>
</head>
<body>
<nav class="navbar navbar-default col-md-8 col-md-offset-2">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">驾考网</a>
		</div>
	</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->

</nav>
	<div class="container col-md-6 col-md-offset-3" style="height: 100%;">
		<br>
		<br>
		<br>
		<br>
		<form>
			<div class="form-group">
				<label for="exampleInputEmail1">Email address</label>
				<input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Password</label>
				<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Password Confirm</label>
				<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
			</div>
			<button type="submit" class="btn btn-default">注册</button>
			<button type="submit" class="btn btn-default">返回登录</button>
		</form>
	</div>


<script>
	console.log($)
</script>
</body>
</html>
