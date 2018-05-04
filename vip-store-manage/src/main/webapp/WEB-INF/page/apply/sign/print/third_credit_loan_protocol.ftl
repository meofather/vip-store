<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
        <!-- 是否启用 WebAPP 全屏模式 -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <!-- 屏蔽数字自动识别为电话号码 -->
        <meta name="format-detection" content="telephone=no">
        <meta content="width=device-width,initial-scale=1,shrink-to-fit=no,user-scalable=no" name="viewport" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta content="telephone=no" name="format-detection" />
        <meta name="full-screen" content="yes" />
        <meta name="browsermode" content="application" />
        <meta name="x5-orientation" content="portrait" />
        <meta name="x5-fullscreen" content="true" />
        <meta name="x5-page-mode" content="app" />
        <title>借 款 协 议</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                font-style: normal;
                font-weight: normal;
            }
            
            table {
                border-collapse: collapse;
                border-spacing: 0;
                font-size: inherit;
                font: 100%;
            }
            
            body {
                font-size: 16px;
                line-height: 2;
                font-family: "微软雅黑";
            }
            
            .main {
                max-width: 980px;
                margin: 0 auto;
            }
            
            .h2 {
                padding: 20px 0;
                font-size: 20px;
                font-weight: bold;
            }
            
            .h3 {
                font-size: 18px;
                font-weight: bold;
            }
            
            .center {
                text-align: center;
            }
            
            .table {
                border: 1px solid #000;
            }
            
            .table td {
                padding: 2px 5px;
                border: 1px solid #000;
            }
            
            .table div {
                padding: 10px 5px;
            }
            
            .h1 {
                padding: 30px 0;
            }
            
            .p10 {
                padding: 0 10px;
            }
            
            .y {
                display: inline-block;
                min-width: 60px;
            }
            
            .d {
                display: inline-block;
                min-width: 30px;
            }
            
            .c {
                display: inline-block;
                min-width: 143px;
                border-bottom: 1px solid #000;
            }
        </style>
    </head>

    <body>
        <div class="main">
            <div style=" padding: 20px 10px 30px 0;">
                <img src="${cdnPath}/common/bootstrap/media/image/image001.png" height="30px">
                <div style="float: right; padding-top: 5px;">合同编号：${contractNo!''}</div>
            </div>
            <h1 class="h1 center" style="padding-bottom: 300px;">借 款 协 议</h1>

            <div class="center" style="padding-bottom: 550px;">
                <div>签 署 地：<span class="c">${(contractModelView.signAddress)!''}</span>市</div>
                <div>签署日期:<span class="y">${(contractModelView.signYear)!''}</span>年<span class="d">${(contractModelView.signMonth)!''}</span>月<span class="d">${(contractModelView.signDay)!''}</span>日</div>
            </div>
<div>
    <h1 class="h1 center" >借款协议<span style=" padding-left: 40px;">编号：${contractNo!''}</span></h1>        
</div>
            

            <table class="table" style="width: 97%;">
                <tr>
                    <td style="width:50%;">
                        <div>
                            <p>甲方（借款人、共同借款人）：${(contractModelView.borrower)!''}</p>
                            <p>身份证号码：${(contractModelView.idCardNo)!''}</p>

                            <p>现住址：${(contractModelView.presentAddress)!''}</p>
                        </div>
                    </td>
                    <td>
                        <div>
                            <p>乙方（出借人）：张欣慰</p>
                            <p>身份证号码：340323199201300051</p>
                            <p>地址：江苏省南京市建邺区河西大街65号瑞泰大厦10楼
                            </p>

                        </div>
                    </td>
                </tr>
            </table>

            <h2 class="h2">第一条    甲方向乙方借款，借款信息如下：</h2>

            <table class="table" style="width: 97%;">
                <tr>
                    <td style="width: 150px;">
                        <div class="center">借款详细用途</div>
                    </td>
                    <td style="width: 350px;">
                        <div>${(contractModelView.loanPopurse)!''}</div>
                    </td>
                    <td>
                        <div class="center">十</div>
                    </td>
                    <td>
                        <div class="center">万</div>
                    </td>
                    <td>
                        <div class="center">千</div>
                    </td>
                    <td>
                        <div class="center">百</div>
                    </td>
                    <td>
                        <div class="center">十</div>
                    </td>
                    <td>
                        <div class="center">元</div>
                    </td>
                    <td>
                        <div class="center">角</div>
                    </td>
                    <td>
                        <div class="center">分</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="center">借款本金数额</div>
                    </td>
                    <td>
                        <div>人民币（大写）：${(contractModelView.contractCN)!''}</div>
                    </td>
 <#if contractModelView??>
    <#if contractModelView.repayMoneyLength??>
        <#assign x = contractModelView.repayMoneyLength>
        <#if (x>0)>
             <#list 1..x as item>
                <td width=25 style='width:18.85pt;border-top:none;border-left:none;
                  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
                  white;padding:0cm 0cm 0cm 0cm;height:19.85pt'>
                  <p class=MsoNormal style='margin-left:5.4pt;line-height:12.8pt;text-autospace:
                  none'><span lang=EN-US style='font-family:宋体;color:black'></span></p>
                  </td>
            </#list>
        </#if>
    </#if>
    <#if contractModelView.repayMoneyArray??>
        <#list contractModelView.repayMoneyArray as item>
            <td width=25 style='width:18.85pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:
              white;padding:0cm 0cm 0cm 0cm;height:19.85pt'>
              <p class=MsoNormal style='margin-left:5.4pt;line-height:12.8pt;text-autospace:
              none'><span lang=EN-US style='font-family:宋体;color:black'>${item!''}</span></p>
              </td>
        </#list>
    </#if>
  </#if>
                </tr>
            </table>
            <table class="table" style="width: 97%; margin-top: -1px;">
                <tr>
                    <td style="width: 150px;">
                        <div class="center">期数</div>
                    </td>

                    <td style="width: 150px;">
                        <div style="text-align: right; ">${(contractModelView.productPeriods)!''}期</div>
                    </td>
                    <td>
                        <div>还款日：</div>
                    </td>
                    <td colspan="2">
                        <div>每月 ${repayDay!''}日（17:00 前，节假日不顺延）</div>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px;">
                        <div class="center">还款起止日期</div>
                    </td>

                    <td colspan="2" style="width: 300px;">
                        <div>${contractModelView.repayDateStart?string("yyyy/MM/dd")}-${contractModelView.repayDateEnd?string("yyyy/MM/dd")}</div>
                    </td>
                    <td>
                        <div>利率：</div>
                    </td>
                    <td>
                        <div>${(contractModelView.annualInteresRate)!''}%/年</div>
                    </td>
                </tr>

            </table>

            <table class="table" style="width: 97%; margin-top: -1px;">
                <tr>
                    <td style="width: 150px;" rowspan="2">
                        <div class="center">甲方专用账户</div>
                    </td>

                    <td style="width: 90px;">
                        <div class="center">户名</div>
                    </td>
                    <td style="width: 130px;">
                        <div>${(contractModelView.borrower)!''}</div>
                    </td>
                    <td style="width: 90px;">
                        <div class="center">账号</div>
                    </td>
                    <td>
                        <div>${(contractModelView.bankNo)!''}</div>
                    </td>
                </tr>
                <tr>
                    <td style="width: 90px;">
                        <div class="center">开户行</div>
                    </td>
                    <td colspan="3">
                        <div>${(contractModelView.bankName)!''}</div>
                    </td>
                </tr>
            </table>

            <h2 class="h2">第二条  乙方有权从下列两种方式二选一向甲方支付借款：</h2>
            <div class="tex">① 由乙方委托南京久邦投资咨询有限公司通过第三方支付服务有限公司将款项汇入到本协议第一条约定的甲方专用账户中； </div>
            <div class="tex">② 乙方则通过网银汇款方式将借款汇入到本协议第一条甲方专用账号中。 若由于借款人的原因导致其账户无法收到借款的，由借款人承担全部责任。
            </div>

            <h2 class="h2">第三条</h2>

            <div class="tex">共同借款人自愿对借款人所应支付的借款本金利息、服务费、罚息、逾期违约金及可能产生的相关费用等承担连带清偿责任，乙方有权向借款人、共同借款人任意一方追索。</div>

            <h2 class="h2">第四条   还款方式</h2>
            <div class="tex">1、甲方必须按照《还款事项提醒函》约定按时足额偿还乙方借款本息。</div>

            <div class="tex">2、甲方须在每月还款日17：00前将当期应还金额足额存入本协议第一条所列甲方专用账户。</div>
            <div class="tex">3、甲方同意乙方委托合作机构每月从甲方专用账户中划扣当期应还金额，合作机构成功扣划当期全部应还金额即视为甲方完成当期还款，或甲方采用乙方提供的其他方式进行还款。</div>
            <div class="tex">4、还款日的具体时间以本协议第一条约定的日期为准，遇法定节假日、公休日不顺延。</div>
            <div class="tex">5、甲方若提前还款，需至少提前三个工作日向乙方提出书面申请，双方协商一致后，由甲方一次性将全部剩余借款本息（包括罚息、违约金等）存入本协议第一条规定的甲方的专用账户，直至乙方扣划成功，视为甲方还清全部借款。</div>
            <h2 class="h2">第五条    违约条款</h2>
            <div class="tex">1、甲方未按时足额还款在十个自然日以内的,每日按应还未还本金金额的 0.5%收取罚息。</div>
            <div class="tex">2、甲方未按时足额还款超过十个自然日的,每日按应还未还本金金额的1%收取罚息，且甲方应向乙方支付借款全部本金5%的违约金。</div>
            <div class="tex">3、上述第六条第1款、第2款合并执行。</div>
            <div class="tex">4、若甲方偿还金额不足，偿还顺序依次为罚息、逾期违约金、应还利息、应还本金。</div>

            <div class="tex">5、如果甲方擅自改变本协议第一条所述借款用途或严重违反还款义务（逾期达到 15天及以上），乙方有权提前终止本协议，甲方须在乙方提出终止本协议要求的三日内一次性支付余下的所有本金、利息、罚息、逾期违约金。</div>
            <div class="tex">6、甲方提供虚假资料或者故意隐瞒重要事实的，乙方有权单方解除本协议，甲方需在乙方通知解除本协议后三日内一次性支付余下的所有款项，包括但不限于本金、利息、罚息、违约金及其他费用；构成犯罪的，乙方将有权向相关国家机关报案，追究其刑事责任。</div>

            <div class="tex">7、甲方同意，乙方有权视甲方违约情况将甲方的相关信息在媒体披露且乙方因甲方未按约定还款而产生的调查催收费用、律师费、诉讼费、保全费等所有实现债权的费用由甲方承担。</div>
            <div class="tex">8、乙方要求提前还款则需要支付借款金额的3%作提前还款的违约金。</div>
            <h2 class="h2">第六条    变更通知</h2>
            <div class="tex" style=" text-indent: 2em;">本协议签订之日起至借款全部清偿之日止，甲方有义务在下列信息变更三日内通知乙方（包含但不限于）： </div>

            <div class="tex" style=" text-indent: 2em;">借款人本人或家庭联系人或紧急联系人的工作单位、居住地址、住所电话、手机号码、电子邮箱等联系方式，共同借款人的企业名称、办公地址、法人代表等信息。若因甲方不及时提供上述变更信息而带来的乙方的调查及诉讼费用将由甲方承担。</div>
            <div class="tex" style=" text-indent: 2em;"><span style="border-bottom: 1px solid #000; font-weight: bold; ">若双方产生争议,合同载明的各方通讯地址、电子邮箱可作为法院送达诉讼文书的地址,因甲方提供地址有误或甲方未及时告知变更后的新地址,导致诉讼文书被退回的,邮寄递送的诉讼文书被退回之日即视为送达成功之日.</span></div>
            <h2 class="h2">第七条</h2>
            <div class="tex">乙方可以根据自己的意愿转让其对甲方的债权。债权转让后，甲方需对债权受让人继续履行本协议下其对乙方的还款义务，不得以未接到债权转让通知为由拒绝履行还款义务。</div>

            <h2 class="h2">第八条    其他</h2>

            <div class="tex">1、本协议及其附件的修改、补充均须以书面形式做出，本协议的补充协议及其附件与本协议具有同等的法律效力。</div>
            <div class="tex">2、甲乙双方确认，本协议的签署，生效和履行以不违反中国法律法规为前提。如果本协议中任一条或多条违反适用的法律法规，则该条款将被视为无效，但该无效条款并不影响本协议其它条款的效力。</div>
            <div class="tex">3、如果甲乙双方在本协议条款履行中发生任何争议，应协商解决，协商不成，则需提交&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;人民法院提起诉讼。</div>
            <div class="tex">4、本协议一式叄份，于甲乙双方签字盖章后生效，甲方保留壹份，乙方保留贰份。</div>

            <h2 class="h2">第九条　  特别条款</h2>

            <div class="tex">1、甲方保证，为本协议项下借款之目的所提供的所有资料与印鉴，包括但不限于个人信息、身份证、个人名章、公司印章等，均真实、合法、有效。若甲方违反本承诺，乙方有权立即解除本协议，要求甲方支付借款全部本金5%的违约金，并赔偿乙方因此遭受的所有损失。若甲方违反本承诺的情节严重，触犯了中华人民共和国刑法，乙方可向公安机关报案，追究甲方的刑事责任。</div>
            <div class="tex">2、若甲方一方发生不能预见、不能避免和不能克服的客观情况，包括但不限于地震、台风、水灾、火灾、战争、重大法律变更或政策调整、死亡或解散等，导致本协议无法继续履行，甲方（如作为自然人的甲方死亡，则为其财产的继承人）应立即通知乙方，乙方有权解除本协议并要求甲方或甲方权利义务的承继人在不可抗力发生后的5个工作日内履行完毕本协议项下义务，包括但不限于偿还本协议项下尚未偿还的本金及利息。</div>

            <div class="tex">&nbsp;</div>
            <div class="tex">&nbsp;</div>
            <div class="tex">&nbsp;</div>
            <div class="tex">&nbsp;</div>
            <div class="tex">&nbsp;</div>
            <div class="tex">&nbsp;</div>
            <div class="tex center">（以下无正文）</div>

            <div class="tex">协议各方签字盖章</div>
            <div class="tex">&nbsp;</div>
            <div class="tex">&nbsp;</div>
            <div class="tex">甲方（借款人、共同借款人）签字、签章：</div>
            <div class="tex">日期：</div>
            <div class="tex">&nbsp;</div>
            <div class="tex">&nbsp;</div>

            <div class="tex">乙方（出借人）签章：</div>
            <div class="tex">日期：</div>
            <div class="tex">&nbsp;</div>
            <div class="tex">&nbsp;</div>
        </div>
    </body>

</html>