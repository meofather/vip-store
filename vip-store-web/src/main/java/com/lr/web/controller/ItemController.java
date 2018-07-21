package com.lr.web.controller;

import com.lr.business.entity.VipItem;
import com.lr.business.entity.VipOrder;
import com.lr.web.constant.Constants;
import com.lr.web.constants.PayUtil;
import com.lr.web.result.ServiceResult;
import com.lr.web.rom.annotation.BasePage;
import com.lr.web.rom.annotation.Pagination;
import com.lr.web.service.VipItemService;
import com.lr.web.service.VipOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.math.BigDecimal;
import java.time.temporal.Temporal;
import java.util.Date;
import java.util.List;


/**
 * 商品列表首页
 * 
 * @author 罗荣
 * 
 */
@Controller
@RequestMapping("/item")
public class ItemController {
	@Value("${imagePath}")
	private String imagePath;
	@Autowired
	VipItemService vipItemService;

	@Autowired
	VipOrderService vipOrderService;
	@RequestMapping(value = "/pageList")
	public String pageList(Model model, BasePage page, VipItem query) {
		ServiceResult<Pagination<VipItem>> rs = vipItemService.listPageInfos(query, page);
		Pagination<VipItem> list = rs.getData();
		for(VipItem item:list.getResult()){
			String url = item.getImageUrl();
			//替换URL地址 把非HTTP的换为默认访问路径
			if(null!=url){
				if(url.toLowerCase().contains(Constants.HTTP_URL_HEAD)){
					continue;
				}else{
					url =  imagePath+url;
					item.setImageUrl(url);
				}
			}
		}
		model.addAttribute("page",list);
		model.addAttribute("query",query);
		return "web/item_list";
	}
	
	@RequestMapping(value = "/proInfo")
	public String proInfo(Model model,Long id) {
		ServiceResult<VipItem> entityRs = vipItemService.queryById(id);
		String url =  entityRs.getData().getImageUrl();
		//替换URL地址 把非HTTP的换为默认访问路径
		if(null!=url){
			if(!url.toLowerCase().contains(Constants.HTTP_URL_HEAD)){
				url =  imagePath+url;
				entityRs.getData().setImageUrl(url);
			}
		}
		model.addAttribute("product", entityRs.getData());
		return "web/item_info";
	}
	
	@RequestMapping(value = "/comfirmInfo")
	public String comfirmInfo(Model model,Long id,String mobile,Integer num) {
		ServiceResult<VipItem> entityRs = vipItemService.queryById(id);
		model.addAttribute("product", entityRs.getData());
		model.addAttribute("mobile", mobile);
		model.addAttribute("num", num);
		model.addAttribute("type", 0);
		VipOrder entity = new VipOrder();

		entity.setCreateTime(new Date());
		entity.setItemId(id);
		entity.setDeliverGood(0);
		entity.setMobile(mobile);
		entity.setNum(num);
		entity.setOrderNo(PayUtil.getOrderIdByUUId());
		entity.setPayStyle(1);//默认为支付宝
		entity.setPrice(entityRs.getData().getCostPrice());
		entity.setStatus(0);
		entity.setTotalPrice(entityRs.getData().getCostPrice().multiply(BigDecimal.valueOf(num)));
		entity.setItemName(entityRs.getData().getItemName());
		vipOrderService.insert(entity);

		model.addAttribute("orderNo",entity.getOrderNo());

		return "web/comfirm_info";
	}
}
