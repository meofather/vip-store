package com.lr.controller;

import com.lr.business.entity.VipItem;
import com.lr.result.ServiceResult;
import com.lr.rom.annotation.BasePage;
import com.lr.service.VipItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 商品列表首页
 * 
 * @author 罗荣
 * 
 */
@Controller
@RequestMapping("/item")
public class ItemController {

	@Autowired
	VipItemService vipItemService;
	@RequestMapping(value = "/pageList")
	public String pageList(Model model, BasePage page, VipItem query) {
		vipItemService.listPageInfos(query,page);
		model.addAttribute("page",page);
		model.addAttribute("query",query);
		return "web/item_list";
	}
	
	@RequestMapping(value = "/proInfo")
	public String proInfo(Model model,Long id) {
		ServiceResult<VipItem> entityRs = vipItemService.queryById(id);
		model.addAttribute("product", entityRs.getData());
		return "web/item_info";
	}
	
	@RequestMapping(value = "/comfirmInfo")
	public String comfirmInfo(Model model,Long id,String mobile,Integer num) {
		ServiceResult<VipItem> entityRs = vipItemService.queryById(id);
		model.addAttribute("product", entityRs.getData());
		model.addAttribute("mobile", mobile);
		model.addAttribute("num", num);
		return "web/comfirm_info";
	}
}
