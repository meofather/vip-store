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
            padding: 1px 2px 1px 2px;
            font-size: 10px;
            line-height: 14px;
            color: #ffffff;
            vertical-align: baseline;
            white-space: nowrap;
            background-color: #4ec1cc;
            -webkit-border-radius: 1px;
            -moz-border-radius: 1px;
            border-radius: 8px;
            cursor: default;
        }

        .red_price_tag {
            display: inline-block;
            padding: 1px 2px 1px 2px;
            font-size: 10px;
            line-height: 14px;
            color: #ffffff;
            vertical-align: baseline;
            white-space: nowrap;
            background-color: red;
            -webkit-border-radius: 1px;
            -moz-border-radius: 1px;
            border-radius: 8px;
            cursor: default;
        }
    </style>
</head>
<body>
<div class="page-group">
    <div id="page-searchbar" class="page page-current">
        <header class="bar bar-nav">
            <h1 class="title">欢迎来到九九网络</h1>
        </header>
        <div class="content">
            <div class="buttons-tab">
                <a href="#tab1" class="tab-link active button">首页</a>
                <a href="#tab2" class="tab-link button">订单查询</a>
                <a href="#tab3" class="tab-link button">在线客服</a>
            </div>
            <div class="tabs">
                <div id="tab1" class="tab active">
                    <#include "/web/template/item_list.ftl">
                </div>
                <div id="tab2" class="tab">
                    <div class="searchbar row">
                        <div class="search-input col-80">
                            <label class="icon icon-search" for="search"></label>
                            <input type="search" id='search' placeholder='请输入订单号'/>
                        </div>
                        <a class="button button-fill button-primary col-20" href="javascript:search();">搜索</a>
                    </div>
                    <div id="searchContent">

                    </div>
                </div>
                <div id="tab3" class="tab">
                    <div class="content-block">
                        <p>微信:lyc10026412</p>
                        <p>客服电话: 180256487852</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="application/javascript">
    var serverPath= "${serverPath}";
    function search() {
        var orderNo = $("#search").val();
        $.ajax({
            type : "GET",
            url : serverPath+'/orderInfo.htm?orderNo='+orderNo,
            dataType : 'text/html',//返回值类型 一般设置为json
            success : function(data) //服务器成功响应处理函数
            {
                $("#searchContent").html(data);
            }
        });
    }
</script>
</html>