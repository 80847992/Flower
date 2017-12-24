<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>鲜花订购-注册</title>
<jsp:include page="/front/layout/media.jsp" />
</head>
<body>
	<jsp:include page="/front/layout/head.jsp" />
	<div class="main_content">
		<div class="register">
			<div class="title">用户登录</div>
			<div class="register_content">
				<form action="" method="POST" id="form">
					<div class="reg_div">
						<div class="reg_div_left">
							<img src="images/bt.jpg" width="15px">用户名：
						</div>
						<div class="reg_div_middle">
							<input type="text" name="user.userName">
						</div>
					</div>
					<div class="reg_div">
						<div class="reg_div_left">
							<img src="images/bt.jpg" width="15px">密码：
						</div>
						<div class="reg_div_middle">
							<input type="password" name="user.password">
						</div>
						<div class="reg_div_right"></div>
					</div>
					<div class="reg_div">
						<div class="reg_div_left"></div>
						<div class="reg_div_middle">
							<input type="submit" value="登录" class="btn">
						</div>
						<div class="reg_div_right"></div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="foot">
		<div class="foot_content">
			<span>版权所有</span> <span>@2017版权归个人所有，如有抄袭，将追究法律责任</span>
		</div>

	</div>

</body>
<script>
$(function(){
	var validator = $("#form").validate({
        rules: {
            "user.userName":{
                required:true,
                maxlength: 30
            },
            "user.password":{
                required:true,
                maxlength: 30
            },
        },
        messages: {
        	"user.userName":{
                required:'请输入用户名',
                maxlength: '用户名不能超过30个字符'
            },
            "user.password":{
                required:'请输入密码',
                maxlength: '密码不能超过30个字符'
            },
        },
        submitHandler: function(form) {
            form.submit();
        },
    });
});
</script>
</html>