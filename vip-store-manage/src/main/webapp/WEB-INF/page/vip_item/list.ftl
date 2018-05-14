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
					<li><a href="#">产品管理</a><i class="icon-angle-right"></i></li>
					<li><a href="#">产品列表</a></li>
				</ul>
			</div>
		</div>
			<div class="portlet-body form">
                    <div class="control-group span4 ">
                        <a href="${serverPath}/vip_item/newItem.htm" class="btn blue" style="margin-bottom: 20px;" target="_blank">新增</a>
                    </div>
			</div>

			<div class="tabbable tabbable-custom tabbable-custom-profile">
				<!-- table -->
				<table class="table table-striped table-bordered table-hover">
						<thead>
							<th>序号</th>
                            <th>产品图片</th>
                            <th>产品名称</th>
							<th>单价</th>
							<th>售价</th>
							<th>官网价</th>
							<th>真实库存</th>
							<th>缓解库存</th>
							<th>销量</th>
							<th>描述</th>
						</thead>
					<tbody>
					<#if page.result??>
						<#list page.result as item>
                        <tr id="${item_index+1!}" >
                            <td>${item_index+1!}</td>
                            <td><img src="${item.imageUrl!}"></td>
                            <td>${item.itemName!}</td>
                            <td>${item.costPrice!}</td>
                            <td>${item.sellingPrice!}</td>
                            <td>${item.officialPrice!}</td>
                            <td>${item.realStock!}</td>
                            <td>${item.cacheStock!}</td>
                            <td>${(item.salesVolume)!}</td>
                            <td>
								<a href="${serverPath}/vip_item_stock/pageList.htm?itemId=${item.id}">查看库存</a>&nbsp;&nbsp;
								<a href="${serverPath}/vip_item/editItem.htm?id=${item.id}">编辑</a>&nbsp;&nbsp;
								<div id="description_${item.id}" style="display: none;"> ${item.description!}</div><a  href="#show" data-toggle="modal" onclick="showDescription(${(item.id)!})">查询详细</a>
							</td>
                        </tr>
						</#list>
					</#if>
					</tbody>
				</table>
			<@p.pagination value=page />
			</div>
	</div>

<div id="show" class="modal hide fade show" tabindex="-1" data-width="760">
    <from id="submit_form">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
                    aria-hidden="true"></button>
            <h3>详情页</h3>
        </div>
        <div class="modal-body" id="showDescription">

        </div>
        <div class="modal-footer">
            <button  type="button" class="btn blue" onclick="$('#show').modal('hide')">关闭</button>
        </div>
    </from>
</div>
<#include "/sys/bottom.ftl">
<script>
	function showDescription(descriptionId) {
	    var content = $("#description_"+descriptionId).html();
		$("#showDescription").html(content);
    }
	$(function(){
	    <#if excelErrorMsgs??>
			var errorMsg = "<#list excelErrorMsgs as item>${item};</#list>";
            BootstrapDialog.alert(errorMsg);
	    </#if>
	});
	function search() {
	    form_trim();
		$("#searchForm").attr("action", "${ctx}/thirdBlack/list.htm");
		$("#searchForm").submit();
	}
	function export_excel() {
		form_trim();
		$("#searchForm").attr("action", "${ctx}/thirdBlack/export.htm");
		$("#searchForm").submit();
	}

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
	function goPage(pageNumber) {
	    form_trim();
		$("#searchForm").attr("action", "${ctx}/contractImport/batchPageList.htm");
	    $("#pageIndex").val(pageNumber);
	    $("#searchForm").submit();
	}
    function page_jump(url){
        ChkUtil.saveCookie("queryParams", $("#searchForm").serialize(),"","/");
        window.location.href=url;
    }
	function form_trim(){
		var $input=$("#searchForm input[type='text']");
		$input.each(function(i,n){
			 var value = $(n).val(); 
			 $(n).val($.trim(value));
		})
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