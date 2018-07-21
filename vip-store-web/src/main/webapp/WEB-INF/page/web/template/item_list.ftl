<#list page.result as item>
<div class="card">
    <div class="card-content">
        <div class="list-block media-list">
            <ul>
                <li class="item-content" onclick="window.location.href='${serverPath}/item/proInfo.htm?id=${item.id}'">

                    <div class="item-media">
                        <img src="${item.imageUrl!}" width="100">
                    </div>
                    <div class="item-inner">
                        <div class="item-title-row">
                            <a href="${serverPath}/item/proInfo.htm?id=${item.id}">${item.itemName?substring(0,20)}...</a>
                        </div>
                        <div class="item-subtitle">
                                                        <span
                                                                style="color: red;font-size: 16px;"><b>￥</b></span><span
                                style="color: red;">${item.sellingPrice!}</span>
                            <span style="font-size: 10px;color: #666666">${item.salesVolume}
                                人付款</span>
                        </div>
                        <div class="item-subtitle">
                            <span class="red_price_tag">官网价</span>
                            <span
                                    style="color: #ffb163;font-size: 10px;"><b>￥</b></span><span
                                style="color: #ffb163; font-size: 10px;"><s>${item.officialPrice!}</s></span>
                        </div>
                    </div>
                </li>
            </ul>
        </div>

    </div>
    <div class="card-footer">
        <span class="tag" style="background-color: #f37269;">自动发货</span>
        <span class="tag">库存(${item.realStock+item.cacheStock})</span>
        <span class="tag" style="background-color: #b185c6;">售量(${item.salesVolume})</span>
    </div>
</div>
</#list>