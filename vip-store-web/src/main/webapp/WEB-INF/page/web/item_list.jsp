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
<link href="<c:url value='/css/style.css'/>" rel="stylesheet">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<script>
	var logined = 0
</script>
<title>九九网络</title>
</head>

<body>
	<script>
		var now_page = 1, search_value = '';
	</script>
	<div id="container">
		
		<div id="content">
			<div id="list">
				<ul>
					<c:forEach items="${page.record}" var="item">
						<li>
							<div class="wrap">
								<a class="alist" href="proInfo?id=${item.id}">
									<div class="list_litpic fl">
										<image src="${item.imageUrl}">
									</div>
									<div class="list_info">
										<h5 style=" word-wrap: break-word;word-break: normal;   width:200px;height: 30px;margin-right: 20px;">${item.itemName}</h5>
										<div class="list_info_i" style="margin-top: 30px;">
											<dl>
												<dd style="background-color:#21769e;color:white;font-size: 12px;">&nbsp;有货(${item.realStock+item.cacheStock})&nbsp;</dd>
												<div class="clear"></div>
											</dl>
											<dl>
												<dd style="background-color:#169aa9;color:white;font-size: 12px;">&nbsp;销量${item.salesVolume}&nbsp;</dd>
												<div class="clear"></div>
											</dl>
											<dl>
												<dd style="color: red;font-size: 14px;">￥${item.sellingPrice}</dd>
												<div class="clear"></div>
											</dl>
										</div>
									</div>
									<div class="clear"></div>
								</a>
							</div>
						</li>
					</c:forEach>
				</ul>
				<div class="list_loading">
					<i></i><span>努力加载中...</span>
				</div>
			</div>
		</div>

		<div class="push_msk"></div>

	</div>

	<script src="<c:url value='/js/zepto.min.js'/>"></script>
	<script src="<c:url value='/js/fx.js'/>"></script>
	<script src="<c:url value='/js/script.js'/>"></script>
	
</body>
</html>