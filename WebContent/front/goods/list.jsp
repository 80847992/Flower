<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html>
<head>
	<title>鲜花订购</title>
	<jsp:include page="/front/layout/media.jsp" />
</head>
<body>
  <jsp:include page="/front/layout/head.jsp" />
  <div class="main_content">
  	<jsp:include page="/front/layout/left.jsp" />
  	<div class="right">
		<s:if test="#request.goodsSearch != null">
		<div class="check" style="display:;">
	    	<div class="title">符合您条件的花束有以下：</div>
	    </s:if>
	    <s:else>
	    <div class="hot">
  		    <div class="hottitle">所有产品</div>
	    </s:else>
  			<ul>
  				<s:iterator value="#request.list" var="row">
  					<li>
	  					<div class="img"><img style="max-height:190px;" src="<s:property value="#request.basePath" />/<s:property value="#row.imgUrl" />"></div>
	  					<div class="title"><s:property value="#row.goodsName" /></div>
	  					<div class="price"><span class="txt1">市场价格：</span><span class="txt2">￥<s:property value="#row.price" /></span></div>
	  					<div class="buy"><s:submit type="button" value="购买" onclick="location.href='%{#request.basePath}/goods/buy.action?goodsId=%{#row.id}'"/></div>
	  				</li>
  				</s:iterator>
  			</ul>
  		</div>

  	</div>
  </div>
  <div class="foot">
    <div class="foot_content">
    	<span>版权所有</span>
  	    <span>@2017版权归个人所有，如有抄袭，将追究法律责任</span>
    </div>
  	
  </div>

</body>
</html></head>
<body>

</body>
</html>