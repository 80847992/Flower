<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<link href="<%=basePath%>/css/style.css" rel="stylesheet">
<link href="<%=basePath%>/css/jquery.page.css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>/js/jquery-2.0.0.min.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
<![endif]-->
<script type="text/javascript" src="<%=basePath%>/js/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery-validation/localization/messages_zh.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery-validation/additional-methods.js"></script>
<style>
a{color:inherit;text-decoration:none;}
</style>
<script>
	$.validator.setDefaults({
		//  debug: true,
		//  onsubmit: false,//提交时验证
		onfocusout : false,//失去焦点时验证（不包括复选框/单选按钮）
		onkeyup : false,//在 keyup 时验证
		onclick : false,//在点击复选框和单选按钮时验证
		ignore : "",//忽略某些元素不验证，默认ignore:":hidden"不验证隐藏域
		submitHandler : function(form) {
			//      alert("submitted!");
		},
		errorPlacement : function(error, element) {
			//      error.appendTo(element.parent());
		},
		showErrors : function(errorMap, errorList) {
			if (errorList.length > 0) {
				alert(errorList[0].message);
			}
			this.defaultShowErrors();
		}
	});
</script>