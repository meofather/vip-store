<#include "/sys/top.ftl"> <#include "/sys/left.ftl">

<script src="${cdnPath}/js/account/openAccountResult.js?v=${VERSION_NO}"></script>

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
        <div class="row-fluid">
            <div class="control-group span4">
                <label class="help-inline text-right span4" style="width:120px;">可提现金额：&nbsp;</label>
                <input type="text" class="m-wrap span8" readonly value="${(availableBalance)!''}">
            </div>            
        </div>		
        <div class="row-fluid">
            <div class="control-group span4">
                <label class="help-inline text-right span4" style="width:120px;">提现至银行卡：&nbsp;</label>
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
                <label class="help-inline text-right span4" style="width:120px;">提现金额：&nbsp;</label>
                <input type="text" class="m-wrap span8" readonly value="${(contract.contractAmount)!''}">
            </div>            
        </div>
        <#if response.tradeStatus != 30>
        <div class="row-fluid">
            <div class="control-group span4">
                <label class="help-inline text-right span4" style="width:120px;">提现状态：&nbsp;</label>
                <input type="text" class="m-wrap span8" readonly value="<#if response.tradeStatus == 1>成功<#elseif response.tradeStatus= 3>处理中<#else>失败</#if>">
            </div>            
        </div>     
        </#if> 
        <#if response.tradeStatus == 2>
        <div class="row-fluid">
            <div class="control-group span4">
                <label class="help-inline text-right span4" style="width:120px;">失败原因：&nbsp;</label>
                <input type="text" class="m-wrap span8" readonly value="${(response.respMsg)!''}">
            </div>            
        </div>     
        </#if>           
        <div class="row-fluid">
            <div class="control-group span4">
                <#if (response.tradeStatus == 2 || response.tradeStatus == 30) && allowWithdraw == 1><button type="button" class="btn blue" onclick="withdraw('${(contract.contractNo)!''}')" >申请提现</button></#if>
                <span id="error" ></span>
            </div>
        </div>                        
	</div>
</div>
<#include "/sys/bottom.ftl">