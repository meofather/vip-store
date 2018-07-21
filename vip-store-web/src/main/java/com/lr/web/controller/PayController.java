package com.lr.web.controller;

import com.alibaba.fastjson.JSONObject;
import com.lr.business.entity.*;
import com.lr.web.constant.NumberConstants;
import com.lr.web.constants.PayUtil;
import com.lr.web.param.MaPayRequestVo;
import com.lr.web.param.MaPayResponseVo;
import com.lr.web.result.ServiceResult;
import com.lr.web.service.PayResultNotifyService;
import com.lr.web.service.VipItemService;
import com.lr.web.service.VipOrderService;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


@Controller
@RequestMapping("/pays")
public class PayController {
    private static Logger logger = LogManager.getLogger(PayController.class);
    @Autowired
    RestTemplate rest;

    @Autowired
    PayResultNotifyService payResultNotifyService;

    @Autowired
    VipOrderService vipOrderService;

    @Autowired
    VipItemService vipItemService;

    @RequestMapping("/pay")
    public String pay(HttpServletRequest request, String orderNo, Integer type, Model model) {
        ServiceResult<VipOrder> orderRs = vipOrderService.queryByOrderNo(orderNo);
        MaPayRequestVo vo = new MaPayRequestVo();

        vo.setPay_id(orderNo);
        vo.setPrice(orderRs.getData().getTotalPrice().doubleValue());
        orderRs.getData().setPayStyle(type);
        //付款中
        orderRs.getData().setStatus(NumberConstants.NUM_ONE);

        logger.debug("POST参数为:" + vo);
        ResponseEntity<String> map = rest.postForEntity(PayUtil.BASE_URL, vo, String.class);
        logger.debug("POS 返回参数为:" + map.getBody());

        MaPayResponseVo response = JSONObject.parseObject(map.getBody(), MaPayResponseVo.class);

        if (!map.getStatusCode().equals(HttpStatus.OK)) {
            model.addAttribute("mobile", orderRs.getData().getMobile());
            model.addAttribute("num", orderRs.getData().getNum());
            model.addAttribute("id", orderRs.getData().getItemId());
            return "redirect:/item/comfirmInfo.htm";
        }
        model.addAttribute("response", response);
        model.addAttribute("order", orderRs.getData());
        vipOrderService.update(orderRs.getData());
        return "web/payPage";
    }

    @RequestMapping("/notifyPay")
    @ResponseBody
    public String notifyPay(HttpServletRequest request, HttpServletResponse response, PayResult vo) {
        logger.debug(vo.toString());
        if (!"".equals(vo.getPay_no()) || null != vo.getPay_no()) {
            ServiceResult<Integer> rs = payResultNotifyService.saveInfo(vo);
            if (rs.success()) {
                return "success";
            } else {
                return "fail";
            }
        }
        return "fail";
    }

    @RequestMapping("/returnPay")
    public String returnPay(Model model, HttpServletRequest request, HttpServletResponse response, PayResult vo) {
        //通过pay_id查询订单信息
        if ("".equals(vo.getPay_no()) || null == vo.getPay_no()) {
            logger.error("付款失败：" + vo.toString());
            model.addAttribute("isSuccess", false);
        }
        ServiceResult<Integer> rs = payResultNotifyService.saveInfo(vo);
        if (rs.success()) {
            model.addAttribute("isSuccess", true);
        } else {
            model.addAttribute("isSuccess", false);
        }
        logger.debug(vo.toString());
        return "web/payResult";
    }

    @RequestMapping("/payResult")
    public String payResult(Model model, HttpServletRequest request, HttpServletResponse response, String pay_id) {
        /**
         * 分配数据
         */
        ServiceResult<List<VipItemStock>> itemStockRs = payResultNotifyService.assginEntity(pay_id);
        model.addAttribute("itemStocks", itemStockRs.getData());
        if (itemStockRs.getData() != null) {
            Long productId = itemStockRs.getData().get(NumberConstants.NUM_ZERO).getItemId();
            ServiceResult<VipItem> vipItem = vipItemService.queryById(productId);
            model.addAttribute("product",vipItem.getData());
        }
        return "web/payResult";
    }

    @RequestMapping("/getPayResult")
    @ResponseBody
    public VipPayResultNotifyRecord returnPay(HttpServletRequest request, HttpServletResponse response, String pay_id) {
        ServiceResult<VipPayResultNotifyRecord> rs = payResultNotifyService.queryByOrderNo(pay_id);
        return rs.getData();
    }

}
