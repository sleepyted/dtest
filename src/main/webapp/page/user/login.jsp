<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp"/>

		<form>
			<div class="form-group">
				<label for="exampleInputEmail1">邮箱</label>
				<input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">密码</label>
				<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
			</div>
			<div class="checkbox">
				<label>
					<input type="checkbox">记住我
				</label>
			</div>
			<button  class="btn btn-default">登录</button>
			<button  class="btn btn-default">注册</button>
			<hr>
			<a href="<%=request.getContextPath()%>/user?page=admin">管理员登录</a>
		</form>

<jsp:include page="../footer.jsp"/>