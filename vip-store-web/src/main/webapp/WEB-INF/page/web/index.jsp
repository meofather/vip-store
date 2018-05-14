<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>九九网络</title>
<!-- 引入 Bootstrap -->
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/css/bootstrap-grid.min.css'/>"
	rel="stylesheet">
</head>
<body>
	<table class="table table-hover">
		<thead style="background: silver;">
			<tr>
				<td>编号</td>
				<td>图片</td>
				<td>商品名称</td>
				<td>单价</td>
				<td>代理价</td>
				<td>库存</td>
				<td>销量</td>
				<td>手机号</td>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.record}" var="item">
				<tr>
					<td>${item.id}</td>
					<td><image style="width: 100px;height:100px;" src="${item.imageUrl}"></td>
					<td>${item.itemName}</td>
					<td>${item.sellingPrice}</td>
					<td>${item.sellingPrice}</td>
					<td>${item.realStock+item.cacheStock}</td>
					<td>${item.salesVolume}</td>
					<td><input name="mobile"></td>
					<td><a href="" class="btn btn-primary">购买</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
	<script src="<c:url value='/js/jquery-1.9.1.min.js'/>"></script>
	<!-- 包括所有已编译的插件 -->
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
</body>
</html>