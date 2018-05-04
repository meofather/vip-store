<#include "/sys/top.ftl">
<#include "/sys/left.ftl">
<style type="text/css">
    .nowrapellipsis {
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        margin-left: 0px
    }
</style>
<div class="page-content">
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
                    <li><a href="#">客户管理</a><i class="icon-angle-right"></i></li>
                    <li><a href="#">客户信息管理</a></li>
                </ul>
            </div>
        </div>
        <div>
            <div class="portlet-body form">
                <form id="searchForm" action="${ctx}/member/list.htm" class="form-horizontal"
                      method="post">
                <@p.pageForm value=page />
                    <div class="row-fluid">
                        <div class="control-group span4 ">

                            <label class="help-inline text-right span4">客户：</label>
                            <input type="text" class="m-wrap span8" name="memberName"
                                   value="${(queryDto.memberName)!}">
                        </div>
                        <div class="control-group span4 ">
                            <label class="help-inline text-right span4">身份证：</label>
                            <input
                                    type="text" class="m-wrap span8" name="idCarNo"
                                    value="${(queryDto.idCarNo)!}">
                        </div>
                        <div class="control-group span4 ">
                            <label class="help-inline text-right span4">手机号：</label>
                            <input
                                    type="text" class="m-wrap span8" name="phone"
                                    value="${(queryDto.phone)!}">
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="control-group span4 ">
                            <label class="help-inline text-right span4">系统准入是否通过：</label>
                            <select name="creditResult" class="m-wrap span8">
                                <option value="-1">请选择</option>
                                <option value="0">不通过</option>
                                <option value="1">通过</option>
                            </select>
                        </div>
                        <div class="control-group span4 ">
                            <label class="help-inline text-right span4">渠道来源：</label>
                            <select name="memberSource" class="m-wrap span8">
                                <option value="-1">请选择</option>
                                <option value="0">线下</option>
                                <option value="1">APP</option>
                            </select>
                        </div>
                        <div class="control-group span4 ">
                            <label class="help-inline text-right span4">创建日期：</label>
                            <div class="input-append date date-picker"
                                 data-date="${(queryDto.createTimeStart?string('yyyy-MM-dd'))!}"
                                 data-date-format="yyyy-mm-dd" data-date-viewmode="years">
                                <input name="createTimeStart" class="m-wrap span8 date-picker" size="16" type="text"
                                       data-date-format="yyyy-mm-dd"
                                       value="${(queryDto.createTimeStart?string('yyyy-MM-dd'))!}"/><span
                                    class="add-on"><i class="icon-calendar"></i></span>
                            </div>
                            <span style="margin-left:-28px">--</span>
                            <div class="input-append date date-picker"
                                 data-date="${(queryDto.createTimeEnd?string('yyyy-MM-dd'))!}"
                                 data-date-format="yyyy-mm-dd" data-date-viewmode="years">
                                <input name="createTimeEnd" class="m-wrap span8 date-picker" size="16" type="text"
                                       data-date-format="yyyy-mm-dd"
                                       value="${(queryDto.createTimeEnd?string('yyyy-MM-dd'))!}"/><span
                                    class="add-on"><i class="icon-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                    <p>
                        <button type="button" class="btn blue" onclick="search()">查询</button>
                    </p>
                </form>
            </div>

            <div class="tabbable tabbable-custom tabbable-custom-profile">
                <!-- table -->
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>渠道来源</th>
                        <th>客户</th>
                        <th>身份证号</th>
                        <th>出生日期</th>
                        <th>手机号</th>
                        <th class="hidden-480">户籍地址</th>
                        <th class="hidden-480">现住地址</th>
                        <th>系统准入通过</th>
                        <th>淘宝账号</th>
                        <th>京东账号</th>
                        <th>员工编号</th>
                        <th class="hidden-480">单位名称</th>
                        <th class="hidden-480">单位地址</th>
                        <th>创建日期</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list page.result as item>
                    <tr class="odd gradeX" id="${item.id}">
                        <td>${item_index+1 }</td>
                        <td><#if item.memberSource??>
								${(item.memberSource==0)?string('线下','APP')} </#if></td>
                        <td>${item.memberName }</td>
                        <td>${item.idCarNo! }</td>
                        <td>${(item.birthday?string('yyyy-MM-dd'))!}</td>
                        <td>${item.phone!}</td>
                        <td class="hidden-480"><span class="span1 nowrapellipsis"
                                                     title="${item.censusAddress!}">${item.censusAddress!}</span></td>
                        <td class="hidden-480"><span class="span1 nowrapellipsis"
                                                     title="${item.liveAddress!}">${item.liveAddress!}</span></td>
                        <td><#if item.creditResult??>
                            <#switch item.creditResult>
                                <#case 0>不通过<#break>
                                <#case 1>通过<#break>
                                <#default>
                            </#switch>
                        </#if></td>
                        <td><span class="span1 nowrapellipsis" title="${item.taoBao!}">${item.taoBao!}</span></td>
                        <td><span class="span1 nowrapellipsis" title="${item.jingDong!}">${item.jingDong!}</span></td>
                        <td><span class="span1 nowrapellipsis" title="${item.employeeNo!}">${item.employeeNo!}</span>
                        </td>
                        <td class="hidden-480"><span class="span1 nowrapellipsis"
                                                     title="${item.unitName!}">${item.unitName!}</span></td>
                        <td class="hidden-480"><span class="span1 nowrapellipsis"
                                                     title="${item.detailAddr!}">${item.detailAddr!}</span></td>
                        <td><#if item.createTime??>${item.createTime?date}</#if></td>
                        <td>
                            <a href="${ctx}/member/detailUI.htm?id=${item.id}" target='_blank'>查看详情</a>
                            &nbsp;&nbsp;
                            <#if !(item.idCarNo??) || item.idCarNo == "">
                                <@shiro.hasPermission name="member:edit">
                                    <a href="#show" data-toggle="modal" onclick="setMobile('${item.id}')">编辑</a>
                                </@shiro.hasPermission>
                            </#if>
                        </td>
                    </tr>
                    </#list>
                    </tbody>
                </table>
            <@p.pagination value=page />
            </div>
        </div>
    </div>
</div>
<div id="show" class="modal hide fade show" tabindex="-1" data-width="760">
    <from id="submit_form">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
                    aria-hidden="true"></button>
            <h3>编辑</h3>
        </div>
        <div class="modal-body">
            <div class="row-fluid ">
                <label class="help-inline span2 text-left control-label">渠道：</label>
                <select name="memberSource" class="m-wrap span4" id="memberSource">
                    <option value="-1">请选择</option>
                    <option value="0">线下</option>
                    <option value="1">APP</option>
                </select>
            </div>
            <div class="row-fluid ">
                <label class="help-inline span2 text-left control-label">身份证：</label>
                <input type="text" name="idNum" id="idNum" value="" class="m-wrap span9" maxlength="20"/>
                <input type="hidden" name="userId" id="userId" value="" class="m-wrap span9" maxlength="20"/>
            </div>
        </div>
        <div class="modal-footer">
            <button id="submit" type="button" class="btn btn-default" onclick="submitForm()">确定</button>
        </div>
    </from>
</div>
<#include "/sys/bottom.ftl">
<script>
    $(function () {
        $("select[name='creditResult']").val(${(queryDto.creditResult)!});
        $("select[name='memberSource']").val(${(queryDto.memberSource)!});
    })
    function search() {
        ChkUtil.form_trim($("#searchForm"));
        ChkUtil.saveCookie("queryParams", $("#searchForm").serialize(), "", "/");
        $("#searchForm").submit();
    }
    function submitForm() {
        var idNum = $("#idNum").val();
        var userId = $("#userId").val();
        var memberSource = $("#memberSource").val();
        //验证
        if (validate(idNum,memberSource)) {
            $.ajax({
                url : serverPath + "/member/updateMemberInfo.htm",
                type : "post",
                data : {
                    id:userId,
                    idCarNo:idNum,
                    memberSource:memberSource
                },
                dataType : "json",
                success : function(result) {
                    if(result.code == 0){
                        BootstrapDialog.alert(result.message,function(){
                            window.location.href=serverPath+"/member/list.htm"
                        });
                    }else{
                        BootstrapDialog.alert(result.message);
                    }
                },
                error : function() {
                    BootstrapDialog.alert("操作失败");
                }
            });
        }
    }
    function setMobile(userId) {
        $("#userId").val(userId);
    }
    function validate(sId, channel) {
        var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",
            21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",
            35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",
            46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",
            62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"}
        if (channel == "-1") {
            BootstrapDialog.alert("<span style='color:red;'>请选择渠道</span>");
            return false;
        }
        if (sId.length == 0) {
            BootstrapDialog.alert("<span style='color:red;'>请输入身份证号码</span>");
            return false;
        }
        var iSum = 0;
        if (!/^\d{17}(\d|x)$/i.test(sId)) {
            BootstrapDialog.alert("<span style='color:red;'>你输入的身份证长度或格式错误</span");
            return false;
        }
        sId = sId.replace(/x$/i, "a");
        if (aCity[parseInt(sId.substr(0, 2))] == null) {
            BootstrapDialog.alert("<span style='color:red;'>你的身份证地区非法</span>");
            return false;
        }
        sBirthday = sId.substr(6, 4) + "-" + Number(sId.substr(10, 2)) + "-" + Number(sId.substr(12, 2));
        var d = new Date(sBirthday.replace(/-/g, "/"));
        if (sBirthday != (d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate())) {
            BootstrapDialog.alert("<span style='color:red;'>身份证上的出生日期非法</span>");
            return false;
        }
        for (var i = 17; i >= 0; i--) iSum += (Math.pow(2, i) % 11) * parseInt(sId.charAt(17 - i), 11);
        if (iSum % 11 != 1) {
            BootstrapDialog.alert("<span style='color:red;'>你输入的身份证号非法</span>");
            return false;
        }
        return true;
    }
</script>