<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
        <!-- 是否启用 WebAPP 全屏模式 -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <!-- 屏蔽数字自动识别为电话号码 -->
        <meta name="format-detection" content="telephone=no">
        <meta content="width=device-width,initial-scale=1,shrink-to-fit=no,user-scalable=no" name="viewport" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta content="telephone=no" name="format-detection" />
        <meta name="full-screen" content="yes" />
        <meta name="browsermode" content="application" />
        <meta name="x5-orientation" content="portrait" />
        <meta name="x5-fullscreen" content="true" />
        <meta name="x5-page-mode" content="app" />
        <title>还款事项提醒函</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                font-style: normal;
                font-weight: normal;
            }
            
            table {
                border-collapse: collapse;
                border-spacing: 0;
                font-size: inherit;
                font: 100%;
            }
            
            body {
                font-size: 16px;
                line-height: 2;
                font-family: "微软雅黑";
            }
            
            .main {
                max-width: 980px;
                margin: 0 auto;
            }
            
            .h2 {
                padding: 20px 0;
                font-size: 20px;
                font-weight: bold;
            }
            
            .h3 {
                font-size: 18px;
                font-weight: bold;
            }
            
            .center {
                text-align: center;
            }
            
            .table {
                border: 1px solid #000;
            }
            
            .table td {
                padding: 2px 5px;
                border: 1px solid #000;
            }
            
            .table div {
                padding: 10px 5px;
            }
            
            .h1 {
                padding: 30px 0;
            }
            
            .p10 {
                padding: 0 10px;
            }
            
            .y {
                display: inline-block;
                min-width: 60px;
            }
            
            .d {
                display: inline-block;
                min-width: 30px;
            }
            
            .c {
                display: inline-block;
                min-width: 143px;
                border-bottom: 1px solid #000;
            }
            .tex{ padding-bottom: 10px;}
        </style>
    </head>

    <body>
        <div class="main">

            <h1 class="h1 center">还款事项提醒函</h1>

            <div class="tex"><span style="display: inline-block; min-width: 100px; border-bottom: 1px solid #000;">${(contractModelView.borrower)!''}</span> 先生/女士您好：</div>
            
            <div class="tex">为了您更加方便、快捷的进行还款，同时积累良好的信用记录，在此，请您特别注意如下事项：</div>

            <div class="tex">1．还款账户：在《授权委托书》里列示的专用账号，请您妥善保管好您该银行卡。如发生此银行卡丢失、损坏的情况，请您第一时间联系我们，我们根据具体情况，协助您安排按时还款事宜，以避免不必要的逾期违约金和罚息的产生。如您需要变更还款账户，请向我们提出申请（还款日当天不受理），我们相关的工作人员将协助您，进行变更《授权委托书》中专用账号的事项办理。</div>
            <div class="tex">2．还款账户最低余额为15元：为了保证您的还款成功划扣，请确保您的还款账户余额在划扣当月还款以后，还有至少15元的余额存在您的还款账户，此余额有可能用于支付还款银行的年费。关于此“年费”和其他费用收费标准，请致电您的还款银行咨询。同时为了保证扣款日能够成功划扣，请您保持专用账号中有充足的资金，避免因其他未知或遗忘的代扣等业务造成违约。</div>
            <div class="tex">3．还款金额：您的每月还款额为：人民币（大写）<span style="display: inline-block; min-width: 100px; border-bottom: 1px solid #000;">${(contractModelView.principalCN)!''}</span> （小写 <span style="display: inline-block; min-width: 100px; border-bottom: 1px solid #000;">${repayAmount!''}</span> ） ，请您务必牢记此数字。
            </div>
            <div class="tex">4.还款时间：请您在每月还款日的18点之前，将每月应还款金额足额存在您的借记卡里，逾期产生不必要的罚息和逾期违约金会影响你的个人信用记录。请您务必牢记此还款日，此还款日期不因节假日顺延，如您的还款日为每月30日，那么2还款日为2月末最后一天。若您采用跨行转账方式汇入还款账户，请提前一周进行划转。</div>

            <div class="tex"> 我们将以成功扣划还款账户的还款金额时间为准，记录还款时间。</div>
            <div class="tex">5.如果您因特殊原因暂时无法按时足额还款时，请在第一时间（当月还款日期之前）与我们联系。电话：<span style="display: inline-block; min-width: 100px; border-bottom: 1px solid #000;"></span> 。我们将协助您安排预约还款并准确告知您还款金额（本息、逾期违约金、罚息、协议约定的相关费用等）。特别需要您值得注意的是：针对违约时长超过10天，出借人有权提前终止借款合同，您须在出借人提出终止借款合同要求的三日内一次性支付余下的所有本金、利息、和逾期违约金。</div>
            <div class="tex">6.联系方式变更：为了方便我们更好的服务于您，如果您需要变更还款账号，或者您（或是您共同借款人）的联系方式、工作单位、居住或者工作地址等与借款有关的信息发生变化，请在第一时间拨打： <span style="display: inline-block; min-width: 100px; border-bottom: 1px solid #000;"></span> 。联系我们。注：在还款日当日不予变更还款账号。</div>
            <div class="tex">7.提前结清：为了方便我们更好地服务于您，如果您决定一次性将全部款项结清，请您务必提前七个工作日与我们进行书面确认，我们将帮助您安排预约提前结清的相关事宜。提前结清电话： 。</div>
            <div class="tex">8.如您无法通过电话联系我们，您还可以通过电子邮件方式将您的姓名、联系方式、需办理事项发送至 <span style="display: inline-block; min-width: 100px; border-bottom: 1px solid #000;"></span> ，我们的客服人员将在8个工作小时内跟您联系。</div>
        </div>
    </body>

</html>