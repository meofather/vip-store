<#include "/sys/top.ftl"> <#include "/sys/left.ftl">
<style>
.table-hover tbody tr.pink>td{
background-color: #f2dede
}
.table-hover tbody tr:hover.pink>td{
background: #f2dede
}
</style>
<div class="page-content">
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<!--页面标题-->
				<h3 class="page-title"></h3>
				<!--面包屑导航-->
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="${serverPath}/index.htm">首页</a> <i
						class="icon-angle-right"></i></li>
					<li><a href="#">分公司业务管理</a><i class="icon-angle-right"></i></li>
					<li><a href="#">开户管理</a></li>
				</ul>
			</div>
		</div>
		<div>
			<div class="portlet-body form">
				<form id="searchForm" action="${serverPath}/account/list.htm" class="form-horizontal" method="post">
					<@p.pageForm value=page  type="sort"/>
					<div class="row-fluid">
						<div class="control-group span4 ">
							<label class="help-inline text-right span4">申请单编号：</label>
							<div>
							 <input	type="text" class="m-wrap span8" name="applyLoanNo"
								value="${(queryDto.applyLoanNo)!''}">
							</div>
						</div>
						<div class="control-group span4 ">
							<label class="help-inline text-right span4">客户：</label>
							<div> <input
								type="text" class="m-wrap span8" name="memberName"
								value="${(queryDto.memberName)!''}">
							</div>
						</div>
						<div class="control-group span4 ">
							<label class="help-inline text-right span4">手机号：</label>
							<div>
								<input
								type="text" class="m-wrap span8" name="phone"
								value="${(queryDto.phone)!''}">
							</div>																	
						</div>
					</div>
					<div class="row-fluid">
						<div class="control-group span4 ">
							<label class="help-inline text-right span4">门店：</label> 
							<div>
                                <select data-placeholder="Your Favorite Football Team" name="storeId" class="chosen span6 chzn-done" tabindex="-1">
                                    <option value="">请选择</option>
									<#if orgs??>
									    <#list orgs as o>
                                            <option value="${o.id}" <#if queryDto.storeId?? && o.id == queryDto.storeId>selected</#if>>${o.orgName}</option>
									    </#list>
									</#if>
								</select>
							</div>
						</div>
						<div class="control-group span4 ">
							<label class="help-inline text-right span4">客服：</label> 
							<div>
								<input type="text" class="m-wrap span8" id='customerServiceName' name="customerServiceName" value=""/>
							</div>								
						</div>
					</div>

					<div class="row-fluid">
						<div class="control-group span4 ">
							<button class="btn blue" onclick="search()">查询</button>
						</div>
					</div>	
				</form>
			</div>

			<div class="tabbable tabbable-custom tabbable-custom-profile">
			
				<!-- table -->
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>序号</th>
							<@p.sort field="a.applyLoanNo" sortField="${(page.sortField)!}" sortOrder="${(page.sortOrder)!}" name="申请单号" ></@p.sort>
							<th>客户</th>
							<th>手机号</th>
							<th>业务经理</th>
							<th>大区</th>
							<@p.sort field="a.signTime" sortField="${(page.sortField)!}" sortOrder="${(page.sortOrder)!}" name="签约时间" ></@p.sort>
							<th>客服</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<#if page??&&page.result??>
							<#list page.result as item>
                            <tr class="odd gradeX" >
								<td>${item_index+1 }</td>
								<td>${item.applyLoanNo!}</td>
								<td>${item.memberName!}</td>
								<td>${item.phone!}</td>
								<td>${item.bmName!}</td>
								<td>${item.areaName!}</td>
								<td><#if item.signTime??>${item.signTime?datetime}</#if></td>
								<td>${item.customerSName!}</td>
								<td>
								    <a class="blue" href="#" onclick="openAccount('${item.contractNo!}')" data-toggle="modal"> 开户</a>
								    <#if item.subState??&&item.subState == 1801><a class="blue" href="#" onclick="withdrawManage('${item.contractNo!}')" data-toggle="modal"> 提现</a></#if>
								</td>
							</tr>
							</#list>
						</#if>
					</tbody>
				</table>
				<@p.pagination value=page />
			</div>
		</div>

</div>
<#include "/sys/bottom.ftl">
<script>
	var regionId="${(empDetail.regionId)!}";//大区id
	var storeId="${(empDetail.storeId)!}";//门店id
	
    $(function(){
            selectStoreId();
    });
    
	function search() {
		ChkUtil.form_trim($("#searchForm"));
		$("#searchForm").attr("action", "${serverPath}/account/list.htm");
		$("#searchForm").submit();
	}
	function goPage(pageNumber) {
	    ChkUtil.form_trim($("#searchForm"));
		$("#searchForm").attr("action", "${serverPath}/account/list.htm");
	    $("#pageIndex").val(pageNumber);
	    $("#searchForm").submit();
	}
	function page_jump(url){
		ChkUtil.saveCookie("queryParams", $("#searchForm").serialize(),"","/");
		window.location.href=url;
	}

	function selectStoreId() {
		var url = "${serverPath}/organization/selectOrgByOrgType.htm";
		var data = {
			"orgType" : 3,
			"Time" : new Date().getMilliseconds()
		};
		$.ajaxSettings.async = true;
		$.getJSON(url, data, function(result) {
			var resultData = result.data;
			$("#storeId").append("<option value='0'>请选择</option>");
			for (var i = 0; i < resultData.length; i++) {
				$("#storeId").append("<option value='"+resultData[i].id+"'>"+resultData[i].orgName+"</option>");
			}
		});
    }
    
    function openAccount(contractNo){
        window.location.href = serverPath + "/account/openAccountEntrance.htm?contractNo=" + contractNo;   
    }
    
    function withdrawManage(contractNo){
        window.location.href = serverPath + "/account/withdrawManage.htm?contractNo=" + contractNo
    }    
</script>
