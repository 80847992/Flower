<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
String adminPath = basePath+"/admin";
request.setAttribute("basePath", basePath);
request.setAttribute("adminPath", adminPath);
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

									<table class="table table-bordered">
										<thead>
											<tr>
												<th>商品编号</th>
												<th>商品名称</th>
												<th>商品描述说明</th>
												<th>商品单价</th>
												<th>商品分类</th>
												<th>商品图片</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<s:iterator value="#request.goodList" var="row">
												<tr>
													<td><s:property value="#row.id" /></td>
													<td><s:property value="#row.goodsName" /></td>
													<td><s:property value="#row.description" /></td>
													<td><s:property value="#row.price" /></td>
													<td><s:property value="#row.category.categoryName" /></td>
													<td><img src="<%=basePath%>/<s:property value="#row.imgUrl"/>" width="50"/></td>
													<td>
													<s:a class="btn btn-primary" href="%{#request.adminPath}/goods/edit.action?goodsId=%{#row.id}">编辑</s:a>
													<s:a class="btn btn-danger" href="%{#request.adminPath}/goods/delete.action?goodsId=%{#row.id}" onclick="return confirm('确定删除？')">删除</s:a>
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
</html>