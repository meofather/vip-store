<#include "/sys/top.ftl">
<#include "/sys/left.ftl">
	<div class="page-content">
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<!--页面标题-->
					<h3 class="page-title"></h3>
					<!--面包屑导航-->
					<ul class="breadcrumb">
						<li> <i class="icon-home"></i>
							<a href="${serverPath}/index.htm">首页</a>
							<i class="icon-angle-right"></i> 
						</li>
						<li>
							<a href="#">系统管理</a>
							<i class="icon-angle-right"></i> 
						</li>
						<li>
							<a href="#">老账单处理</a>
						</li>
					</ul>
				</div>
			</div>
		<div>
		<div>
            <div class="row-fluid">
                <div class="control-group span6 ">
                    <label class="help-inline span4 text-right control-label">还款成功：账单编号</label> <input 
                        type="text" class="m-wrap span8" name="successNos" id="successNos" onblur="checkInput('^[\a-\z0-9\A-\Z,]*$',this)" maxlength="10000">
                </div>
                <div class="control-group span6 ">
                    <button onclick="changeRepayState();" class="btn blue">变更状态为已结清</button>
                </div>
            </div>		
            <div class="row-fluid">
                <div class="control-group span6 ">
                    <label class="help-inline span4 text-right control-label">还款失败：账单编号</label> <input 
                        type="text" class="m-wrap span8" name="failedNos" id='failedNos' onblur="checkInput('^[\a-\z0-9\A-\Z,]*$',this)" maxlength="10000">
                </div>
                <div class="control-group span6 ">
                    <button onclick="changeCreateUser();" class="btn blue">变更账单为可操作</button>
                </div>
            </div>            
		</div>
	</div>
	
	<script src="${cdnPath}/js/oldBill/oldBill.js?v=${VERSION_NO}"></script>
	
<#include "/sys/bottom.ftl">