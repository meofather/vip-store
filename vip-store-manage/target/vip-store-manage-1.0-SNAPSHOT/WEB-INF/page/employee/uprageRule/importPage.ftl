<#include "/sys/top.ftl"> <#include "/sys/left.ftl">
<div class="page-content">
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<!--页面标题-->
				<h3 class="page-title"></h3>
				<!--面包屑导航-->
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="${ctx}/index.htm">首页</a> <i
						class="icon-angle-right"></i></li>
					<li><a href="#">信审业务管理</a><i class="icon-angle-right"></i></li>
					<li><a href="${serverPath}/employeeAmountUprageRule/pageList.htm">信审提额标准</a><i class="icon-angle-right"></i></li>
					<li><a href="#">导入</a></li>
				</ul>
			</div>
		</div>
		<div>
			<div class="portlet-body form">
				<form action="${serverPath}/employeeAmountUprageRule/import.htm" id="searchForm" class="form-horizontal"
					method="post" enctype="multipart/form-data">
					<div class="row-fluid">
						<div class="control-group span2 ">
							<input type="file" name="upFile">
						</div>
						<div class="control-group span2 ">
                            <button type="submit" class="btn blue" style="margin-bottom: 20px;">导入</button>
							<span><a href="exportTemplate.htm">模版下载</a></span>
						</div>
					</div>
				</form>
				<span style="color: red;">示例:</span>
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<th>身份证</th>
						<th>提额档/元</th>
						<th>开始时间</th>
						<th>结束时间</th>
					</thead>
					<tbody>
					<tr>
						<td>130406196304221225</td>
						<td>10000</td>
						<td>2018-04-02</td>
						<td>2018-04-29</td>
                    </tr>
					</tbody>
				</table>
                <a href="pageList.htm" style="margin-bottom:  15px;" class="btn">返回</a>
			</div>


		</div>
	</div>
</div>
<#include "/sys/bottom.ftl">
<script>
    $(function(){
	<#if excelErrorMsgs??>
        var errorMsg = "<#list excelErrorMsgs as item>${item};</#list>";
        BootstrapDialog.alert(errorMsg);
	</#if>
    });
</script>