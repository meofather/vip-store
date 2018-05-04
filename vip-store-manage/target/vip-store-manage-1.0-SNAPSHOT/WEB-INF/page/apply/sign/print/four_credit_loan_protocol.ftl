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
                font-size: 14px;
                line-height: 2;
                font-family: "微软雅黑";
            }
            
            .main {
                max-width: 980px;
                margin: 0 auto;
            }
            
            .h2 {
                padding: 10px 0;
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
                padding: 0 5px;
                box-sizing: border-box;
                border: 1px solid #000;
                height: 20px!important;
            }
            
            .table div {
                padding: 0px 0px;
            }
            
            .h1 {
                padding: 20px 0;
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
            
            .c_n {
                border: 0;
            }
        </style>
    </head>

    <body>
        <div class="main">
            <div style=" padding: 20px 10px 30px 0;">

                <div style="float: right; padding-top: 5px;">合同编号：<span class="c c_n">${contractNo!''}</span></div>
            </div>
            <h1 class="h1 center" style="padding-bottom: 300px;">借 款 协 议</h1>

            <div class="center" style="padding-bottom: 550px;">
                <div>签 署 地：<span class="c c_n">${(contractModelView.signAddress)!''}</span>市</div>
                <div>签署日期:<span class="y">${(contractModelView.signYear)!''}</span>年<span class="d">${(contractModelView.signMonth)!''}</span>月<span class="d">${(contractModelView.signDay)!''}</span>日</div>
            </div>
            <div>
                <h1 class="h1 center">借款协议</h1>
            </div>
            <div style="text-align: right; padding-right: 100px;"><span style="text-align: left;" class="c c_n">编号：${contractNo!''}</span></div>

            <div style="padding: 10px 0;">
                <p>甲方（借款人、共同借款人）：${(contractModelView.borrower)!''}</p>
                <p> 身份证号码： ${(contractModelView.idCardNo)!''}</p>
                <p> 现住址：${(contractModelView.presentAddress)!''}</p>
            </div>
            <div style="padding-bottom: 10px;">
                <p>乙方（出借人）： </p>
                <p>身份证号码： </p>
                <p>地址：</p>
            </div>
            <div style="padding-bottom: 10px;">
                <p>丙方（平台方）：南京麦芽金服数据科技有限公司</p>
                <p>地址：江苏省南京市建邺区新城科技园1号楼4楼</p>
            </div>

            <h2 class="h2">第一条    重要提示</h2>
            <div>
                <span class="c"></span>网络平台（以下简称“丙方平台”）是由丙方负责运营的金融中介服务网站。甲方在丙方平台申请借款融资服务，丙方按本协议约定收取甲方相应的中介服务费用。且甲方委托丙方并授权丙方完成本协议约定之内容，丙方有权在甲方授权范围内代甲方行使相应的权利。
            </div>

            <h2 class="h2">第二条    甲方授权事宜</h2>
            <div>
                1.甲方与<span class="c"></span>已签订《信息咨询服务协议》及《授权委托书》，由<span class="c"></span>为甲方提供相关借款融资服务。甲方承诺已单方授权<span class="c"></span>代甲方在丙方平台操作融资所有事宜，即包括但不限于甲方授权<span class="c"></span>代甲方在丙方平台注册账户、上传资料、申请发标、提现出款申请、按时充值还款等事宜。

            </div>
            <div>
                2.甲方已明确知悉且单方声明，<span class="c"></span>代甲方进行上述操作的行为，均已受甲方授权， 其在丙方平台实行上述操作的，均视为甲方本人亲自行使的行为。

            </div>

            <h2 class="h2">第三条    甲方向乙方借款，借款信息如下：</h2>

            <table class="table" style="width: 97%;">

                <div style="width: 97%; margin-top: -1px;">
                    <tr>
                        <td style="width: 150px!important;">
                            <div class="center">借款详细用途</div>
                        </td>
                        <td style="width: 350px;" colspan="3">
                            <div>${(contractModelView.loanPopurse)!''}</div>
                        </td>
                        <td style="width: 56px;">
                            <div class="center">十</div>
                        </td>
                        <td style="width: 56px;">
                            <div class="center">万</div>
                        </td>
                        <td style="width: 56px;">
                            <div class="center">千</div>
                        </td>
                        <td style="width: 56px;">
                            <div class="center">百</div>
                        </td>
                        <td style="width: 56px;">
                            <div class="center">十</div>
                        </td>
                        <td style="width: 56px;">
                            <div class="center">元</div>
                        </td>
                        <td style="width: 56px;">
                            <div class="center">角</div>
                        </td>
                        <td style="width: 56px;">
                            <div class="center">分</div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;">
                            <div class="center">借款本金数额</div>
                        </td>
                        <td style="width: 350px;"  colspan="3">
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
                    <tr>
                        <td style="width: 150px;">
                            <div class="center">期还款金额</div>
                        </td>
                        <td style="width: 350px;" colspan="3">
                            <div>人民币（大写）：${(contractModelView.principalCN)!''}</div>
                        </td>
 <#if contractModelView??>
    <#if contractModelView.principalLength??>
        <#assign x = contractModelView.principalLength>
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
    <#if contractModelView.principalArray??>
        <#list contractModelView.principalArray as item>
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
                </div>


                <div style="width: 97%; margin-top: -1px;">
                    <tr>
                        <td style="width: 150px!important;">
                            <div class="center">期数</div>
                        </td>

                        <td>
                            <div style="text-align: right; ">${(contractModelView.productPeriods)!''}期</div>
                        </td>
                        <td colspan="2">
                            <div>还款日：</div>
                        </td>
                        <td colspan="8">
                            <div>每月<span class="d">${repayDay!''}</span>日17:00 前（还款日根据实际放款日进行调整）</div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1">
                            <div class="center">还款起止日期</div>
                        </td>

                        <td colspan="3">
                            <div>${contractModelView.repayDateStart?string("yyyy/MM/dd")}-${contractModelView.repayDateEnd?string("yyyy/MM/dd")}</div>
                        </td>
                        <td colspan="4">
                            <div>利率：</div>
                        </td>
                        <td colspan="4">
                            <div><span class="d">${(contractModelView.annualInteresRate)!''}%</span>/年</div>
                        </td>
                    </tr>

                </div>

                <div style="width: 97%; margin-top: -1px;">
                    <tr>
                        <td style="width: 150px;" rowspan="2">
                            <div class="center">甲方专用账户</div>
                        </td>

                        <td style="width: 75px;">
                            <div class="center">户名</div>
                        </td>
                        <td style="width: 100px;">
                            <div>${(contractModelView.borrower)!''}</div>
                        </td>
                        <td style="width: 75px;">
                            <div class="center">账号</div>
                        </td>
                        <td colspan="8">
                            <div>${(contractModelView.bankNo)!''}</div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 75px;">
                            <div class="center">开户行</div>
                        </td>
                        <td style="width: 723px;" colspan="10">
                            <div>${(contractModelView.bankName)!''}</div>
                        </td>
                    </tr>

                </div>
            </table>

            <h2 class="h2"></h2>

            <div class="tex">
                <h2 class="h2" style="padding: 0 2em 0 0; display: inline-block;">第四条</h2>共同借款人自愿对借款人所应支付的借款本金利息、服务费、罚息、逾期违约金及可能产生的相关费用等承担连带清偿责任，乙方有权向借款人、共同借款人任意一方追索。</div>

            <h2 class="h2">第五条   还款方式</h2>
            <div class="tex">1、甲方必须按照《还款事项提醒函》约定按时足额偿还乙方借款本息。</div>

            <div class="tex">2、甲方须在每月还款日17：00前将当期应还金额足额充值至约定的存管银行专用账户。</div>
            <div class="tex">3、还款日的具体时间以本协议第三条约定的日期为准，如当月无该日期，则以当月的最后一日为还款日，遇法定节假日、公休日不顺延。</div>
            <div class="tex">4、甲方若提前还款，需至少提前三个工作日向乙方提出书面申请，双方协商一致后，由甲方一次性将全部剩余借款本息（包括罚息、违约金等）存入本协议第一条规定的甲方的专用账户，直至乙方扣划成功，视为甲方还清全部借款。</div>
            <div class="tex">5、借款合同生效后，乙方授权丙方向存管银行发布指令，由存管银行将出借款支付至甲方在存管银行开立的二类账户或者借款人银行账户。</div>

            <div class="tex">6、甲方自愿采用如下还款支付方式：甲方授权丙方向存管银行发布指令，由存管银行从甲方在存管银行开立的二类账户划转当期应还款项给乙方（或乙方的委托收款方）。</div>
            <div class="tex">7、甲方授权丙方向存管银行发布指令，由存管银行从甲方在存管银行开立的二类账户划转平台服务费（《 <span class="c"></span>协议》中约定由甲方支付给丙方）给丙方。</div>

            <h2 class="h2">第六条  各方权力和义务</h2>

            <div class="tex" style="padding-left: 2rem; text-indent: -2em;">6.1 甲方权利义务：</div>
            <div class="tex" style="padding-left: 2rem; text-indent: -2em;">6.1.1甲方承诺向丙方提供的信息及时、真实、有效。</div>
            <div class="tex" style="padding-left: 2rem; text-indent: -2em;">6.1.2 甲方同意以网络页面点击确认或其他方式（包括但不限于签字或签字盖章确认等方式）签订本协议，并不以此为由拒绝履行本协议项下的义务，即便在签订时本协议并没有乙方的信息、借款基本信息、签订日期信息等。甲方同意以上述签订方式签订本协议后即视为不可撤销及变更地授权丙方平台根据最终撮合结果自主生成前述信息，且未经丙方及乙方的同意，甲方不得否认本协议项下债权债务关系或以任何方式撤回、撤销本协议。</div>
            <div class="tex" style="padding-bottom: 20px;padding-left: 2rem; text-indent: -2em;">6.1.3甲方理解并同意，授权丙方在本协议下（包括但不限于：后续风险管理或提供的综合服务等），有权采集、处理、传递和应用甲方各项资料，并同意丙方可以通过与其合作的第三方征信机构查询甲方各类信息，包括但不限于信用报告中的身份、职业和居住地址等个人基本信息，以及甲方在个人贷款、各类信用卡和对外担保等信用及商业活动中形成的交易记录、个人信贷交易信息及公共费用缴纳、违法违规等信息。并授权丙方将甲方的个人基本信息、个人信贷信息，以及其他相关信用信息报送给丙方合作的第三方征信机构，第三方征信机构可将上述信息向其他机构传递、提供、使用。</div>

            <div class="tex" style="padding-left: 2rem; text-indent: -2em;">6.2乙方权利义务：</div>
            <div class="tex" style="padding-left: 2rem; text-indent: -2em;">6.2.1 乙方承诺向丙方提供的信息及时、真实、有效，用于出借的资金来源合法。</div>
            <div class="tex" style="padding-bottom: 20px;padding-left: 2rem; text-indent: -2em;">6.2.2乙方同意以网络页面点击确认或其他方式（包括但不限于签字或签字盖章确认等方式）签订本协议，并不以此为由拒绝履行本协议项下的义务，即便在签订时本协议并没有甲方的信息、借款基本信息、签订日期信息等。乙方同意以前述方式签订本协议后即视为不可撤销及变更地授权丙方平台根据最终撮合结果自主生成前述信息，且未经丙方及甲方的同意，乙方不得否认协议项下债权债务关系或以任何方式撤回、撤销本协议。</div>

            <div class="tex" style="padding-left: 2rem; text-indent: -2em;">6.3 丙方权利义务：</div>
            <div class="tex" style="padding-left: 2rem; text-indent: -2em;">6.3.1收集甲乙双方的信息，并根据履行本合同需要向乙方如实披露甲方信息。</div>
            <div class="tex" style="padding-left: 2rem; text-indent: -2em;">6.3.2妥善保管所收集的合同各方的信息，履行保密义务。</div>
            <div class="tex" style="padding-left: 2rem; text-indent: -2em;">6.3.3丙方有权根据甲方提供的各项信息及丙方独立获得的信息评定甲方的个人信用等级，并根据甲方个人信息评定结果，决定是否审核通过并将甲方的借款需求向乙方进行推荐。</div>
            <div class="tex" style="padding-left: 2rem; text-indent: -2em;">6.3.4经合同各方授权代甲方和乙方向存管银行发布指令进行资金划转的相关操作。</div>
            <div class="tex" style="padding-left: 2rem; text-indent: -2em;">6.3.5甲方授权丙方在甲方逾期时可根据本合同约定建立逾期客户黑名单。</div>
            <div class="tex" style="padding-left: 2rem; text-indent: -2em;">6.3.6 代乙方收取罚息。</div>
            <div class="tex" style="padding-left: 2rem; text-indent: -2em;">6.3.7丙方因运营管理需要有权随时对丙方公示的规则进行修改，但本合同已有约定的内容仍优先适用本合同约定。</div>
            <div class="tex" style="padding-left: 2rem; text-indent: -2em;">6.3.8丙方应建立客服热线及时解答用户提出的咨询、意见。</div>

            <h2 class="h2">第七条    违约条款</h2>
            <div class="tex">1、甲方未按时足额还款在十个自然日以内的,每日按应还未还本金金额的0.5%收取罚息。</div>
            <div class="tex">2、甲方未按时足额还款超过十个自然日的,每日按应还未还本金金额的1%收取罚息，且甲方应向乙方支付借款全部本金5%的违约金。</div>
            <div class="tex">3、上述第七条第1款、第2款合并执行。</div>
            <div class="tex">4、若甲方偿还金额不足，偿还顺序依次为罚息、逾期违约金、应还利息、应还本金。</div>
            <div class="tex">5、如果甲方擅自改变本协议第一条所述借款用途或严重违反还款义务（逾期达到 15天及以上），丙方有权代表乙方提出提前终止本协议，甲方须在丙方提出终止本协议要求的三日内一次性支付余下的所有本金、利息、罚息、逾期违约金。</div>
            <div class="tex">6、甲方提供虚假资料或者故意隐瞒重要事实的，丙方有权代表乙方单方解除本协议，甲方需在丙方通知解除本协议后三日内一次性支付余下的所有款项，包括但不限于本金、利息、罚息、违约金及其他费用；构成犯罪的，丙方将有权向相关国家机关报案，追究其刑事责任。</div>
            <div class="tex">7、甲方同意，丙方有权视甲方违约情况将甲方的相关信息在媒体披露且乙方因甲方未按约定还款而产生的调查催收费用、律师费、诉讼费、保全费等所有实现债权的费用由甲方承担。</div>

            <h2 class="h2">第八条    变更通知</h2>

            <div class="tex" style="text-indent: 2em;">本协议签订之日起至借款全部清偿之日止，甲方有义务在下列信息变更三日内通知乙方（包含但不限于）：</div>
            <div class="tex" style="text-indent: 2em;">借款人本人或家庭联系人或紧急联系人的工作单位、居住地址、住所电话、手机号码、电子邮箱等联系方式，共同借款人的企业名称、办公地址、法人代表等信息。若因甲方不及时提供上述变更信息而带来的乙方的调查及诉讼费用将由甲方承担。</div>
            <div class="tex" style="text-indent: 2em;"><span style="padding-bottom: 3px; border-bottom: 1px solid #000;">若双方产生争议,合同载明的各方通讯地址、电子邮箱可作为法院送达诉讼文书的地址,因甲方提供地址有误或甲方未及时告知变更后的新地址,导致诉讼文书被退回的,邮寄递送的诉讼文书被退回之日即视为送达成功之日。</span></div>

            <h2 class="h2"></h2>

            <div class="tex">
                <h2 class="h2" style="padding: 0 2em 0 0; display: inline-block;">第九条</h2>乙方可以根据自己的意愿转让其对甲方的债权。债权转让后，甲方需对债权受让人继续履行本协议下其对乙方的还款义务，不得以未接到债权转让通知为由拒绝履行还款义务。</div>

            <h2 class="h2">第十条   信息披露</h2>
            <div class="tex">1、丙方有义务根据有关法律要求向司法机关和政府部门提供用户的个人信息。</div>
            <div class="tex">2、为了保护投资人的合法权益或防止严重侵害他人合法权益或为了公共利益的需求，丙方将善意地披露甲方的个人信息。</div>
            <div class="tex">3、根据甲方与线上投资人签署的《借款合同》相关约定，甲方未按时足额还款的，甲方同意丙方第一时间在丙方平台披露甲方的个人信息。</div>
            <div class="tex">4、经国家生效法律文书或行政处罚决定确认甲方存在违法行为，或者乙方有足够的事实依据可以认定甲方存在违法或违反本协议的行为，甲方同意并授权丙方在丙方平台公布甲方的违法、违约行为，并将该内容记入所有与甲方相关的信用资料和档案。</div>

            <h2 class="h2">第十一条    其他</h2>
            <div class="tex">1、本协议及其附件的修改、补充均须以书面形式做出，本协议的补充协议及其附件与本协议具有同等的法律效力。</div>
            <div class="tex">2、甲乙丙三方确认，本协议的签署，生效和履行以不违反中国法律法规为前提。如果本协议中任一条或多条违反适用的法律法规，则该条款将被视为无效，但该无效条款并不影响本协议其它条款的效力。</div>
            <div class="tex">3、如果甲乙丙三方在本协议条款履行中发生任何争议，应协商解决，协商不成，则需提交<span class="c"></span>人民法院提起诉讼。</div>
            <div class="tex">4、本协议一式叄份，于甲乙丙三方签字盖章后生效，甲乙丙三方各保留一份。</div>
            <h2 class="h2">第十二条　  特别条款</h2>
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

            <div class="tex">丙方（平台方）：</div>
            <div class="tex">日期：</div>
            <div class="tex">&nbsp;</div>
            <div class="tex">&nbsp;</div>
        </div>
    </body>

</html>