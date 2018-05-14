<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="loading">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta name="viewport"
	content="width=device-width, initial-scale=0.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
	<meta content="yes" name="apple-mobile-web-app-capable"/>
		<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
			<meta content="telephone=no" name="format-detection"/>
				<script>
					var logined = 0
				</script>
				<title>九九网络</title>
<!-- 引入 Bootstrap -->
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet"/>
<link href="<c:url value='/css/bootstrap-grid.min.css'/>" rel="stylesheet"/>
<link href="<c:url value='/css/pro_css.css'/>" rel="stylesheet"/>
<style type="text/css">
.pro_info label{
	font-size: 14px;
	font-family:serif;
	float: left;
	margin:0px 10px 0 10px;
}
.price{
	color: red;
	font-size: 20px;
}
.pro_info{
    height: 35px;
    padding: 8px 0px 5px 0px;
}
hr{
	margin:10px 0px 10px 0px;
}
.desciption{
	margin-left: 10px;
	margin-right: 10px;
}
html,body{height:100%;}
.wrap{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-orient:vertical;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column;width:100%;height:100%;}
.header,.footer{background-color: #549ced;height:40px;line-height:40px;text-align:center;}
.main{-webkit-box-flex:1;-webkit-flex:1;-ms-flex:1;flex:1;width:100%;}
</style>
</head>
<body>
<div class="wrap">
    <div class="header"><a href="javascript:gohistory(-1);" class="menu_back"></a></div>
    <div class="main">
    	<form action="<c:url value='/pays/pay.do'/>" id="formAction">
    	<input type="hidden" name="productId" value="${product.id}"  readonly="readonly"></input>
    	<input type="hidden" name="price" value="${product.sellingPrice}"  readonly="readonly"></input>
			<div style="text-align: center;">
				<h5  style="text-align: center;margin:10px 10px 10px 10px;">${product.itemName}</h5>
				<hr />
				<div class='pro_info'>
					<label>手机号：<input type="text" name="mobile" value="${mobile}" readonly="readonly"></input> </label>
				</div>
				<hr />
				<div class='pro_info'>
					<label>数量： <input type="text"  name="num" value="${num}" readonly="readonly"/></label>
				</div>
				<hr />
				<div class='pro_info'>
					<label>价格： <input type="text"  name="num" value="${product.sellingPrice}" readonly="readonly"/></label>
				</div>
				<hr />
				<div class='pro_info'>
					<label><img src="http://codepay.fateqq.com/img/alipay.jpg" alt="" /><input type="radio" name="type" checked="checked"  value="1"/> </label>
<!-- 					<label><img src="http://codepay.fateqq.com/img/weixin.jpg" alt="" /><input type="radio" name="type" value="3"/> </label> -->
<!-- 					<label><img src="http://codepay.fateqq.com/img/qqpay.jpg" alt="" /><input type="radio" name="type" value="2"/> </label> -->
				</div>
				<hr />
					<button class="btn btn-danger" style="width:40%;margin-top: 20px;">确定</button>
					
			</div>
		</form>
    </div>
    <div class="footer" style="background-color: #549ced;">@九九技术支持</div>
</div>
<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
	<script src="<c:url value='/js/jquery-1.9.1.min.js'/>"></script>
	<!-- 包括所有已编译的插件 -->
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<script type="text/javascript">
		function comfirm(){
			$("#formAction").submit();
		}
	</script>
</body>
</html>