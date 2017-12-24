<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
basePath += "/admin";
%>
<ul class="nav nav-list">
	<li class="nav-header">商品管理</li>
	<li><a href="<%=basePath%>/goods/list.action">商品列表</a></li>
	<li><a href="<%=basePath%>/goods/categoryInput.action">添加商品分类</a></li>
	<li><a href="<%=basePath%>/goods/input.action">添加商品</a></li>
	
	<li class="nav-header">用户管理</li>
	<li><a href="<%=basePath%>/user/list.action">用户列表</a></li>	
	
	<li class="nav-header">订单管理</li>
	<li><a href="<%=basePath%>/order/list.action">订单列表</a></li>
	
	<li class="divider"></li>
	<li><a href="<%=basePath%>/adminList.action">管理员列表</a></li>
</ul>