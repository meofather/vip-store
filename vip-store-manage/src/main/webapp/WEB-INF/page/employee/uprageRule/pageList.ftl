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
					<li><a href="#">信审提额标准</a></li>
				</ul>
			</div>
		</div>
		<div>
			<div class="portlet-body form">
				<form action="${serverPath}/employeeAmountUprageRule/pageList.htm" id="searchForm" class="form-horizontal"
					method="post">
					<div class="row-fluid">
					<@p.pageForm value=page type="sort"/>
                        <div class="control-group span3 ">
                            <label class="help-inline text-right span4">大区：</label>
                            <div class="">
                                <select name="areaId" class="m-wrap span8" data-id="${(queryParam.areaId)!}" onchange="initStoreData()">
                                    <option value="">请选择</option>
                                </select>
                            </div>
                        </div>
                        <div class="control-group span3">
                            <label class="help-inline text-right span4">门店：</label>
                            <div class="">
                                <select name="storeId" class="m-wrap span8" data-id="${(queryParam.storeId)!}">
                                    <option value="">请选择</option>
                                </select>
                            </div>
                        </div>
						<div class="control-group span3 ">
							<label class="help-inline text-right span4">创建人：</label> <input
								type="text" class="m-wrap span8" name="createUser"
								value="${(queryParam.createUser)!}">
						</div>
						<div class="control-group span3 ">
							<label class="help-inline text-right span4">身份证：</label> <input
								type="text" class="m-wrap span8" name="employeeIdcardno"
								value="${(queryParam.employeeIdcardno)!}">
						</div>
						<div class="control-group span3 ">
							<label class="help-inline text-right span4">状态：</label>
							<select name="status" class="m-wrap span8">
                                <option value="-1">请选择</option>
                                <option value="0" <#if (queryParam.status)?? && (queryParam.status) == 0>selected="selected"</#if>>未生效</option>
                                <option value="1" <#if (queryParam.status)?? && (queryParam.status) == 1>selected="selected"</#if>>生效</option>
                                <option value="2" <#if (queryParam.status)?? && (queryParam.status) == 2>selected="selected"</#if>>已过期</option>
							</select>
						</div>
						<div class="control-group span3 ">
							<label class="help-inline text-right span4">是否删除：</label>
							<select name="delFlag" class="m-wrap span8">
                                <option value="-1">请选择</option>
                                <option value="0" <#if (queryParam.delFlag)?? && (queryParam.delFlag) == 0>selected="selected"</#if>>已删除 </option>
                                <option value="1" <#if (queryParam.delFlag)?? && (queryParam.delFlag) == 1>selected="selected"</#if>>未删除</option>
							</select>
						</div>
					</div>
					<div class="row-fluid">
                        <div class="control-group span4 ">
                            <button type="submit" class="btn blue" style="margin-bottom: 20px;">查询</button>
                            <a href="importPage.htm" class="btn blue" style="margin-bottom: 20px;">导入</a>
                        </div>
					</div>
				</form>
			</div>

			<div class="tabbable tabbable-custom tabbable-custom-profile">
				<!-- table -->
				<table class="table table-striped table-bordered table-hover">
						<thead>
							<th>序号</th>
							<th>大区</th>
							<th>门店</th>
							<th>业务员</th>
							<th>身份证</th>
							<th>提额档/元</th>
							<th>开始时间</th>
							<th>结束时间</th>
							<th>创建人</th>
							<th>创建时间</th>
							<th>状态</th>
							<th>删除标记</th>
							<th>操作</th>
						</thead>
					<tbody>
					<#if page.result??>
						<#list page.result as item>
                        <tr id="${item_index+1!}" >
                            <td>${item_index+1!}</td>
                            <td>${item.areaName!}</a></td>
                            <td>${item.storeName!}</td>
                            <td>${item.employeeName!}</td>
                            <td>${item.employeeIdcardno!}</td>
                            <td>${(item.amount?string('0.00'))!}</td>
                            <td>${(item.startTime?string('yyyy-MM-dd HH:mm:ss'))!}</td>
                            <td>${(item.endTime?string('yyyy-MM-dd HH:mm:ss'))!}</td>
                            <td>${item.createUser!}</td>
                            <td>${(item.createTime?string('yyyy-MM-dd HH:mm:ss'))!}</td>
                            <td>${(item.statusName)!}</td>
                            <td><#if item.delFlag??&&item.delFlag == 0>已删除</#if><#if item.delFlag??&&item.delFlag == 1>未删除</#if></td>
                            <td><#if (item.delFlag)?? && (item.delFlag) == 1><a href="javascript:void()" onclick="deleteById('${item.id}');">删除</a></#if></td>
                        </tr>
						</#list>
					</#if>
					</tbody>
				</table>
			<@p.pagination value=page />
			</div>
		</div>
	</div>
</div>
<#include "/sys/bottom.ftl">
<script>
    var orgType="${(user.orgType)!}"; //组织类型1:大区 2：总部 3：门店
    var regionId="${(empDetail.regionId)!}";//大区id
    var storeId="${(empDetail.storeId)!}";//门店id
	$(function(){
	    <#if excelErrorMsgs??>
			var errorMsg = "<#list excelErrorMsgs as item>${item};</#list>";
            BootstrapDialog.alert(errorMsg);
	    </#if>
	    <#if import??&&import==true>
            BootstrapDialog.alert("操作成功");
	    </#if>
        init();
	});
	function deleteById(id) {
        $.ajax({
            url : serverPath + '/employeeAmountUprageRule/deleteById.htm?id='+id,
            type : 'POST',
            dataType : 'json',
            success:function (data) {
                if(data.code == 0){
                    BootstrapDialog.alert(data.message,function(){
                        window.location.reload();
					});
                }else{
                    BootstrapDialog.alert(data.message);
                }
            },
            error:function () {
                BootstrapDialog.alert("操作异常！");
            }
        });
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
		$("#searchForm").attr("action", "${ctx}/employeeAmountUprageRule/pageList.htm");
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
    function initStoreData(){
        var parentId  =  $("select[name='areaId']").val();
        if(ChkUtil.isNull(parentId)) {
            $("select[name='storeId']").find("option:gt(0)").remove();
            return;
        }
        if(parentId == "0"){
            parentId = $("select[name='areaId']").attr('data-id');
        }
        if(parentId == "0"){
            return;
        }
        var queryData;
        var url;
        if(orgType==3)
        {
            queryData ={"id":storeId,	"Time" : new Date().getMilliseconds()}
            url=serverPath + "/organization/selectOrganizationById.htm";
        }else{
            queryData ={"parentId" : parentId,	"Time" : new Date().getMilliseconds()}
            url=serverPath + "/organization/selectOrgByParentId.htm";
        };
        $.ajax({
            url: url,
            type:"post",
            data:queryData,
            dataType:"json",
            success:function(result){
                //清空除第一条内容的外的其它数据
                var select_ = $("select[name='storeId']");
                select_.find("option:gt(0)").remove();
                if(orgType==3){
                    var isSelected = result.data.id == select_.attr('data-id')?"selected='selected'":"";
                    select_.append(
                            "<option "+isSelected+" value='"
                            + result.data.id + "'>"
                            + result.data.orgName
                            + "</option>");
                }else{
                    for (var i = 0; i < result.data.length; i++) {
                        var isSelected = result.data[i].id == select_.attr('data-id')?"selected='selected'":"";
                        select_.append(
                                "<option "+isSelected+" value='"
                                + result.data[i].id + "'>"
                                + result.data[i].orgName
                                + "</option>");
                    }
                }

                if(orgType==3){
                    select_.find("option:eq(0)").remove();
                    select_.val(storeId);
                }
                $('#searchBtn').attr("disabled",false);
            },
            error:function(){
                alert("加载失败");
            }
        });
    }
    function init(){
        $("#searchBtn").attr("disabled","disabled");
        //加载大区数据
        initAreaData();
    }
    function initAreaData(){
        var queryData;
        var url;
        if(orgType==2){
            url=serverPath + "/organization/selectOrgByOrgType.htm";
            queryData ={"orgType" : 1,	"Time" : new Date().getMilliseconds()}
        }else{
            url=serverPath + "/organization/selectOrganizationById.htm";
            queryData ={"id":regionId,	"Time" : new Date().getMilliseconds()}
        };
        $.ajax({
            url: url,
            type:"post",
            data: queryData,
            dataType:"json",
            success:function(result){
                //清空除第一条内容的外的其它数据
                var select_ = $("select[name='areaId']");
                select_.find("option:gt(0)").remove();
                if(orgType==2){
                    for (var i = 0; i < result.data.length; i++) {
                        var isSelected = result.data[i].id == select_.attr('data-id')?"selected='selected'":"";
                        select_.append(
                                "<option "+isSelected+" value='"
                                + result.data[i].id + "'>"
                                + result.data[i].orgName
                                + "</option>");
                    }
                }else{
                    var isSelected = result.data.id == select_.attr('data-id')?"selected='selected'":"";
                    select_.append(
                            "<option "+isSelected+" value='"
                            + result.data.id + "'>"
                            + result.data.orgName
                            + "</option>");
                }

                if(orgType!=2){
                    select_.find("option:eq(0)").remove();
                    select_.val(regionId);
                }
                initStoreData();
            },
            error:function(){
                alert("加载失败");
            }
        });
    }

</script>