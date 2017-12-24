<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
basePath += "/admin";
request.setAttribute("basePath", basePath);
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>管理后台</title>
<jsp:include page="/admin/layout/media.jsp" />
</head>
<body>

	<jsp:include page="/admin/layout/navi.jsp" />

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid">
					<div class="span2">
						<jsp:include page="/admin/layout/menu.jsp" />
					</div>
					<div class="span1"></div>
					<div class="span9">

						<div class="container-fluid">
							<div class="row-fluid">
								<div class="span12">
								
									<form class="form-horizontal" action="" method="POST" id="form">
										<fieldset>
											<div id="legend">
												<legend>管理员管理</legend>
											</div>
											<div class="control-group">
												<label class="control-label" for="input01">管理员用户名</label>
												<div class="controls">
													<input type="text" class="input-xlarge" name="admin.username" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label" for="input01">管理员密码</label>
												<div class="controls">
													<input type="password" class="input-xlarge" name="admin.password" />
												</div>
											</div>
											<div class="control-group">
												<div class="controls">
													<button class="btn btn-success" type="submit">保存</button>
												</div>
											</div>
										</fieldset>
									</form>

									<table class="table table-bordered">
										<thead>
											<tr>
												<th>管理员编号</th>
												<th>管理员用户名</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<s:iterator value="#request.list" var="row">
												<tr>
													<td><s:property value="#row.adminId" /></td>
													<td><s:property value="#row.username" /></td>
													<td><s:a class="btn btn-danger" href="%{#request.basePath}/delete.action?admin.adminId=%{#row.adminId}" onclick="return confirm('确定删除？')">删除</s:a></td>
												</tr>
											</s:iterator>
										</tbody>
									</table>
									
								</div>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script>
$(function(){
	var validator = $("#form").validate({
        rules: {
            "admin.username":{
                required:true,
                maxlength: 30
            },
            "admin.password":{
                required:true,
                maxlength: 30
            },
        },
        messages: {
        	"admin.username":{
                required:"请填写用户名",
                maxlength: "用户名不能多于30个字符"
            },
            "admin.password":{
            	required:"请填写密码",
                maxlength: "密码不能多于30个字符"
            },
        },
        submitHandler: function(form) {
            form.submit();
        },
    });
});
</script>
</html>