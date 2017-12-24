<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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


						<form class="form-horizontal" action="" method="POST" id="form" enctype="multipart/form-data">
							<fieldset>
								<div id="legend" class="">
									<legend class="">添加商品</legend>
								</div>
								<div class="control-group">

									<!-- Text input-->
									<label class="control-label" for="input01">商品名称</label>
									<div class="controls">
										<input type="text" placeholder="商品名称"
											class="input-xlarge" name="goods.goodsName">
									</div>
								</div>
								
								<div class="control-group">

									<!-- Text input-->
									<label class="control-label" for="input01">商品描述说明</label>
									<div class="controls">
										<input type="text" placeholder="商品描述说明"
											class="input-xlarge" name="goods.description">
									</div>
								</div>

								<div class="control-group">

									<!-- Text input-->
									<label class="control-label" for="input01">商品价格</label>
									<div class="controls">
										<input type="text" placeholder="商品价格"
											class="input-xlarge" name="goods.price">
									</div>
								</div>

								<div class="control-group">

									<!-- Text input-->
									<label class="control-label" for="input01">商品分类</label>
									<div class="controls">
										<s:select name="goods.categoryId" list="categoryList" listKey="id" listValue="categoryName" value="" />
									</div>
								</div>
								
								<div class="control-group">

									<!-- Text input-->
									<label class="control-label" for="input01">商品图片</label>
									<div class="controls">
										<input type="file" placeholder="商品图片"
											class="input-xlarge" name="file">
									</div>
								</div>

								<div class="control-group">

									<!-- Button -->
									<div class="controls">
										<button class="btn btn-success" type="submit">保存</button>
									</div>
								</div>

							</fieldset>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script>
$(function(){
	var validator = $("#form").validate({
        rules: {
            "goods.goodsName":{
                required:true,
                maxlength: 50
            },
            "goods.description":{
                required:true,
                maxlength: 200
            },
            "goods.price":{
                required:true,
                number:true,
                min:0,
            },
            "goods.categoryId":{
                required:true,
            },
            "file":{
                required:true,
            },
        },
        messages: {
            "goods.goodsName":{
                required:"请填写商品名称",
                maxlength: "商品名称不能多于50个字符"
            },
            "goods.description":{
                required:"请填写商品描述",
                maxlength: "商品描述不能多于200个字符"
            },
            "goods.price":{
                required:"请填写商品价格",
                number:"商品价格必须是数字",
                min:"商品价格必须大于0",
            },
            "goods.categoryId":{
                required:"请选择商品分类",
            },
            "file":{
                required:"请上传商品图片",
            },
        },
        submitHandler: function(form) {
            form.submit();
        },
    });
});
</script>
</html>