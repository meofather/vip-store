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
					<li><a href="#">财务管理</a><i class="icon-angle-right"></i></li>
					<li><a href="#">还款对公导入</a></li>
				</ul>
			</div>
		</div>
		<div>
			<div class="portlet-body form">
				<form action="#" id="searchForm" class="form-horizontal"
					method="post" enctype="multipart/form-data">
					<div class="row-fluid">
						<div class="control-group span12 ">
							<label class="help-inline">上传文件：</label>
                            <input type="file" id="fileName" name="upFile" />
                            <button type="button" class="btn blue" onclick="impInfo();">导入</button>
                            <span>
								<a href="${ctx}/contractImport/exportTemplate.htm" />模板下载</a>
							</span>
						</div>
						<#--<div class="control-group span4 ">-->
							<#--<label class="help-inline text-right span4">身份证：</label> <input-->
								<#--type="text" class="m-wrap span8" name="idCard"-->
								<#--value="">-->
						<#--</div>-->
					</div>
				</form>
                <button type="button" class="btn blue" id="repayBtn" onclick="repayNow();" style="margin-bottom: 20px;">执行对公</button>
                <a href="${serverPath}/contractImport/batchPageList.htm" class="btn blue" target="_blank" style="margin-bottom: 20px;">记录查询</a>
                <a href="${serverPath}/contractImport/list.htm" class="btn blue" style="margin-bottom: 20px;">清空</a>
			</div>

			<div class="tabbable tabbable-custom tabbable-custom-profile">
                <p style="color: red;">导入说明：</p>
                <p style="color: red;"> 1、单次导入数据量需不大于500条；</p>
                <p style="color: red;"> 2、导入合同号不能重复，否则导入失败；</p>
                <p style="color: red;"> 3、数据执行对公时，需要一定时间处理，建议十分钟之后查询对公结果，再进行减免操作；</p>
                <p style="color: red;"> 4、数据导入之后长时间未处理对公操作时，建议刷新页面再次导入执行。</p>
				<!-- table -->
				<table class="table table-striped table-bordered table-hover">
						<thead>
						<th>批次号</th>
							<th>合同号</th>
							<th>还款金额</th>
							<th>线下还款时间</th>
							<th>还款方式</th>
							<th>收款人</th>
							<th>系统账单号</th>
							<th>系统剩余应还本息</th>
							<th>系统剩余罚息加滞纳金</th>
							<th>系统应还日期</th>
							<th>是否匹配成功</th>
						</thead>
					<tbody>
					<#if excelData??>
						<#list excelData as item>
                        <tr id="${item_index+1!}" <#if item.isMatched??&&item.isMatched == "匹配成功">isMatched="true"</#if>>
                            <td>${item.batchNo!}</td>
                            <td>${item.contractNo!}</td>
                            <td>${item.amount!}</td>
                            <td>${item.repayDate!}</td>
                            <td>${item.paymentMethod!}</td>
                            <td>${item.receivables!}</td>
                            <td>${item.billNo!}</td>
                            <td>${item.priInt!}</td>
                            <td>${item.penaltyLateFee!}</td>
                            <td>${item.shouldRepayDate!}</td>
                            <td><span <#if item.isMatched??&&item.isMatched == "匹配成功">style="color: #00B83F;" </#if> <#if item.isMatched??&&item.isMatched == "匹配失败">style="color: red;" </#if>>${item.isMatched!}</span></td>
                        </tr>
						</#list>
					</#if>
					</tbody>
				</table>
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
	//导入
	function impInfo() {
		if (!checkForm()) {
			return;
		}
		var url = "${ctx}/contractImport/impInfo.htm";
		$("#searchForm").attr("action", url);
		$("#searchForm").submit();
	}
	//验证信息
	function checkForm() {
		var fileName = $("#fileName").val();
		if (fileName == "") {
			BootstrapDialog.alert("上传文件不能为空!");
			return false;
		}
		if (fileName.indexOf(".xls") == "-1"
				&& fileName.indexOf(".xlsx") == "-1") {
			BootstrapDialog.alert("导入文件格式错误，请重新选择!");
			return false;
		}
		return true;
	}
    /**
	 *  private Long id;
     private String batchNo;
     private String contractNo;
     private String amount;
     private String repayDate;
     private String paymentMethod;//收款方式
     private String receivables;//收款方
     private String billNo;
     private String priInt;//本息
     private String penaltyLateFee;//罚息和滞纳金
     private String shouldRepayDate;//应还日期
     */
	function repayNow() {
        $("#repayBtn").attr("disabled","disabled");
      var tr_ = $("tr[isMatched='true']");
      var dataArray = [];
        tr_.each(function (index, dom) {
            var data = {};
            data.batchNo = $(dom).find("td:eq(0)").html();
            data.contractNo = $(dom).find("td:eq(1)").html();
            data.amount = $(dom).find("td:eq(2)").html();
            data.repayDate = $(dom).find("td:eq(3)").html();
            data.paymentMethod = $(dom).find("td:eq(4)").html();
            data.receivables = $(dom).find("td:eq(5)").html();
            data.billNo = $(dom).find("td:eq(6)").html();
            data.priInt = $(dom).find("td:eq(7)").html();
            data.penaltyLateFee = $(dom).find("td:eq(8)").html();
            data.shouldRepayDate = $(dom).find("td:eq(9)").html();
            dataArray.push(data);
        })
        if(dataArray.length == 0){
            BootstrapDialog.alert("没有找到匹配成功的记录");
            return;
        }
		$.ajax({
            url : serverPath + '/checkRepayController/checkRepay.htm',
            type : 'POST',
            dataType : 'json',
            data : JSON.stringify(dataArray),
			contentType:"application/json",
			success:function (data) {
				if(data.code == 0){
                    BootstrapDialog.alert("本次操作已提交，请稍后刷新查询结果！");
				}else{
                    BootstrapDialog.alert(data.message);
				}
            },
			error:function (data) {
                BootstrapDialog.alert("操作异常！");
            }
		});
    }
</script>