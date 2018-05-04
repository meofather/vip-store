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
					<li><a href="#">对公明细查询</a></li>
				</ul>
			</div>
		</div>
		<div>
			<div class="portlet-body form">
				<form action="${serverPath}/checkRepayController/recordQuery.htm" id="searchForm" class="form-horizontal"
					method="post" enctype="multipart/form-data">
					<div class="row-fluid">
						<div class="control-group span4 ">
							<label class="help-inline text-right span4">批次号：</label> <input
								type="text" class="m-wrap span8" name="batchNo"
								value="${batchNo!}">
						</div>
						<div class="control-group span1 ">
                            <button type="submit" class="btn blue" style="margin-bottom: 20px;">查询</button>
						</div>
                        <div class="control-group span4 ">
                            <select onchange="IsShowReduction(this.value)">
                                <option value="0">全部</option>
                                <option value="1">可执行减免账单</option>
                                <option value="2">不可执行减免账单</option>
                            </select>
                        </div>
					</div>

                    <button type="button" class="btn blue" onclick="reductionNow();" id="reductionBtn" style="margin-bottom: 20px;">执行减免</button>
                    <a href="javascript:page_back('${serverPath}/contractImport/batchPageList.htm')" class="blue btn" style="margin-bottom: 20px;">返回</a>
				</form>
			</div>

			<div class="tabbable tabbable-custom tabbable-custom-profile">
				<!-- table -->
				<table class="table table-striped table-bordered table-hover">
						<thead>
                        <th><input type="checkbox" name = "id" onclick="selectAll(this.checked)"></th>
						<th>批次号</th>
							<th>合同号</th>
							<th>还款金额</th>
							<th>线下还款时间</th>
							<th>还款方式</th>
							<th>收款人</th>
							<th>账单号</th>
							<th>剩余应还本息</th>
							<th>剩余罚息滞纳金</th>
							<th>应还日期</th>
							<th>对公操作人</th>
							<th>提交时间</th>
							<th>对公结果</th>
							<th>减免操作人</th>
							<th>提交时间</th>
							<th>减免结果</th>
							<th>备注</th>
						</thead>
					<tbody>
					<#if list??>
						<#list list as item>
                        <tr id="${item_index+1!}">
                            <td><#if item.repaystatus??&&item.repaystatus == 1 && !(item.reducestatus??) && (item.penaltyLateFee > 0) && item.offlineimportamount gte item.reapyAmount><input type="checkbox" name = "id" value="${item.id!}"></#if></td>
                            <td>${item.batchno!}</td>
                            <td>${item.contractno!}</td>
                            <td>${item.offlineimportamount!}</td>
                            <td>${(item.offlineimportdate?string('yyyy-MM-dd HH:mm:ss'))!}</td>
                            <td>${item.paymentmethod!}</td>
                            <td>${item.receivables!}</td>
                            <td>${item.billno!}</td>
                            <td>${item.priInt!}</td>
                            <td>${item.penaltyLateFee!}</td>
                            <td>${(item.agreeRepayDate?string('yyyy-MM-dd HH:mm:ss'))!}</td>
                            <td>${item.repaylastexecuteuser!}</td>
                            <td>${(item.repaylastexecutetime?string('yyyy-MM-dd HH:mm:ss'))!}</td>
                            <td><#if item.repaystatus??&&item.repaystatus == 1>成功</#if><#if item.repaystatus??&&item.repaystatus == 0>失败</#if></td>
                             <td>${item.reducelastexecuteuser!}</td>
                            <td>${(item.reducelastexecutetime?string('yyyy-MM-dd HH:mm:ss'))!}</td>
                            <td><#if item.reducestatus??&&item.reducestatus == 1>成功</#if><#if item.reducestatus??&&item.reducestatus == 0>失败</#if></td>
                            <td>${item.repayremark!item.reduceremark!}</td>
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
    function IsShowReduction(this_value) {
		if(this_value == 0){
            $("tbody tr").show();
		}
		if(this_value == 1){
            $("tbody tr").hide();
            $("tbody input").parents("tr").show();
		}
		if(this_value == 2){
            $("tbody tr").show();
            $("tbody input").parents("tr").hide();
		}
    }
    function page_back(url) {
        window.location.href = url+"?"+ChkUtil.getCookie("queryParams");
    }
	function reductionNow() {
        $("#reductionBtn").attr("disabled","disabled");
      var tr_ = $("tbody input[type='checkbox']:checked").parents("tr");
      var dataArray = [];
        tr_.each(function (index, dom) {
            var data = {};
            data.batchNo = $(dom).find("td:eq(1)").html();
            data.contractNo = $(dom).find("td:eq(2)").html();
            data.amount = $(dom).find("td:eq(3)").html();
            data.repayDate = $(dom).find("td:eq(4)").html();
            data.paymentMethod = $(dom).find("td:eq(5)").html();
            data.receivables = $(dom).find("td:eq(6)").html();
            data.billNo = $(dom).find("td:eq(7)").html();
            data.priInt = $(dom).find("td:eq(8)").html();
            data.penaltyLateFee = $(dom).find("td:eq(9)").html();
            data.shouldRepayDate = $(dom).find("td:eq(10)").html();
            dataArray.push(data);
        })
		if(dataArray.length == 0){
            BootstrapDialog.alert("请先选择需要减免的账单");
            return;
		}
		$.ajax({
            url : serverPath + '/checkRepayController/reduceOffline.htm',
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
    function selectAll(value) {
	    if(value){
            $("input[type='checkbox'][name='id']").attr("checked","checked").parent().addClass("checked");
		}else{
            $("input[type='checkbox'][name='id']").attr("checked",false).parent().removeClass("checked");
        }
    }
</script>