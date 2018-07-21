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
        .tag {
            display: inline-block;
            padding: 3px 4px 3px 4px;
            font-size: 10px;
            line-height: 14px;
            color: #ffffff;
            vertical-align: baseline;
            white-space: nowrap;
            background-color: #4ec1cc;
            -webkit-border-radius: 1px;
            -moz-border-radius: 1px;
            border-radius: 2px;
            cursor: default;
        }
        .row{
            color: #3388cc;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="page-group">
    <div id="page-searchbar" class="page page-current">
        <header class="bar bar-nav">
            <a class="icon icon-left pull-left" onclick="history.go(-1);"></a>
            <h1 class="title">商品详情</h1>
        </header>
        <div class="content">
            <form id="submitForm" action="comfirmInfo.htm">
            <input type="hidden" name="id" value="${product.id}"/>
            <div style="text-align: center;">
                <img class='card-cover' src="${product.imageUrl!}"
                     style="margin-left: 10px;margin-right: 10px;width: 90%;">
            </div>
            <div style="margin-left: 5px;margin-right: 10px;">
            <h4>${product.itemName!}</h4>
            </div>
            <div class="content-padded grid-demo"
                 style="background-color: white;margin: 10px 0px 0px 0px;padding: 0px 10px 0px 10px;">
                <div class="row" style="">
                    <div class="col-80">售价：<span
                            style="color: red;font-size: 18px;font-family: arial;"><b>￥${product.sellingPrice!}</b></span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-80">官网价：<span
                            style="color: red;font-size: 14px;font-family: arial;"><S><b>￥${product.officialPrice!}</b></s></span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">手机号：
                    </div>
                    <div class="col-60"><input type="text" style="width: 200px;" name = "mobile">
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">数量：
                    </div>
                    <div class="col-60"><input type="text" style="width: 50px;" value="1" name="num">份
                    </div>
                </div>
                <div class="row" style="text-align: center;">
                    <div class="col-33" style="text-align: left;"><span class="tag">自动发货</span></div>
                    <div class="col-33"><span style="color: #666666;font-size: 14px;">月销量${product.salesVolume!}笔</span>
                    </div>
                    <div class="col-33" style="text-align: right;"><span
                            style="color: #666666;font-size: 14px;">库存(${product.realStock+product.cacheStock})</span>
                    </div>
                </div>
            </div>
            <div class="buttons-tab">
                <a href="#tab1" class="tab-link active button">商品描述</a>
            </div>
            <div class="tabs">
                <div id="tab1" class="tab active">
                ${product.description!}
                </div>
            </div>
            </form>
        </div>
        <!-- 工具栏 -->
        <nav class="bar bar-tab" style="height:3rem;">
            <a href="#" onclick="comfirm()" class="button  button-fill button-big"
               style="width: 30%;float: right;margin-right: 20px;">立即购买</a>
        </nav>
    </div>
</div>
    <script type="text/javascript">
        function comfirm(){
            $("#submitForm").submit();
        }
    </script>
</body>
</html>