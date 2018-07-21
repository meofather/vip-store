<#if product??>
<div class="list-block">
    <ul>
        <!-- Text inputs -->
        <li>
            <div class="item-content">
                <div class="item-media"><i class="icon icon-form-name"></i></div>
                <div class="item-inner">
                    <div class="item-title label">商品名称</div>
                    <div class="item-input">
                    ${product.itemName!}
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item-content">
                <div class="item-media"><i class="icon icon-form-name"></i></div>
                <div class="item-inner">
                    <div class="item-title label">订单编号</div>
                    <div class="item-input">
                    ${orderNo!}
                    </div>
                    <input type="hidden" value="${orderNo!}" name="orderNo">
                </div>
            </div>
        </li>
        <li>
            <div class="item-content">
                <div class="item-media"><i class="icon icon-form-name"></i></div>
                <div class="item-inner">
                    <div class="item-title label">商品单价</div>
                    <div class="item-input">
                    ${product.costPrice!}元
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item-content">
                <div class="item-media"><i class="icon icon-form-name"></i></div>
                <div class="item-inner">
                    <div class="item-title label">购买数量</div>
                    <div class="item-input">
                    ${num!}份
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item-content">
                <div class="item-media"><i class="icon icon-form-name"></i></div>
                <div class="item-inner">
                    <div class="item-title label">订单总价</div>
                    <div class="item-input">
                    ${(product.costPrice*num)!}元
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item-content">
                <div class="item-media"><i class="icon icon-form-name"></i></div>
                <div class="item-inner">
                    <div class="item-title label">联系方式</div>
                    <div class="item-input">
                    ${mobile!}
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item-content">
                <div class="item-media"><i class="icon icon-form-name"></i></div>
                <div class="item-inner">
                    <div class="item-title label">支付方式</div>
                    <div class="item-input">
                        <label><img src="${ctx!}/image/alipay.jpg" alt=""/><input
                                type="radio" name="type" checked="checked" value="1"/> </label>
                    </div>
                </div>
            </div>
        </li>
        <#if type??>
            <#if type == 0>
                <li>
                    <div class="item-content">
                        <span style="color: red;">在支付的过程中 有时候会多1分钱 二维码提示多少金额就必须付款多少，否则就不能自动发货</span>
                    </div>
                </li>
            <#else >
                <li>
                    <div class="item-content">
                        <div class="item-media"><i class="icon icon-form-name"></i></div>
                        <div class="item-inner">
                            <div class="item-title label">支付状态</div>
                            <div class="item-input">
                            <#--0 未付款 1 付款中 2 已付款 3 未发货 4 已发货-->
                                <label>
                                    <#if order.status == 0 >
                                        未付款
                                    <#elseif order.status == 1>
                                        付款中
                                    <#elseif order.status == 2>
                                        已付款
                                    <#elseif order.status == 3>
                                        未发货
                                    <#elseif order.status == 4>
                                        已发货
                                    </#if>
                                </label>
                            </div>
                        </div>
                    </div>
                </li>
                <#if stocks??>
                    <#list stocks as stock>
                        <li>
                            <div class="item-content">
                                <div class="item-media"><i class="icon icon-form-name"></i></div>
                                <div class="item-inner" style="color:coral;">
                                    <div class="item-title label">激活码信息:</div>
                                    <div class="item-input">
                                    ${stock.itemInfo!}
                                    </div>
                                </div>
                            </div>
                        </li>
                    </#list>
                </#if>
            </#if>
        </#if>
    </ul>
</div>
<#else >
<span style="color: red;">未找到此订单[${orderNo!}]的数据！</span>
</#if>