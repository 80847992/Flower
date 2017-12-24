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
  	<div class="detail">
      <div class="detail_left">
        <div class="detail_img">
          <img src="<s:property value="#request.basePath" />/<s:property value="#request.goods.imgUrl" />" width="200px" style="max-height: 200px;">
        </div>
        <div class="title"><s:property value="#request.goods.goodsName" /></div>
        <div class="price">价格：<span>￥<s:property value="#request.goods.price" /></span></div>
      </div>
      <div class="detail_right">
        <div class="title">详细介绍</div>
        <div class="detail_content">
          <div class="detail_pic" style=" border-radius: 8px 8px 0 0;">
            <div class="left">【编号】：</div>
            <div class="right"><s:property value="#request.goods.id" /></div> 
          </div>
          <div class="detail_pic1">
            <div class="left">【名称】：</div>
            <div class="right"><s:property value="#request.goods.goodsName" /></div> 
          </div>
          <div class="detail_pic">
            <div class="left">【品种】：</div>
            <div class="right"><s:property value="#request.goods.category.categoryName" /></div> 
          </div>
          <div class="detail_pic">
            <div class="left">【描述说明】：</div>
            <div class="right"><s:property value="#request.goods.description" /></div> 
          </div>
          <div class="detail_foot">
             <div class="buy"><s:a style="color:inherit;text-decoration:none;" href="%{#request.basePath}/goods/shopping.action?goodsId=%{#request.goods.id}">加入购物车</s:a></div>
          </div>
        </div>
      </div>
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