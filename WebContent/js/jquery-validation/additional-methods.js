// 远程校验，请求的校验器url返回200状态表示校验通过，反之不通过
jQuery.validator.addMethod("ajax", function(value, element, params) {
    var flag = false;
    $.ajax({
        type:"POST",
        url:params.url,
        cache:false,
        async:false,
        data:params.data ? $.extend({},params.data,{value:value}) : {value:value},
        dataType:'json',
        success: function(response){
            if (response.code == 200){
                flag = true;
            }
        }
    });
    return flag;
}, "请修正此字段");

//有效元素数量
jQuery.validator.addMethod("total", function(value, element, params) {
    if (this.optional(element)){
        return true;
    }

    var total = 0;
    $('[name="'+element.name+'"]').each(function(i){
        if (this.value){
            total++
        }
    });
    return total >= Number(params);
}, "请输入至少 {0} 个");

//必须含有中文字符
jQuery.validator.addMethod("includeChinese", function(value, element, params) {
    var regx = /[\u4E00-\u9FA5\uF900-\uFA2D]{2,}/;
    return this.optional(element) || regx.test(value);
}, "请输入有效的中文文字");

//字母和数字
jQuery.validator.addMethod("numberAndLetter", function(value, element, params) {
    var regx = /^[a-zA-Z0-9]+$/;
    return this.optional(element) || regx.test(value);
}, "请输入数字和字母组合");

//网络名称，中英文数字混合
jQuery.validator.addMethod("nickname", function(value, element, params) {
    var regx = /^[\u4E00-\u9FA5\uF900-\uFA2Da-zA-Z0-9]+$/;
    return this.optional(element) || regx.test(value);
}, "请正确填写名称");

//中文名
jQuery.validator.addMethod("chineseName", function(value, element, params) {
    var regx = /^[\u4E00-\u9FA5\uF900-\uFA2D]+$/;
    return this.optional(element) || regx.test(value);
}, "请正确填写中文名");

// 国内手机号
jQuery.validator.addMethod("mobile", function(value, element, params) {
    var regx = /^1[34578][0-9]{9}$/;
    return this.optional(element) || regx.test(value);
}, "请正确填写手机号码");

//身份证
jQuery.validator.addMethod("idcard", function(value, element, params) {
    return this.optional(element)
        || /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/.test(value)//15位身份证
        || /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X|x)$/.test(value)//18位身份证
}, "请正确填写身份证号");

//支付宝账号，手机号或邮箱
jQuery.validator.addMethod("alipayAcount", function(value, element, params) {
    return this.optional(element) || /^1[3,5,7,8]\d{9}$/.test(value) || /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/.test(value);
}, "请正确填写支付宝账号");

//手机号
jQuery.validator.addMethod("mobilePhone", function(value, element, params) {
    return this.optional(element) || /^1[3,5,7,8]\d{9}$/.test(value);
}, "请正确填写手机号码");