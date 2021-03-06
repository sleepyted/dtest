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
	<title>驾考网 ${title}</title>
	<meta charset="UTF-8"/>
	<link rel="stylesheet" href="<%= request.getContextPath() + "/static/css/bootstrap.css"%>">
	<script src="<%= request.getContextPath() + "/static/js/jquery.js"%>"></script>
	<script src="<%= request.getContextPath() + "/static/js/bootstrap.js"%>"></script>
</head>
<body>
<nav class="navbar navbar-default col-xs-8 col-xs-offset-2">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
			        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<%=request.getContextPath()%>/home">驾考网</a>
		</div>
		<c:if test="${user!=null}">
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					   aria-expanded="false">练习<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<%=request.getContextPath()%>/practice?page=random">随机练习</a></li>
						<li><a href="<%=request.getContextPath()%>/practice?page=label">分类练习</a></li>
							<%--<li role="separator" class="divider"></li>--%>
							<%--<li><a href="#">Separated link</a></li>--%>
							<%--<li role="separator" class="divider"></li>--%>
							<%--<li><a href="#">One more separated link</a></li>--%>
					</ul>
				</li>
				<li><a href="<%=request.getContextPath()%>/test?exam=exam">模拟考试 <span
						class="sr-only">(current)</span></a></li>
					<%--<li><a href="#">Link</a></li>--%>

			</ul>
			<ul class="nav navbar-nav navbar-right">
					<%--<li><a href="#">Link</a></li>--%>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					   aria-expanded="false">我的 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<%=request.getContextPath()%>/puzzle?page=mark">标记题库</a></li>
						<li><a href="<%=request.getContextPath()%>/puzzle?page=mistake">错题库</a></li>
						<li><a href="<%=request.getContextPath()%>/user?page=account">账号</a></li>
						<li><a href="<%=request.getContextPath()%>/user?page=exit">退出系统</a></li>
					</ul>
				</li>
			</ul>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
	</c:if>
	<c:if test="${user == null && admin == null}">
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
					<%--<li><a href="#">Link</a></li>--%>
				<li>
					<a href="<%=request.getContextPath()%>/user?page=login">登录</a>
				</li>
				<li><a href="<%=request.getContextPath()%>/user?page=register">注册</a>
				</li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</c:if>
	<c:if test="${admin != null}">
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
					<%--<li><a href="#">Link</a></li>--%>
				<li><a href="<%=request.getContextPath()%>/user?page=exit">退出</a>
				</li>
			</ul>
		</div>
	</c:if>
</nav>

<div class="container col-xs-8 col-xs-offset-2" style="padding-top: 5%">