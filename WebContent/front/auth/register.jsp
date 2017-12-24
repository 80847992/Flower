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
			<div class="title">用户注册</div>
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
						<div class="reg_div_left">
							<img src="images/bt.jpg" width="15px">确认密码：
						</div>
						<div class="reg_div_middle">
							<input type="password" name="user.passwordConfirm">
						</div>
					</div>
					<div class="reg_div">
						<div class="reg_div_left">
							<img src="images/bt.jpg" width="15px">真实姓名：
						</div>
						<div class="reg_div_middle">
							<input type="text" name="user.realName">
						</div>
					</div>
					<div class="reg_div">
						<div class="reg_div_left">
							<img src="images/bt.jpg" width="15px">密保问题：
						</div>
						<div class="reg_div_middle">
							<select name="user.pwdQuestion">
								<option value="你出生的街道是">你出生的街道是</option>
								<option value="你的第一个女朋友名字是">你的第一个女朋友名字是</option>
							</select>
						</div>
					</div>
					<div class="reg_div">
						<div class="reg_div_left">
							<img src="images/bt.jpg" width="15px">密保答案：
						</div>
						<div class="reg_div_middle">
							<input type="text" name="user.pwdQuestionAnswer">
						</div>
					</div>
					<div class="reg_div">
						<div class="reg_div_left">
							<img src="images/bt.jpg" width="15px">手机号码：
						</div>
						<div class="reg_div_middle">
							<input type="text" name="user.phoneNO">
						</div>
					</div>
					<div class="reg_div">
						<div class="reg_div_left">
							<img src="images/bt.jpg" width="15px">电子邮箱：
						</div>
						<div class="reg_div_middle">
							<input type="text" name="user.email">
						</div>
					</div>
					<div class="reg_div">
						<div class="reg_div_left">
							<img src="images/bt.jpg" width="15px">地址：
						</div>
						<div class="reg_div_middle">
							<input type="text" name="user.address">
						</div>
					</div>
					<div class="reg_div">
						<div class="reg_div_left"></div>
						<div class="reg_div_middle">
							<input type="submit" value="注册" class="btn">
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
            "user.passwordConfirm":{
                required:true,
                maxlength: 30,
                equalTo:"[name='user.password']"
            },
            "user.realName":{
                required:true,
                maxlength: 30
            },
            "user.pwdQuestion":{
                required:true,
            },
            "user.pwdQuestionAnswer":{
                required:true,
                maxlength: 50
            },
            "user.phoneNO":{
                required:true,
                mobilePhone:true
            },
            "user.email":{
                required:true,
                email:true
            },
            "user.address":{
                required:true,
                maxlength: 50
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
            "user.passwordConfirm":{
                required:'请确认密码',
                maxlength: '重复密码不能超过30个字符',
                equalTo:"两次输入密码不一致"
            },
            "user.realName":{
                required:'请输入真实姓名',
                maxlength: '真实姓名不能超过30个字符'
            },
            "user.pwdQuestion":{
                required:'请选择密保问题',
            },
            "user.pwdQuestionAnswer":{
                required:'请输入密保答案',
                maxlength: '密保答案不能超过50个字符'
            },
            "user.phoneNO":{
                required:'请输入手机号码',
            },
            "user.email":{
                required:'请输入电子邮箱',
                email:'请输入正确格式的电子邮箱'
            },
            "user.address":{
                required:'请输入地址',
                maxlength: '地址不能超过50个字符'
            },
        },
        submitHandler: function(form) {
            form.submit();
        },
    });
});
</script>
</html>