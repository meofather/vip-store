<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <title>九九网络</title>
    <link rel="stylesheet" href="http://g.alicdn.com/msui/sm/0.6.2/css/sm.css">
    <script type='text/javascript' src='http://g.alicdn.com/sj/lib/zepto/zepto.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.6.2/js/sm.js' charset='utf-8'></script>
    <!--如果你用到了拓展包中的组件，还需要引用下面两个-->
    <link rel="stylesheet" href="http://g.alicdn.com/msui/sm/0.6.2/css/sm-extend.css">
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.6.2/js/sm-extend.js' charset='utf-8'></script>
    <style>
        .list-block {
            margin: 10px 0px;
        }
    </style>
</head>
<body>
<!-- page集合的容器，里面放多个平行的.page，其他.page作为内联页面由路由控制展示 -->
<div class="page-group">
    <!-- 单个page ,第一个.page默认被展示-->
    <div class="page">
        <!-- 标题栏 -->
        <header class="bar bar-nav">
            <a class="icon icon-left pull-left" onclick="history.go(-1);"></a>
            <h1 class="title">订单详情</h1>
        </header>
        <!-- 工具栏 -->
        <nav class="bar bar-tab" style="height:3rem;">
            <a href="#" onclick="comfirm()" class="button  button-fill button-big"
               style="width: 90%;float: right;margin-right: 20px;">立即支付</a>
        </nav>
        <!-- 这里是页面内容区 -->
        <div class="content">
            <div class="content-block" style="margin: 10px 0px;">
                <form action="${serverPath}/pays/pay.htm" id="submitForm">
                    <#include "/web/template/order_info.ftl">
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function comfirm() {
        $("#submitForm").submit();
    }
</script>
</body>
</html>