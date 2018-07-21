package com.lr.web.controller;

import com.lr.business.entity.VipItem;
import com.lr.business.entity.VipItemStock;
import com.lr.business.entity.VipOrder;
import com.lr.web.constant.Constants;
import com.lr.web.result.ServiceResult;
import com.lr.web.rom.annotation.BasePage;
import com.lr.web.rom.annotation.Pagination;
import com.lr.web.service.VipItemService;
import com.lr.web.service.VipItemStockService;
import com.lr.web.service.VipOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.interfaces.RSAPrivateKey;
import java.util.List;

@Controller
public class IndexController {
    @Autowired
    private VipItemService vipItemService;
    @Autowired
    private VipOrderService orderService;
    @Autowired
    private VipItemStockService stockService;
    @Value("${imagePath}")
    private String savePath;

    @RequestMapping(value = "/index")
    public String pageList(Model model) {
        ServiceResult<Pagination<VipItem>> rs = vipItemService.listPageInfos(new VipItem(), new BasePage());
        Pagination<VipItem> list = rs.getData();
        for (VipItem item : list.getResult()) {
            String url = item.getImageUrl();
            //替换URL地址 把非HTTP的换为默认访问路径
            if (null != url) {
                if (url.toLowerCase().contains(Constants.HTTP_URL_HEAD)) {
                    continue;
                } else {
                    url = savePath + url;
                    item.setImageUrl(url);
                }
            }
        }
        model.addAttribute("page", list);
        return "web/index";
    }

    @RequestMapping(value = "/orderInfo")
    public String pageList(Model model, String orderNo) {
        ServiceResult<VipOrder> orderRs = orderService.queryByOrderNo(orderNo);
        if(null == orderRs.getData()){
            model.addAttribute("orderNo", orderNo);
            return "web/template/order_info";
        }
        ServiceResult<VipItem> productRs = vipItemService.queryById(orderRs.getData().getItemId());
        ServiceResult<List<VipItemStock>> stockInfo = stockService.queryByOrderNo(orderNo);
        model.addAttribute("orderNo", orderNo);
        model.addAttribute("num", orderRs.getData().getNum());
        model.addAttribute("mobile", orderRs.getData().getMobile());
        model.addAttribute("product", productRs.getData());
        model.addAttribute("stocks", stockInfo.getData());
        model.addAttribute("order", orderRs.getData());
        model.addAttribute("type",1);
        return "web/template/order_info";
    }

}
