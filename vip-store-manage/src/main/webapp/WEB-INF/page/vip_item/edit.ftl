<#include "/sys/top.ftl"> <#include "/sys/left.ftl">
<div class="page-content">
    <!-- header -->
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12">
                <!--页面标题-->
                <h3 class="page-title">
                </h3>
                <!--面包屑导航-->
                <ul class="breadcrumb">
                    <li><i class="icon-home"></i> <a href="${ctx}/index.htm">首页</a> <i
                            class="icon-angle-right"></i></li>
                    <li><a href="#">产品管理</a><i class="icon-angle-right"></i></li>
                    <li><span>编辑产品</span></li>
                </ul>
            </div>
        </div>
        <div class="portlet box">

            <div class="portlet-body form">
                <!-- edit form -->
                <form id="tab" action="${ctx}/vip_item/saveEditItem.htm" method="POST" class="form-horizontal">
                    <div class="row-fluid">
                        <div class="control-group span6 ">
                            <label class="control-label">产品名称<span class="required">*</span></label>
                            <div class="controls">
                                <input name="itemName" class="m-wrap span6" placeholder="请入输入产品名称" value="${item.itemName!}"/>
                                <input type="hidden" name="id" class="m-wrap span6" value="${item.id!}"/>
                            </div>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="control-group span6 ">
                            <label class="control-label">产品图片<span class="required">*</span></label>
                            <div class="controls">
                                <input name="file" class="m-wrap span6" type="file" id="file-pic" multiple/>
                                <input id="imageUrl" name="imageUrl" class="m-wrap span6" type="hidden" value="${item.imageUrl!}"/>
                            </div>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="control-group span6 ">
                            <label class="control-label">单价<span class="required">*</span></label>
                            <div class="controls">
                                <input type="text" name="costPrice"
                                       class="m-wrap span6" maxlength="15" placeholder="请入输入产品单价" value="${item.costPrice!}"
                                >
                            </div>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="control-group span6 ">
                            <label class="control-label">售价<span class="required">*</span></label>
                            <div class="controls">
                                <input	type="text" name="sellingPrice" id="menuUrl" maxlength="100" placeholder="请入输入产品售价"
                                          class="m-wrap span6" value="${item.sellingPrice!}">
                            </div>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="control-group span6 ">
                            <label class="control-label"><i class="glyphicon glass"></i>官网价<span class="required">*</span></label>
                            <div class="controls">
                                <input	type="text" name="officialPrice" id="menuUrl" maxlength="100" placeholder="请入输入产品官网价"
                                          class="m-wrap span6" value="${item.officialPrice!}">
                            </div>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="control-group span6 ">
                            <label class="control-label">缓解库存<span class="required">*</span></label>
                            <div class="controls">
                                <input type="text" name="cacheStock"	class="m-wrap span6" maxlength="30" placeholder="请入输入缓解库存" value="${item.cacheStock!}">
                            </div>
                        </div>
                    </div>

                    <div class="row-fluid">
                        <div class="control-group span6 ">
                            <label class="control-label">产品描述<span class="required">*</span></label>
                            <textarea style="display: none" name="description" id="description">${item.description!}</textarea>
                            <div class="controls">
                                <script id="editor" type="text/plain" style="width:800px;height:500px;"></script>
                                </div>
                                </div>
                                </div>

                                </form>
                                <div class="form-actions">
                                        <input type="button" class="btn blue" onclick="save(event)"	value="提交" />
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
								<#include "/sys/bottom.ftl">
                                        <script src="${ctx}/js/ueditor/ueditor.config.js"></script>
                                <script src="${ctx}/js/ueditor/ueditor.all.min.js"></script>
                                <script src="${ctx}/js/ueditor/lang/zh-cn/zh-cn.js"></script>
                                <script type="text/javascript">
									<#if msg??>
                                    BootstrapDialog.alert("${msg!}");
									</#if>
                                    //实例化编辑器
                                    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
                                    var ue = UE.getEditor('editor');
                                    //对编辑器的操作最好在编辑器ready之后再做
                                    ue.ready(function() {
                                        var temp = $("#description").text();
                                        ue.setContent(temp);
                                    });
                                    function save(e) {
                                        var decirption = UE.getEditor('editor').getContent();
                                        $("#description").val(decirption);
                                        if("" == $("#imageUrl").val()){
                                            BootstrapDialog.alert("请上传文件");
                                            return;
                                        }
                                        var form = $("#tab");
                                        if(!form.valid()){
                                            BootstrapDialog.alert("参数校验失败");
                                            return;
                                        }
                                        $("#tab").submit();
                                    }
                                    function getContent() {
                                        var arr = [];
                                        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
                                        arr.push("内容为：");
                                        arr.push(UE.getEditor('editor').getContent());
                                        alert(arr.join("\n"));
                                    }
                                    function getPlainTxt() {
                                        var arr = [];
                                        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
                                        arr.push("内容为：");
                                        arr.push(UE.getEditor('editor').getPlainTxt());
                                        alert(arr.join('\n'))
                                    }
                                    $("#file-pic").fileinput({
                                        showClose : false,//显示右上角X关闭
                                        showRemove:false,
                                        uploadUrl: serverPath+"/file/fileUpload.htm", //上传的地址
                                        uploadAsync: true, //默认异步上传
                                        language: 'zh',
                                        showUpload: true,
                                        showPreview : true, //是否显示预览
                                        showCaption: false,
                                        dropZoneEnabled: false,
                                        maxFileCount: 1, //表示允许同时上传的最大文件个数
                                        overwriteInitial: false,
                                        initialPreviewAsData: true,
                                        initialPreview: [
                                            "${item.imageUrl!}"
                                        ],
                                        initialPreviewConfig: [
                                            { width: "120px", url: "{$url}"}
                                        ]
                                    });
                                    //上传文件成功，回调函数
                                    $('#file-pic').on("fileuploaded", function(event, data, previewId, index) {
                                        console.log(data);
                                        var result = data.response; //后台返回的json
                                        $('#imageUrl').val(result.title);//拿到后台传回来的id，给图片的id赋值序列化表单用
                                    });

                                    window.onload = function () {
                                        var form = $("#tab");
                                        form.validate({
                                            onfocusout:false,
                                            rules : {
                                                // account
                                                itemName : {
                                                    required : true
                                                },
                                                costPrice : {
                                                    required : true,
                                                    Floatlen:[7,2]
                                                },
                                                sellingPrice : {
                                                    required : true,
                                                    Floatlen:[7,2]
                                                },
                                                officialPrice : {
                                                    required : true,
                                                    Floatlen:[7,2]
                                                }
                                            },

                                            messages : { // custom messages for radio buttons and checkboxes
                                                costPrice:{
                                                    Floatlen:"请输入[0000000.00]数据"
                                                },
                                                sellingPrice:{
                                                    Floatlen:"请输入[0000000.00]数据"
                                                },
                                                officialPrice:{
                                                    Floatlen:"请输入[0000000.00]数据"
                                                }
                                            }
                                        });
                                    }

                                </script>