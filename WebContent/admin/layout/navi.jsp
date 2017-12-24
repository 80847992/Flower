<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
String username = (String) request.getSession().getAttribute("adminName");
%>
<s:if test="#request.message != null">
	<script>alert("<%=request.getAttribute("message") %>");</script>
</s:if>
<div id="navbarInversePreview" class="navbar navbar-inverse">
	<div class="navbar-inner">
		<div class="container">
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".navbar-responsive-collapse"> <span
				class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
			</a> <a class="brand" href="#">鲜花订购系统 </a>
			<div class="nav-collapse collapse navbar-responsive-collapse">
				<ul class="nav">
					<li class="active" style="background-color: rgba(0, 0, 0, 0);"><a
						href="<%=basePath%>/admin/">Home</a></li>
					<!-- <li style="background-color: rgba(0, 0, 0, 0);"><a href="#">Link</a></li>
					<li class="navbar-text" style="padding: 0 15px 0;">Normal Text</li>
					<li class="dropdown" style="background-color: rgba(0, 0, 0, 0);">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown
							<b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li class="nav-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul>
					</li> -->
				</ul>
				<!-- <div class="navbar-search pull-left">
					<input type="text" class="search-query span2" placeholder="Search">
				</div> -->
				<ul class="nav pull-right">
					<li style="background-color: rgba(0, 0, 0, 0);"><a><%=username %></a></li>
					<li class="divider-vertical"></li>
					<li class="dropdown" style="background-color: rgba(0, 0, 0, 0);">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">操作
							<b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="<%=basePath%>/admin/logout.action">注销</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<!-- /.nav-collapse -->
		</div>
	</div>
	<!-- /navbar-inner -->
</div>