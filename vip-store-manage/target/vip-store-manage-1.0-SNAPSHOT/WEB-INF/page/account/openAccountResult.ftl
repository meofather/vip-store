<#include "/sys/top.ftl"> <#include "/sys/left.ftl">


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
                <label class="help-inline text-right span4" style="width:120px;">存管账号：&nbsp;</label>
                <input type="text" class="m-wrap span8" readonly value="${(contract.bankCardNo)!''}">
            </div>            
        </div>
        <div class="row-fluid">
            <div class="control-group span4">
                <label class="help-inline text-right span4" style="width:120px;">还款授权：&nbsp;</label>
                <input type="text" class="m-wrap span8" readonly value="已授权">
            </div>            
        </div>
        <div class="row-fluid">
            <div class="control-group span4">
                <label class="help-inline text-right span4" style="width:120px;">缴费授权：&nbsp;</label>
                <input type="text" class="m-wrap span8" readonly value="已授权">
            </div>            
        </div>
        <div class="row-fluid">
            <div class="control-group span4">
                <button type="button" class="btn blue" onclick="resetPassword('${(contract.fundSourceNo)!''}','${(contract.idCard)!''}')" >重置交易密码</button>
                <button type="button" class="btn blue" onclick="modifyPassword('${(contract.fundSourceNo)!''}','${(contract.idCard)!''}','${(contract.memberName)!''}')" >修改交易密码</button>
                <span id="error" ></span>
            </div>
        </div>                        
	</div>
</div>
<script src="${cdnPath}/js/account/openAccountResult.js?v=${VERSION_NO}"></script>

<#include "/sys/bottom.ftl">