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
        <title>信息咨询服务协议</title>
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

            <h1 class="h1 center">信息咨询服务协议</h1>

            <div class="tex">合同编号： <span style="display: inline-block; min-width: 400px; border-bottom: 1px solid #000;">${contractNo!''}</span></div>
            <div class="tex">产品类型：<span style="display: inline-block; min-width: 400px; border-bottom: 1px solid #000;">${(contractModelView.productName)!''}</span> </div>

            <div class="tex">资金用途：<span style="display: inline-block; min-width: 400px; border-bottom: 1px solid #000;">${(contractModelView.loanPopurse)!''}</span></div>

            <div class="tex">甲方： <span style="display: inline-block; min-width: 400px; border-bottom: 1px solid #000;"></span></div>
            <div class="tex">地址： <span style="display: inline-block; min-width: 400px; border-bottom: 1px solid #000;"></span></div>
            <div class="tex">乙方（借款人）： <span style="display: inline-block; min-width: 400px; border-bottom: 1px solid #000;">${(contractModelView.borrower)!''}</span></div>
            <div class="tex">身份证号码：<span style="display: inline-block; min-width: 400px; border-bottom: 1px solid #000;">${(contractModelView.idCardNo)!''}</span> </div>

            <h2 class="h2">鉴于：</h2>
            <div class="tex">1、乙方为具有借款需求，且具有完全民事权利/行为能力的自然人。</div>

            <div class="tex">2、甲方为从事借款咨询服务的专业公司，拥有专业的小额借款服务技术、管理服务平台及卓越的行业信誉，有能力为乙方提供专业及高效的借款咨询服务。</div>
            <div class="tex">3、乙方愿意接受甲方提供的借款咨询服务，由甲方协助乙方与合法的出借人及其他相关方达成协议并完成借贷交易，并由甲方提供与《借款合同》履行有关的其他服务，甲方愿意向乙方提供该等服务。</div>
            <div class="tex">为明确双方权利、义务，根据《中华人民共和国合同法》和有关法律法规，甲、乙双方经平等协商，签订本合同，以兹共同遵守。</div>
            <h2 class="h2">第一条  服务事项</h2>
            <div class="tex">甲方向乙方提供的服务主要包括以下内容：</div>
            <div class="tex">1.乙方拟借款人民币（大写）<span style="display: inline-block; min-width: 100px; border-bottom: 1px solid #000;">${(contractModelView.contractAmountCN)!''}</span> 元整，（小写）：<span style="display: inline-block; min-width: 100px; border-bottom: 1px solid #000;">${(contractModelView.contractAmount)!''}</span> 元（下称“借款本金”），期限为<span style="display: inline-block; min-width: 50px; border-bottom: 1px solid #000;">${(contractModelView.productPeriods)!''}</span> 个月，借款起始日为出借人将借款金额划离出借人账户之日。乙方的借款用途 <span style="display: inline-block; min-width: 120px; border-bottom: 1px solid #000;">${(contractModelView.loanPopurse)!''}</span>，乙方保证借款用途符合国家有关法律法规的要求。甲方同意为乙方达成前述借款需求提供协助。</div>
            <div class="tex">2.乙方知晓并理解，甲方提供的协助在任何情况下均不得理解为一定能协助乙方达成前述借款需求的业务。若乙方无法从出借人取得前述借款款项，甲方仅需及时通知乙方，乙方不得以已签订本合同为由要求甲方出借资金或承担法律责任。</div>
            <div class="tex">3.基于乙方的借款需求，为乙方提供借款前咨询，包括解答借款的相关问题、对乙方是否满足借款条件进行初步审查，指导及协助乙方填写申请材料、完成借款申请等。</div>

            <div class="tex">4.协助乙方完成借款申请资料的收集和准备，向乙方收集身份证复印件、银行账目往来流水等贷款申请资料及信息，并对乙方资质及身份进行审查核实，为乙方现场解答借款相关问题。</div>
            <div class="tex">5.根据乙方申请资料的准备情况，对乙方借款资质、资信状况及偿债能力的综合评估，对乙方是否能满足出借人出借资金的条件进行审查，根据审查结果为乙方的借款需求向出借人进行推荐并递交申请材料，将出借人放款与否的审查结果及时向乙方进行反馈，根据乙方授权协助或代表乙方签署包括但不限于《借款合同》等法律文件。</div>

            <h2 class="h2">第二条  信息咨询服务费支付方式</h2>
            <div class="tex">1.乙方知晓并同意，为达成借款需求乙方需向出借人和甲方支付借款费用如下：</div>
            <div class="tex">（1）基于出借人为乙方提供借款，乙方同意按与出借人约定的年化利率<span style="display: inline-block; min-width: 100px; border-bottom: 1px solid #000;"></span>支付利息。计息日自借款出借之日起，至借款全部被清偿之日止，不足一个月的按一个月计算。按借款金额和期限计算，由乙方在每个还款日将当期应还款金额支付到甲方银行账户，再由甲方支付给出借人；</div>
            <div class="tex">（2）基于甲方为乙方提供本合同项下约定服务，乙方同意向甲方支付信息咨询服务费（人民币）大写 <span style="display: inline-block; min-width: 100px; border-bottom: 1px solid #000;"></span>元，小写<span style="display: inline-block; min-width: 100px; border-bottom: 1px solid #000;"></span> 元，信息服务费用应在借款出借之日由乙方支付给甲方。</div>
            <div class="tex">2.乙方知晓甲方已得到出借人的有效授权代为向乙方收取出借人各期的应收金额，乙方同意由甲方代为收取。甲方收取后，代乙方支付给出借人。</div>

            <h2 class="h2">第三条  出借人借款</h2>

            <div class="tex">乙方同意在收到出借人发放的借款时，第一时间将乙方应在借款起始日支付给甲方的信息咨询服务费支付给甲方。</div>

            <h2 class="h2">第四条  借款人还款</h2>

            <div class="tex">1.还款日及截止时间</div>
            <div class="tex">（1）乙方应在借款出借日的次月起开始按月偿还本金、利息及相关费用，每一个月为一个还款期，共分<span style="display: inline-block; min-width: 50px; border-bottom: 1px solid #000;">${(contractModelView.productPeriods)!''}</span> 期偿还。还款日为借款出借日相对应日，若还款当月无借款相对应之日的，则以该月最后一个公历日作为该月之还款日；若还款日为法定节假日或公休日，还款日期不顺延，且乙方应配合在假期前一天进行还款；</div>
            <div class="tex">（2）甲方可于出借人出借款项后通知乙方借款出借日及还款日；</div>
            <div class="tex">（3）乙方应在每期还款日的18点前足额偿还当期应还金额；</div>
            <div class="tex">（4）乙方实际的还款日期按乙方资金到达甲方银行账户的日期计算。</div>
            <div class="tex">2.还款金额</div>
            <div class="tex">（1）乙方每期应还金额=当期本金+当期借款费用+代扣手续费（如有）+上门费（如有）+代偿费用风险管理费（如有）+滞纳金（如有）-信息咨询服务费退费（如有）+提前结清费用（如有），乙方应按时、足额向甲方支付每期应还款金额；</div>
            <div class="tex">（2）乙方每期应还款金额详见本合同附件《还款事项提醒函》中的“还款计划表”。</div>
            <div class="tex">3.还款方式</div>
            <div class="tex">（1）乙方授权甲方（详见《授权委托书》）从乙方银行账户中划扣各期应还款总额；</div>
            <div class="tex">（2）乙方应保证还款当日上述乙方银行账户内资金充足直至甲方扣款成功，如因乙方原因导致甲方未能在还款日足额扣款，包括但不限于乙方账户余额不足、乙方办理该账户挂失、销户、银行止付等情况，乙方需支付每期20元的代扣手续费；</div>
            <div class="tex">（3）乙方若无法通过委托扣款方式支付每期应还款额，经甲方同意，乙方可以通过转账方式还款至本合同约定的甲方银行账户。</div>
            <div class="tex">4.还款分配顺序</div>
            <div class="tex">乙方同意其实际还款金额按以下顺序分配：先分配时间在前的应还款项，再分配时间在后的应还款项；分配顺序依次为：利息、代扣手续费（如有）、本金。</div>
            <div class="tex">5.借款逾期</div>
            <div class="tex">（1）乙方发生下列情形之一时，视为乙方借款逾期：</div>
            <div class="tex">A.于还款日当日18点时，未支付或未足额支付当期应还金额；</div>
            <div class="tex">B.于本合同或借款到期日，或乙方依本合同之规定视为全部借款提前到期时，未支付或未足额支付当期应还金额。</div>
            <div class="tex">（2）乙方发生借款逾期时，应优先通过委托甲方从乙方银行账户划扣应还款总额的方式还款；</div>
            <div class="tex">（3）借款逾期期间为：逾期发生日起至清偿全部应还款项日止。</div>

            <h2 class="h2">第五条  双方的权利与义务</h2>
            <div class="tex">1.甲方的权利与义务</div>
            <div class="tex">（1）甲方应尽力协助乙方与合法的出借人及其他相关方达成协议并完成借款交易；</div>
            <div class="tex">（2）经甲方协助，乙方成功从合法的出借人处取得借款的，乙方、出借人及相关合作方将签订《借款合同》；</div>
            <div class="tex">（3）乙方同意，甲方有权使用、核实、处理、保留乙方基于本合同所提供的相关资料；</div>
            <div class="tex">（4）甲方有权按照本合同及《借款合同》的约定向乙方收取乙方全部应还款项；</div>
            <div class="tex">（5）乙方借款成功后，如再发生向第三方借款或为第三方提供担保的情形，应在3个工作日内书面告知甲方，甲方有权终止本合同并要求乙方向出借人提前结清应还款项。本条款不受第四条第6款第（1）点的限制；</div>
            <div class="tex">（6）若乙方未按时足额支付每期应还款金额，甲方有权自行催收或委托第三方进行催收，催收方式为采取法律所允许的所有措施（包括但不限于信件、短信、电话、上门、诉讼等方式）向乙方进行催收。因催收乙方逾期借款所产生的费用由乙方承担。</div>
            <div class="tex">2.乙方的权利与义务</div>
            <div class="tex">（1）乙方保证按照借款申请时的用途使用资金，未经甲方书面同意，不得擅自改变借款用途；</div>
            <div class="tex">（2）乙方应按照甲方的要求提供包括但不限于个人信息、工作情况、收入情况、家庭情况、信用报告、负债情况、历史偿债情况等相关资料，并保证这些资料的真实、完整和有效。否则，应当向甲方承担本合同约定的违约责任，并赔偿因此对甲方造成的损失；</div>
            <div class="tex">（3）乙方承诺在本合同终止前，如乙方发生基于本合同所提供的相关资料和信息的变更，乙方将在资料或信息发生变更之日起三日内书面通知甲方，在乙方通知甲方及办理完成变更手续前，因此产生的一切后果由乙方承担，造成甲方损失的，乙方应承担赔偿责任；</div>
            <div class="tex">（4）就本合同中的相关各方为乙方提供本合同项下的约定服务及借款本金，乙方同意向甲方及相关各方支付服务费用及按期归还本息，并按照本合同约定的标准及方式支付；</div>
            <div class="tex">（5）乙方已知晓甲方已得到出借人的有效授权，有权对乙方提出的提前结清申请进行审批，乙方承诺服从并积极配合甲方的审批结果；</div>
            <div class="tex">（6）乙方应对甲方提供的有关商业信息、资料保密。</div>

            <h2 class="h2">第六条  违约责任</h2>

            <div class="tex">1.乙方未履行或未充分履行本协议及《借款合同》项下的各项义务时构成违约。</div>
            <div class="tex">2.乙方违约时，甲方有权将乙方的信息进行公开披露，披露途径包括但不限于媒体、公安机关、法院、其他司法机关或征信系统，且甲方无需对此承担任何责任。</div>
            <div class="tex">3.在本合同终止前，未经甲方书面同意，乙方不得办理本合同约定的乙方银行账户的挂失、销户、银行止付等有碍于甲方收取还款金额的手续，否则视为乙方违约，乙方应按借款总额的50%向甲方支付违约金。</div>

            <h2 class="h2">第七条  乙方个人信用信息</h2>
            <div class="tex">乙方同意甲方向征信机构提供本次借款申请所登记的个人信息、借款信息、后续还款记录及本人借款的不良记录等信息，乙方确认已被明确告知提供上述信息可能会给本人的信用带来影响及不确定的后果，乙方仍然同意甲方向上述征信机构提供这些信息。</div>

            <h2 class="h2">第八条  其他约定</h2>
            <div class="tex">1.乙方确认，在保证对乙方的服务不变的前提下，如出借人将《借款合同》下的债权转让给第三方，无需征得乙方同意。</div>
            <div class="tex">2.乙方、出借人及其他相关方所签订的电子版《借款合同》作为本合同附件，是本合同不可缺少的组成部分。乙方委托甲方的合作平台代为保管签订的电子版《借款合同》，如果乙方需查阅或使用该《借款合同》，可联系甲方协助处理。</div>

            <h2 class="h2">第九条  通知与送达</h2>
            <div class="tex">1.甲、乙双方向对方发出的本合同项下的任何通知，应按照本合同首页所列的双方电子邮箱、地址、电话（包括语音通话、短信、微信等）、传真送达。</div>
            <div class="tex">2.乙方向甲方发出的本合同项下的任何通知在下列事件视为送达：</div>
            <div class="tex">（1）以电子邮件方式送达的，以电子邮件发送到接收方电子邮箱之日视为送达之日；</div>
            <div class="tex">（2）以信件方式发出的，以信件送达日期视为送达之日；</div>
            <div class="tex">（3）以传真方式发出的，以发送成功之时视为送达之日；</div>
            <div class="tex">（4）以手机信息（包括但不限于短信、微信）方式发出的，以信息发送成功之时视为送达之日。</div>

            <h2 class="h2">第十条   争议解决</h2>
            <div class="tex">如有争议，双方应首先通过协商解决；协商不成的，可依法提交<span style="display: inline-block; min-width: 100px; border-bottom: 1px solid #000;"></span> 解决。</div>
            <h2 class="h2">第十一条  合同生效及终止</h2>
            <div class="tex">合同一式贰份，甲乙双方各执壹份。本合同自甲、乙双方正式签署或盖章后生效，至本合同项下权利义务履行完毕之日或本合同约定的导致合同终止的条件满足时终止。如果乙方的借款或借贷交易最终未达成的，则本合同自动终止。</div>

            <div class="tex">&nbsp;</div>
            <div class="tex">&nbsp;</div>
            <div class="tex">&nbsp;</div>
            <div class="tex">&nbsp;</div>
            
            <div class="tex center">（后无正文）</div>
<div class="tex">&nbsp;</div>
            <div class="tex">&nbsp;</div>
            <div style="height: auto; overflow: hidden;">

                <div style="float: left; width: 50%;">
                    <div class="tex">甲方（盖章）： </div>
                    <div class="tex">&nbsp;</div>
                    <div class="tex"><span style="display: inline-block; min-width: 50px; border-bottom: 1px solid #000;"></span>年<span style="display: inline-block; min-width: 50px; border-bottom: 1px solid #000;"></span> 月 <span style="display: inline-block; min-width: 50px; border-bottom: 1px solid #000;"></span>日</div>
                </div>
                <div style="float: left; width: 50%;">
                    <div class="tex">乙方（签字及按手印）：</div>
                    <div class="tex">&nbsp;</div>
                    <div class="tex"><span style="display: inline-block; min-width: 50px; border-bottom: 1px solid #000;"></span>年<span style="display: inline-block; min-width: 50px; border-bottom: 1px solid #000;"></span> 月 <span style="display: inline-block; min-width: 50px; border-bottom: 1px solid #000;"></span>日</div>
                </div>

            </div>

            <div class="tex">&nbsp;</div>
            <div class="tex">&nbsp;</div>
        </div>
    </body>

</html>