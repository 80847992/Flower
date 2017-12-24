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

						<form class="form-horizontal" action="" method="POST" id="form">
							<fieldset>
								<div id="legend" class="">
									<legend class="">添加商品分类</legend>
								</div>
								<div class="control-group">

									<!-- Text input-->
									<label class="control-label" for="input01">分类名称</label>
									<div class="controls">
										<input type="text" placeholder="商品名称"
											class="input-xlarge" name="category.categoryName">
									</div>
								</div>

								<div class="control-group">

									<!-- Button -->
									<div class="controls">
										<button class="btn btn-success" type="submit">保存</button>
									</div>
								</div>

							</fieldset>
						</form>

						<div class="container-fluid">
							<div class="row-fluid">
								<div class="span12">

									<table class="table table-bordered">
										<thead>
											<tr>
												<th>分类编号</th>
												<th>分类名称</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<s:iterator value="#request.categoryList" var="row">
												<tr>
													<td><s:property value="#row.id" /></td>
													<td><s:property value="#row.categoryName" /></td>
													<td>
													<s:a class="btn btn-danger" href="%{#request.basePath}/goods/categoryDelete.action?categoryId=%{#row.id}" onclick="return confirm('确定删除？')">删除</s:a>
													</td>
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
            "category.categoryName":{
                required:true,
                maxlength: 30
            },
        },
        messages: {
            "category.categoryName":{
                required:"请填写分类名称",
                maxlength: "分类名称不能多于30个字符"
            },
        },
        submitHandler: function(form) {
            form.submit();
        },
    });
});
</script>
</html>