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

        .row {
            color: #3388cc;
            margin-top: 10px;
        }

        .list-block {
            margin: 10px 0px;
        }
    </style>
</head>
<body>
<div class="page-group">
    <header class="bar bar-nav">
        <a class="icon icon-left pull-left" onclick="history.go(-1);"></a>
        <h1 class="title">支付结果</h1>
    </header>
    <div class="content" style="background-color: white;">
        <div style="font-size: 25px;background-color: green;color:white;text-align: center;"><span class="icon icon-check"></span>支付成功!</div>
        <div class="list-block">
            <ul>
                <li>
                    <div class="item-content">
                        <div class="item-media"><i class="icon icon-form-name"></i></div>
                        <div class="item-inner">
                            <div class="item-title label">商品名称:</div>
                            <div class="item-input">
                            ${product.itemName!}
                            </div>
                        </div>
                    </div>
                </li>
                <!-- Text inputs -->
            <#if itemStocks??>
                <#list itemStocks as stock>
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-name"></i></div>
                            <div class="item-inner" style="color:coral;">
                                <div class="item-title label">激活码信息:</div>
                                <div class="item-input">
                                ${stock.itemInfo!}
                                </div>
                            </div>
                        </div>
                    </li>
                </#list>
            </#if>
            </ul>
        </div>
        <div class="buttons-tab">
            <a href="#tab1" class="tab-link active button">商品描述</a>
        </div>
        <div class="tabs">
            <div id="tab1" class="tab active">
            ${product.description!}
            </div>
        </div>
    </div>
</body>
</html>