<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
request.setAttribute("basePath", basePath);
%>
<s:head theme="xhtml"/>
<sd:head parseContent="true"/>
<!DOCTYPE html>
<html>
<head>
	<title>鲜花订购</title>
	<jsp:include page="/front/layout/media.jsp" />
</head>
<body>
  <jsp:include page="/front/layout/head.jsp" />
  <div class="main_content">
  	<div class="shopping">
      <div class="title">
        我的购物车        
      </div>
      <div class="liucheng">
        <div class="lc1">1.我的购物车</div>
        <!-- <div class="lc2">2.确认订单</div>
        <div class="lc2">3.订单完成</div> -->
      </div>
      <div class="content">
        <ul class="bt">
          <li class="l1"><input type="checkbox" name="">全选</li>
          <li class="l2">商品</li>
          <li class="l3">价格</li>
          <li class="l5">数量</li>
          <li class="l6">操作</li>
        </ul>
        <s:iterator value="#request.list" var="row">
        	<ul class="nr">
	          <li class="n1"><input type="checkbox" name=""></li>
	          <li class="n2"> 
	            <div class="left"><img src="<s:property value="#request.basePath" />/<s:property value="#row.imgUrl" />" width="78px"></div>
	            <div class="right"><s:property value="#row.goodsName" /></div>
	          </li>
	          <li class="n3">￥<s:property value="#row.price" /></li>
	          <li class="n5">
	            <!-- <input type="button" value="-" > -->
	            <s:property value="#row.num" />
	            <!-- <input type="button" value="+" > -->
	          </li>
	          <li class="n6"><s:a href="%{#request.basePath}/goods/removeFromShopping.action?goodsId=%{#row.id}" onclick="return confirm('从购物车中删除？')">删除</s:a></li>
	        </ul>
        </s:iterator>
        <div class="jiesuan">
          <div class="left">总计：</div>
          <div class="right">￥<s:property value="#request.cartSum" /></div>
        </div>
      </div>
      <div class="btn">
        <!-- <div class="goshopping"><input type="button" value="继续购物"></div> -->
        <div class="gojiesuan"><input type="button" value="下订单" onclick="if(confirm('确定下单？'))location.href='<s:property value="#request.basePath" />/order/doOrder.action'"></div>
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