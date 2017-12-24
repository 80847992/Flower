<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
request.setAttribute("basePath", basePath);

String error = (String)request.getSession().getAttribute("error");
if (error != null){
	request.setAttribute("message", error);
	request.getSession().removeAttribute("error");
}
%>
<s:if test="#request.message != null">
	<script>alert("<%=request.getAttribute("message") %>");</script>
</s:if>
<div class="head">
   <div class="head_content">
  	<div class="logo"></div>
  	<div class="title">鲜花订购系统</div>
  	<div class="middle">
  		<div class="tel">订购电话：025-87367463</div>
  		<div class="qq">QQ咨询：873473374</div>
  	</div>
  	<div class="right">
  		<!-- <div class="nav"><a>返回首页</a>  |  <a>购物车</a>  |  <a>订单查询</a></div> -->
  		<div class="search">
  			<form method="GET" action="<%= basePath%>/goods/list.action" id="searchForm">
	  			<div class="input"><input type="text" name="goodsSearch.goodsName" ></div>
	  			<div class="btn"><input type="submit" value="搜索"></div>
  			</form>
  		</div>
  	</div>
  	<div class="nav">
  		<ul>
  			<li><s:a href="%{#request.basePath}/home.action">首页</s:a></li>
  			<li><s:a href="%{#request.basePath}/goods/list.action">产品</s:a></li>
  			<li><s:a href="%{#request.basePath}/goods/shopping.action">购物车</s:a></li>
  			<!-- <li style="border:none;">我的订单</li> -->
  		</ul>
 	    </div>
 	</div>
 </div>
<script>
$(function(){
	var validator = $("#searchForm").validate({
        rules: {
            "goodsSearch.goodsName":{
                required:true,
            },
        },
        messages: {
        	"goodsSearch.goodsName":{
                required:'请输入查找关键字',
            },
        },
        submitHandler: function(form) {
            form.submit();
        },
    });
});
</script>