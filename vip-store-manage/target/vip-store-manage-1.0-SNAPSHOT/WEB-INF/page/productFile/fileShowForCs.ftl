<#include "/sys/top.ftl">
<#include "/sys/left.ftl">
<link href="${cdnPath}/css/smartMenu/smartMenu.css" rel="stylesheet" type="text/css"/>
<link href="${cdnPath}/css/viewer/viewer.css" rel="stylesheet" type="text/css"/>
<link href="${cdnPath}/common/bootstrap/media/css/jquery.fileupload-ui.css" rel="stylesheet" type="text/css"/>
<link href="${cdnPath}/common/bootstrap/media/css/jquery.fancybox.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
    var serverPath = "${serverPath}";
    var fileUploadDto = {fileUpState:"${(fileUploadDto.fileUpState)!''}",isView:"${(fileUploadDto.isView)!'1'}"};
</script>

<div class="page-content" >
	<!--FirstTable-->
	<div class="portlet-body">
		<!-- table -->    
		<style>
		.viewer-canvas{ no-repeat center center;}
		</style> 
		<table class="table table-hover">
			  <tr><td>
		         <span class="control-label">合同号：</span>
		         <input type="text" name="applyLoanNo" id="applyLoanNo" style="margin-right:30px;" value=${fileUploadDto.contractNo}
                    class="m-wrap medium" readonly/>
                 <#--<span class="control-label">&nbsp;&nbsp;附件阶段：</span>-->
                 <#--<select class="m-wrap span8" id="uploadStateName" name="uploadStateName" onchange="changeUploadState(); return false;">-->
                <#--<!--查看时，只有信审专员可以查看信审阶段，其他可以查看除信审外的其他阶段&ndash;&gt;-->
                <#--<#list fileUpSysNodeList as fileUpSysNode>-->
                    <#--<#if 'taskState' != fileUpSysNode.nodeCode>-->
                        <#--<option value =${fileUpSysNode.id} >${fileUpSysNode.nodeName}</option>-->
                    <#--</#if>-->
                <#--</#list>-->
              <#--</select>-->
			  </td></tr>
			  <tr><td>
			     <div class="control-group controls span3 " style="margin-right:45px;">
                    <div class="control-label">
                        <span><input type="checkbox" id="checkAll" name="checkAll" class="checkbox" value=""></span>
                        <span class="control-label">全选&nbsp;&nbsp;&nbsp;已选择</span><span class="control-label" id="checkedNum">0</span><span class="control-label">个文件</span>
                    </div>                                                                  
			     </div>
			     
			     
			     <input type="button" class="btn blue" value="下载" style="margin-right:30px;" onclick="return down()"></input>
              </td></tr>
              
              <!--根据产品类型、文件阶段展示文件目录-->  
              <#list productFiletypeDtoList as productFiletypeDto>
                <#if productFiletypeDto.fileUpState?? && productFiletypeDto.fileUpState == fileUploadDto.fileUpState>
                    <tr><td>
                        <#assign haveFile = 0>
                        <p>${productFiletypeDto.directoryName}：</p>
                        <div class="div">
                        <#if (fileUploadDto.fileDtoList??) && (fileUploadDto.fileDtoList?size>0)>  
                            <#list fileUploadDto.fileDtoList as fileDto>
                            <#if fileDto.uploadId??>
                                <#if fileDto.uploadId == productFiletypeDto.id && fileDto.uploadState == productFiletypeDto.fileUpState>
                                    <#assign haveFile = 1>
                                    <div style="float:left; width:178px; height:180px" class="checkboxParent" id=${fileDto.id}>
                                        <img  src="${cdnPath}/images/productFile/fileImg.png" alt="默认图片" class="img" style=" width:103px; height:103px"/>
                                        <div class='titleDiv'>
                                            <span class="span2 " style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;margin-left:0px" title="${fileDto.fileName}">
                                                <input class="checkbox checkboxFile" type="checkbox" name="checkboxFile" value="">
                                            &nbsp;${fileDto.fileName}</span>
                                        </div>
                                        <div>
                                            <p class="control-label">${fileDto.createTime?string('yyyy-MM-dd HH:mm:ss')}</p>
                                        </div>
                                    </div>
                                </#if>
                            </#if>
                            </#list>
                        </#if> 
                        </div> 
                        <#if haveFile == 0>
                            <div>
                                <span>尚未上传相关附件！</span>
                                <img src="${cdnPath}/images/productFile/UpFilefail.png" height="103px" weight="103px" alt="尚未上传相关附件！" />
                            </div>
                        </#if> 
                                                  
                    </td></tr>
                </#if>
              </#list>

		</table>   
	</div>
</div>

<input type="hidden" id="smartMenuId" name="smartMenuId"></input>


<script src="${cdnPath}/js/productFile/fileUploadForCs.js?v=${VERSION_NO}"></script>
<script src="${cdnPath}/js/smartMenu/jquery-smartMenu-min.js"></script>
<script src="${cdnPath}/common/bootstrap/media/js/jquery.ui.widget.js"></script>
<script src="${cdnPath}/common/bootstrap/media/js/tmpl.min.js"></script>
<script src="${cdnPath}/common/bootstrap/media/js/load-image.min.js"></script>
<script src="${cdnPath}/common/bootstrap/media/js/canvas-to-blob.min.js"></script>
<script src="${cdnPath}/js/productFile/jquery.blueimp-gallery.min.js"></script>
<script src="${cdnPath}/common/bootstrap/media/js/jquery.iframe-transport.js"></script>
<script src="${cdnPath}/common/bootstrap/media/js/jquery.fileupload.js"></script>
<script src="${cdnPath}/common/bootstrap/media/js/jquery.fileupload-fp.js"></script>
<script src="${cdnPath}/js/productFile/fileupload-validate.js"></script>
<script src="${cdnPath}/common/bootstrap/media/js/jquery.fileupload-ui.js"></script>
<script src="${cdnPath}/js/productFile/viewer.js"></script>
<#include "/sys/bottom.ftl">