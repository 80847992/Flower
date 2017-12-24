<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<jsp:include page="/admin/layout/media.jsp" />
</head>
<body>

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span4">
		</div>
		<div class="span4">
			<form action="" method="POST">
				<fieldset>
					 <legend>登录</legend>
					 <s:if test="#session.error != null">
					 	<span class="help-block" style="color:red"><s:property value="#session.error"/><br/></span>
					 </s:if>
					 <label>用户名：</label><input type="text" name="admin.username" required="required" />
					 <label>密码：</label><input type="password" name="admin.password" required="required" />
					 <span class="help-block" style="color:red">用户名：admin，密码：123456</span>
					 <span class="help-block" style="color:red">或者用后台添加的系统管理员账号登录</span>
					 <button type="submit" class="btn btn-large btn-block btn-primary">登录</button>
				</fieldset>
			</form>
		</div>
		<div class="span4">
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
		</div>
	</div>
</div>

</body>
</html>