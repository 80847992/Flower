<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
request.setAttribute("basePath", basePath);
%>
<div class="left">
	<s:if test="#session.user != null">
		<div class="login">
			<div class="title">用户已登录</div>
			<div class="login_content">
				<div class="login_dy user">
					<span>欢迎您，</span><s:property value="#session.user.userName" />
				</div>
				<div class="login_dy1">
					<s:submit type="button" value="登出" onclick="location.href='%{#request.basePath}/logout.action'" />
				</div>
			</div>
		</div>
	</s:if>
	<s:else>
		<div class="login">
			<div class="title">用户未登录</div>
			<div class="login_content">
				<div class="login_dy1">
					<s:submit type="button" value="登录" onclick="location.href='%{#request.basePath}/login.action'" />
				</div>
				<div class="login_dy1">
					<s:submit type="button" value="用户注册" onclick="location.href='%{#request.basePath}/register.action'" />
				</div>
			</div>
		</div>
	</s:else>
	
	<div class="fenlei">
		<div class="title">花朵分类</div>
		<ul>
		<s:iterator value="#request.categoryList" var="row">
		<li><s:a href="%{#request.basePath}/goods/list.action?goodsSearch.categoryId=%{#row.id}"><s:property value="#row.categoryName"/></s:a></li>
		</s:iterator>
		</ul>
	</div>
</div>