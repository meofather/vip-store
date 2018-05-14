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
                    <li><a href="#">产品库存列表</a></li>
                </ul>
            </div>
        </div>
        <div class="portlet-body form">
            <div class="control-group span4 ">
                <a href="#show" class="btn blue" style="margin-bottom: 20px;" data-toggle="modal">导入</a>
            </div>
        </div>

        <div class="tabbable tabbable-custom tabbable-custom-profile">
            <!-- table -->
            <table class="table table-striped table-bordered table-hover">
                <thead>
                <th>序号</th>
                <th>售出订单号</th>
                <th>虚拟卡号</th>
                <th>买方手机号</th>
                <th>创建时间</th>
                <th>发售时间</th>
                <th>有效期开始</th>
                <th>有效期结束</th>
                <th>状态</th>
                </thead>
                <tbody>
                <#if page.result??>
                    <#list page.result as item>
                    <tr id="${item_index+1!}">

                        <td>${item_index+1!}</td>
                        <td>${item.orderNo!}</td>
                        <td>${item.itemInfo!}</td>
                        <td>${item.mobile!}</td>
                        <td>${(item.createTime?string('yyyy-MM-dd HH:mm:ss'))!}</td>
                        <td>${(item.updateTime?string('yyyy-MM-dd HH:mm:ss'))!}</td>
                        <td>${(item.invalidateStart?string('yyyy-MM-dd HH:mm:ss'))!}</td>
                        <td>${(item.invalidateEnd?string('yyyy-MM-dd HH:mm:ss'))!}</td>
                        <td><#if !(item.orderNo??)>已售<#else>未售</#if></td>

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
                <h3>导入</h3>
            </div>
            <div class="modal-body">
                <div class="portlet box">
                    <!-- edit form -->
                    <form id="tab">
                        <div class="row-fluid">
                            <div class="control-group ">
                                <label class="control-label">有效期开始<span class="required">*</span></label>
                                <div class="controls">
                                    <input name="invalidateStart" class="m-wrap span4 date-picker" size="16" type="text" data-date-format="yyyy-mm-dd" /><span class="add-on"><i class="icon-calendar"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="row-fluid">
                            <div class="control-group ">
                                <label class="control-label">有效期结束<span class="required">*</span></label>
                                <div class="controls">
                                    <input name="invalidateEnd" class="m-wrap span4 date-picker" size="16" type="text" data-date-format="yyyy-mm-dd" /><span class="add-on"><i class="icon-calendar"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="row-fluid">
                            <div class="control-group ">
                                <label class="control-label">请选择导入文件<span class="required">*</span></label>
                                <div class="controls">
                                    <div class="file-loading">
                                        <input id="file-pic" name="file" multiple type="file"'>
                                    </div>
                                    <div id="kartik-file-errors"></div>
                                </div>
                            </div>
                        </div>

                        <input id="file-pic-url" name="filePath" multiple type="hidden"'>
                        <input  name="itemId" multiple type="hidden" value="${query.itemId!}">
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn blue" onclick="importData();">执行</button>
                <button type="button" class="btn blue" onclick="$('#show').modal('hide')">关闭</button>
            </div>
        </from>
    </div>
<#include "/sys/bottom.ftl">
    <script>

        $(function () {
        <#if excelErrorMsgs??>
            var errorMsg = "<#list excelErrorMsgs as item>${item};</#list>";
            BootstrapDialog.alert(errorMsg);
        </#if>
            $('#file-pic').fileinput({//初始化上传文件框
                uploadUrl: serverPath+"/file/fileUpload.htm", //上传的地址
                uploadAsync: true, //默认异步上传
                showPreview: false,
                showUpload: false,
                dropZoneEnabled: false,
                language: 'zh',
                maxFileCount: 10,
                mainClass: "input-group-lg",
                showUpload: true, //是否显示上传按钮
            });
            //上传文件成功，回调函数
            $('#file-pic').on("fileuploaded", function(event, data) {
                console.log(data);
                var result = data.response; //后台返回的json
                $('#file-pic-url').val(result.title);//拿到后台传回来的id，给图片的id赋值序列化表单用
            });
            var form = $("#tab");
            form.validate({
                onfocusout:false,
                rules : {
                    // account
                    invalidateStart : {
                        required : true
                    },
                    invalidateStart : {
                        required : true
                    },
                    savePath : {
                        required : true
                    }
                }
            });
        });

        function goPage(pageNumber) {
            form_trim();
            $("#searchForm").attr("action", "${ctx}/contractImport/batchPageList.htm");
            $("#pageIndex").val(pageNumber);
            $("#searchForm").submit();
        }

        function page_jump(url) {
            ChkUtil.saveCookie("queryParams", $("#searchForm").serialize(), "", "/");
            window.location.href = url;
        }

        function importData() {
            if("" == $("#filePath").val()){
                BootstrapDialog.alert("请上传excel文件");
                return;
            }
            var form = $("#tab");
            if(!form.valid()){
                BootstrapDialog.alert("参数校验失败");
                return;
            }
           var data = $("#tab").serialize();
            $.ajax({
                url : serverPath + "/vip_item_stock/importData.htm",
                type : "post",
                data : data,
                dataType : "json",
                success : function(result) {
                    if (result.success) {
                        BootstrapDialog.alert(result.message);
                        window.location.reload();
                    } else {
                        BootstrapDialog.alert(result.message);
                    }
                },
                error : function() {
                    BootstrapDialog.alert("操作失败");
                }
            });
        }
    </script>