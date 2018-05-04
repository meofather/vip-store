<#include "/sys/top.ftl"> <#include "/sys/left.ftl">
<link rel="stylesheet" href="${cdnPath}/css/account/jquery.step.css?v=${VERSION_NO}" type="text/css">
<style>

    
    .main {
        width: 1000px;
        margin: 10px auto;
    }
    
    #step {
        margin-bottom: 60px;
    }
    
    .btns {
        float: left;
    }
    
    .info {
        float: left;
        height: 2px;
        line-height: 34px;
        margin-left: 2px;
        font-size: 28px;
        font-weight: bold;
        color: #928787;
    }
    
    .info span {
        color: red;
    }
</style>
<div class="page-content">
	<!-- BEGIN PAGE CONTAINER-->

	<div class="container-fluid">

		<!-- BEGIN PAGE HEADER-->

		<div class="row-fluid">

			<div class="span12">

				<ul class="breadcrumb">

					<li><i class="icon-home"></i> <a href="${serverPath}/index.htm">首页</a> <span
						class="icon-angle-right"></span></li>

					<li><a href="#">分公司业务管理</a> <span class="icon-angle-right"></span>

					</li>

					<li><a href="#">开户管理</a></li>

				</ul>

			</div>

		</div>
        <div class="main">
            <div id="step"></div>
            <div class="btns">               

            </div>
         </div>

        <div id='step1'>
        <div class="row-fluid">
            <div class="control-group span4">
                <label class="help-inline text-right span4" style="width:120px;">存管账户开户：&nbsp;</label>
                <input type="text" class="m-wrap span8" readonly value="账户资金存管至恒丰银行">
            </div>                      
        </div>
        <div class="row-fluid">
            <div class="control-group span4">
                <label class="help-inline text-right span4" style="width:120px;">身份证号：&nbsp;</label>
                <input type="text" class="m-wrap span8" readonly value="${(contract.idCard)!''}">
            </div>                      
        </div>
        <div class="row-fluid">
            <div class="control-group span4">
                <label class="help-inline text-right span4" style="width:120px;">姓名：&nbsp;</label>
                <input type="text" class="m-wrap span8" readonly value="${(contract.memberName)!''}">
            </div>                      
        </div>
        <div class="row-fluid">
            <div class="control-group span4">
                <label class="help-inline text-right span4" style="width:120px;">支持银行：&nbsp;</label>
                <input type="text" class="m-wrap span8" readonly value="${(contract.bankTypeName)!''}">
            </div>                      
        </div>
        <div class="row-fluid">
            <div class="control-group span4">
                <label class="help-inline text-right span4" style="width:120px;">银行卡号：&nbsp;</label>
                <input type="text" class="m-wrap span8" readonly value="${(contract.bankCardNo)!''}">
            </div>                      
        </div>
        <div class="row-fluid">
            <div class="control-group span4">
                <label class="help-inline text-right span4" style="width:120px;">手机号码：&nbsp;</label>
                <input type="text" class="m-wrap span8" readonly value="${(contract.reservedPhone)!''}">
            </div>                      
        </div>  
        </div>
        
        
        <div id='step2'>
        <div class="row-fluid">
            <div class="control-group span4">
                <label class="help-inline text-right span4" style="width:120px;">授权类型：&nbsp;</label>
                <input type="text" id='authorizeType' class="m-wrap span8" readonly >
            </div>                      
        </div>
        <div class="row-fluid">
            <div class="control-group span4">
                <label class="help-inline text-right span4" style="width:120px;">授权金额：&nbsp;</label>
                <input type="text" class="m-wrap span8" readonly value="${(txnAmt)!''}"><span>元</span>
            </div>                      
        </div>
        <div class="row-fluid">
            <div class="control-group span4">
                <label class="help-inline text-right span4" style="width:120px;">授权开始时间：&nbsp;</label>
                <input type="text" class="m-wrap span8" readonly value="${(beginTime)!''}">
            </div>                      
        </div>
        <div class="row-fluid">
            <div class="control-group span4">
                <label class="help-inline text-right span4" style="width:120px;">授权结束时间：&nbsp;</label>
                <input type="text" class="m-wrap span8" readonly value="${(endTime)!''}">
            </div>                      
        </div>
         
        </div>
        
        <div class="row-fluid">
            <div class="control-group span4">
                <button class="btn blue button-next" id="nextBtn">下一步</button>
                <span id = 'index'></span>
            </div>
        </div>                                                                                                             
	</div>
</div>
<#include "/sys/bottom.ftl">
<script src="${cdnPath}/js/account/jquery.step.min.js?v=${VERSION_NO}"></script>
<script type="text/javascript">
    var contract = "${contract}";
    var channelResponse = "${channelResponse}";
    var accountResponse = "${accountResponse}";
    var $step = $("#step");
    var $index = $("#index");
    
$(function() {
    init();
    chooseStep();
});

function init(){
    $step.step({
        index: 0,
        time: 500,
        title: ["开户", "还款授权", "缴费授权"]
    });
}

function nextBtn(){
    $step.nextStep();
}
function chooseStep(){
    if(${channelResponse.isneedopenaccount} == 1 && ${accountResponse.openAccStatus} != 1){
        $('#step1').show();
        $('#step2').hide();
        step1();
        $step.toStep(0);
        return;
    }
    if(${channelResponse.isneedpayauthorize} == 1 && ${accountResponse.payAuthStatus} != 1){
        $('#step1').hide();
        $('#step2').show();    
        $('#authorizeType').val('还款授权');
        step2();
        $step.toStep(1);
        return;
    }
    if(${channelResponse.isneedfeeauthorize} == 1 && ${accountResponse.feeAuthStatus} != 1){
        $('#step1').hide();
        $('#step2').show();      
        $('#authorizeType').val('缴费授权');
        step3();
        $step.toStep(2);
        return;
    }
    
}

// 开户
function step1(){
    $('#nextBtn').html('申请开户');
    $("#nextBtn").on("click", function() {
        if(${accountResponse.openAccStatus}==3){
            BootstrapDialog.alert("您的授权申请已提交成功，请耐心等待银行处理", function() {
                window.location.href = serverPath + "/account/list.htm";
            });            
        }else{   
            $.ajax({
                url : serverPath + "/account/openAccount.htm",
                type : "post",
                async : false,
                data : {
                    "contractNo" : '${contract.contractNo}',
                    "Time" : new Date().getMilliseconds()
                },
                dataType : "json",
                success : function(result) {
                    if (result.code == 0) {
                        if(result.data.returnCode != '000000'){
                            var msg = result.data.thirdMsg;
                            if(!msg){
                                msg = result.data.returnMsg;
                            }
                            BootstrapDialog.alert(msg, function() {
                                window.location.href = serverPath + "/account/list.htm";
                            });                            
                        }else{
                            BootstrapDialog.alert("请在新打开页面完成开户", function() {
                                window.open(result.data.url);
                                window.location.href = serverPath + "/account/list.htm";
                            });
                        }
                    } else {
                        BootstrapDialog.alert("操作失败");
                    }
                },
                error : function() {
                    BootstrapDialog.alert("操作失败");
                }
            }); 
        }        
    });
    if(${accountResponse.openAccStatus}==2){
        BootstrapDialog.alert("抱歉，开户失败："+'${(accountResponse.openAccErrorMsg)!''}');
    }
    if(${accountResponse.openAccStatus}==3){
        BootstrapDialog.alert("您的开户申请已提交成功，请耐心等待银行处理");
    }
}

// 还款授权
function step2(){
    if(${accountResponse.payAuthStatus}==0 && ${accountResponse.openAccStatus}==1){
        BootstrapDialog.alert("恭喜您，开户成功！");
    }
    $('#nextBtn').html('授权');
    $("#nextBtn").on("click", function() {
        if(${accountResponse.payAuthStatus}==3){
            BootstrapDialog.alert("您的授权申请已提交成功，请耐心等待银行处理", function() {
                window.location.href = serverPath + "/account/list.htm";
            });            
        }else{
             $.ajax({
                url : serverPath + "/account/authorize.htm",
                type : "post",
                async : false,
                data : {
                    "contractNo" : '${contract.contractNo}',
                    "type" : 2,
                    "Time" : new Date().getMilliseconds()
                },
                dataType : "json",
                success : function(result) {
                    if (result.code == 0) {
                        if(result.data.returnCode != '000000'){
                            var msg = result.data.thirdMsg;
                            if(!msg){
                                msg = result.data.returnMsg;
                            }                        
                            BootstrapDialog.alert(msg, function() {
                                window.location.href = serverPath + "/account/list.htm";
                            });  
                        }else{
                            BootstrapDialog.alert("请在新打开页面完成授权", function() {
                                window.open(result.data.url);
                                window.location.href = serverPath + "/account/list.htm";
                            });
                        }
                    } else {
                        BootstrapDialog.alert("操作失败");
                    }
                },
                error : function() {
                    BootstrapDialog.alert("操作失败");
                }
            });        
        }
        
    });
    if(${accountResponse.payAuthStatus}==2){
        BootstrapDialog.alert("抱歉，授权失败:"+'${(accountResponse.payAuthErrorMsg)!''}');
    }
    if(${accountResponse.payAuthStatus}==3){
        BootstrapDialog.alert("您的授权申请已提交成功，请耐心等待银行处理");
    }    
}

// 缴费授权
function step3(){
    if(${accountResponse.feeAuthStatus}==0 && ${accountResponse.payAuthStatus}==1){
        BootstrapDialog.alert("恭喜您，还款授权成功！");
    }
    $('#nextBtn').html('授权');
    $("#nextBtn").on("click", function() {
        if(${accountResponse.feeAuthStatus}==3){
            BootstrapDialog.alert("您的授权申请已提交成功，请耐心等待银行处理", function() {
                window.location.href = serverPath + "/account/list.htm";
            });            
        }else{    
            $.ajax({
                url : serverPath + "/account/authorize.htm",
                type : "post",
                async : false,
                data : {
                    "contractNo" : '${contract.contractNo}',
                    "type" : 3,
                    "Time" : new Date().getMilliseconds()
                },
                dataType : "json",
                success : function(result) {
                    if (result.code == 0) {
                        if(result.data.returnCode != '000000'){
                            var msg = result.data.thirdMsg;
                            if(!msg){
                                msg = result.data.returnMsg;
                            }                         
                            BootstrapDialog.alert(msg, function() {
                                window.location.href = serverPath + "/account/list.htm";
                            });  
                        }else{
                            BootstrapDialog.alert("请在新打开页面完成授权", function() {
                                window.open(result.data.url);
                                window.location.href = serverPath + "/account/list.htm";
                            });
                        }
                    } else {
                        BootstrapDialog.alert("操作失败");
                    }
                },
                error : function() {
                    BootstrapDialog.alert("操作失败");
                }
            });  
        }       
    });
    if(${accountResponse.feeAuthStatus}==2){
        BootstrapDialog.alert("抱歉，授权失败:"+'${(accountResponse.feeAuthErrorMsg)!''}');
    }
    if(${accountResponse.feeAuthStatus}==3){
        BootstrapDialog.alert("您的授权申请已提交成功，请耐心等待银行处理");
    }        
}    

</script>