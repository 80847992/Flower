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
												<th>订单编号</th>
												<th>商品名称</th>
												<th>商品单价</th>
												<th>商品数量</th>
											</tr>
										</thead>
										<tbody>
											<s:iterator value="#request.detailList" var="row">
												<tr>
													<td><s:property value="#row.ordersId" /></td>
													<td><s:property value="#row.goodsName" /></td>
													<td><s:property value="#row.price" /></td>
													<td><s:property value="#row.num" /></td>
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