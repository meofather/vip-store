package com.lr.controller;

import com.alibaba.fastjson.JSONObject;
import com.lr.business.entity.VipItemStock;
import com.lr.business.entity.VipOrder;
import com.lr.business.entity.VipPayResultNotifyRecord;
import com.lr.constants.PayUtil;
import com.lr.param.MaPayRequestVo;
import com.lr.param.MaPayResponseVo;
import com.lr.param.PayResult;
import com.lr.result.ServiceResult;
import com.lr.service.PayResultNotifyService;
import com.lr.service.VipOrderService;
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
import java.math.BigDecimal;
import java.util.Date;


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
	
	@RequestMapping("/pay")
	public String pay(HttpServletRequest request, MaPayRequestVo vo, Model model, String mobile, int num, Long productId) {
		logger.debug("接收参数为:"+vo);
		VipOrder entity = new VipOrder();
		
		entity.setCreateTime(new Date());
		entity.setItemId(productId);
		entity.setDeliverGood(0);
		entity.setMobile(mobile);
		entity.setNum(num);
		entity.setOrderNo(PayUtil.getOrderIdByUUId());
		entity.setPayStyle(Integer.valueOf(vo.getType()));
		entity.setPrice(new BigDecimal(vo.getPrice()));
		entity.setStatus(0);
		
		vo.setPay_id(entity.getOrderNo());

		logger.debug("POS参数为:"+vo);
		ResponseEntity<String> map = rest.postForEntity(PayUtil.BASE_URL, vo,String.class);
		logger.debug("POS 返回参数为:"+map.getBody());
		if(!map.getStatusCode().equals(HttpStatus.OK)){
			model.addAttribute("mobile", mobile);
			model.addAttribute("num", num);
			model.addAttribute("id", productId);
			return "redirect:/item/comfirmInfo.do";
		}
		MaPayResponseVo response = JSONObject.parseObject(map.getBody(),MaPayResponseVo.class);
		model.addAttribute("response", response);
		vipOrderService.insert(entity );
		return "web/payPage";
	}

	@RequestMapping("/notifyPay")
	@ResponseBody
	public String notifyPay(HttpServletRequest request, HttpServletResponse response,PayResult vo) {
		logger.debug(vo.toString());
		if(!"".equals(vo.getPay_no())||null != vo.getPay_no()){
			ServiceResult<Integer> rs = payResultNotifyService.saveInfo(vo);
			if(rs.success()) {
				return "success";
			}else{
				return "fail";
			}
		}
		return "fail";
	}
	@RequestMapping("/returnPay")
	public String returnPay(Model model,HttpServletRequest request, HttpServletResponse response,PayResult vo) {
		//通过pay_id查询订单信息
		if("".equals(vo.getPay_no())||null == vo.getPay_no()) {
			logger.error("付款失败：" + vo.toString());
			model.addAttribute("isSuccess", false);
		}
		ServiceResult<Integer> rs = payResultNotifyService.saveInfo(vo);
		if(rs.success()) {
			model.addAttribute("isSuccess",true);
		}else{
			model.addAttribute("isSuccess", false);
		}
		logger.debug(vo.toString());
		return "web/payResult";
	}
	@RequestMapping("/payResult")
	public String payResult(Model model,HttpServletRequest request, HttpServletResponse response,String pay_id) {
		/**
		 * 分配数据
		 */
		 ServiceResult<VipItemStock> itemStockRs = payResultNotifyService.assginEntity(pay_id);
		 model.addAttribute("itemStock", itemStockRs.getData());
		return "web/payResult";
	}
	@RequestMapping("/getPayResult")
	@ResponseBody
	public VipPayResultNotifyRecord returnPay(HttpServletRequest request, HttpServletResponse response, String pay_id) {
		ServiceResult<VipPayResultNotifyRecord> rs = payResultNotifyService.queryByOrderNo(pay_id);
		return rs.getData();
	}
	
}
