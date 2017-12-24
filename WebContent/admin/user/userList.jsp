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

									<table class="table table-bordered">
										<thead>
											<tr>
												<th>用户编号</th>
												<th>用户名</th>
												<th>真实姓名</th>
												<th>密保问题</th>
												<th>密保答案</th>
												<th>地址</th>
												<th>电话号码</th>
												<th>邮件地址</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<s:iterator value="#request.list" var="row">
												<tr>
													<td><s:property value="#row.id" /></td>
													<td><s:property value="#row.userName" /></td>
													<td><s:property value="#row.realName" /></td>
													<td><s:property value="#row.pwdQuestion" /></td>
													<td><s:property value="#row.pwdQuestionAnswer" /></td>
													<td><s:property value="#row.address" /></td>
													<td><s:property value="#row.phoneNO" /></td>
													<td><s:property value="#row.email" /></td>
													<td><s:a class="btn btn-danger" href="%{#request.basePath}/user/delete.action?userId=%{#row.id}" onclick="return confirm('确定删除？')">删除</s:a></td>
												</tr>
											</s:iterator>
										</tbody>
									</table>
									
								</div>
							</div>
						</div>

						<s:if test="#request.pagination!=null">
							<s:property value="#request.pagination" escape="false"/>
						</s:if>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>