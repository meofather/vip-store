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
</head>
<body>
<div class="page-group">
    <header class="bar bar-nav">
        <a class="icon icon-left pull-left" onclick="history.go(-1);"></a>
        <h1 class="title" style="color: #3388cc;">请支付 ${response.money!}元</h1>
    </header>
 	<div class="content" style="background-color:wheat;">
        <div style="text-align: center;margin: 10px;">
            <img class='card-cover' src="${response.qrcode!}"
                 style="margin-left: 10px;margin-right: 10px;width: 60%;">
        </div>
		<div style="text-align: center;">
            <p style="color: red;">请务必支付【${response.money!}元】,否则无法自动发货,带来的不便请谅解。</p>
            <p style="color: red;">订单编号为【${order.orderNo!}】</p>
		</div>
	</div>
    <div class="bar bar-footer" style="text-align: center;">
        <span>微信: lyc10026412  客服电话: 180256487852</span>
    </div>
</div>
</body>
<script type="text/javascript">
	var serverPath= "${serverPath}";
    $(function(){
        setInterval(getPayResult,5000);
    });
    function getPayResult(){
        $.ajax({
            type : "POST",
            url : serverPath+'/pays/getPayResult.htm',
            data : {
                pay_id : "${response.pay_id}"
            },
            dataType : 'json',//返回值类型 一般设置为json
            success : function(data, status) //服务器成功响应处理函数
            {
                if(data!=null){
                    window.location.href=serverPath+"/pays/payResult.htm?pay_id=${response.pay_id}";
                }
            }
        });
    }
</script>
</html>