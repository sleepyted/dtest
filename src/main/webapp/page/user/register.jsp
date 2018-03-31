<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp"/>
		<form>
			<div class="form-group">
				<label for="Email">邮箱地址</label>
				<input type="email" class="form-control" id="Email" placeholder="Email">
			</div>
			<div class="form-group">
				<label for="Tel">手机号码</label>
				<input type="number" class="form-control" id="Tel" placeholder="Tel" required max="13">
			</div>
			<div class="form-group">
				<label for="Username">用户名</label>
				<input type="text" class="form-control" id="Username" placeholder="Username" required maxlength="12">
			</div>
			<div class="form-group">
				<label for="Gender">性别</label>
				<input type="number" class="form-control" id="Gender" placeholder="Gender" required maxlength="1">
			</div>
			<div class="form-group">
				<label for="Pwd">密码</label>
				<input type="password" class="form-control" id="Pwd" placeholder="Password" required maxlength="12">
			</div>
			<div class="form-group">
				<label for="Pwd2">确认密码</label>
				<input type="password" class="form-control" id="Pwd2" placeholder="Password" required maxlength="12">
			</div>
			<button type="submit" id="regiserBtn" class="btn btn-default">注册</button>
			<button type="submit" class="btn btn-default">返回登录</button>
		</form>
	</div>
<script>
	$(function(){
		var registerBtn = $("#regiserBtn");
		registerBtn.on("click",function(e){
			e.preventDefault();
			var pwd1 = $("#Pwd").val();
			var pwd2 = $("#Pwd2").val();
			if(pwd1 !== pwd2) {
				alert("两次密码输入不同！请重试");
				window.location.reload();
			}else {
				var username = $("#Username").val();
				var password = $("#Pwd").val();
				var email = $("#Email").val();
				var gender = $("#Gender").val();
				var tel = $("#Tel").val();

				$.ajax({
					async:false,
					url:"/user?action=register",
					type:'post',
					data:{
							username : username,
							password: password,
							email : email,
							gender : gender,
							tel : tel
					},
					success:function(data){
						console.log(data)
						var result = JSON.parse(data)
						console.log(result)
							if (result.status == 1){
								alert(result.msg);
								window.location.href = "<%=request.getContextPath()%>/user?page=login"
							}
						alert(result.msg);
					},
					error:function(){
					}
				})

			}

		})
	})
</script>
<jsp:include page="../footer.jsp"/>