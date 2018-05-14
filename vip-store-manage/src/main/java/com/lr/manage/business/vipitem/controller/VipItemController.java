package com.lr.manage.business.vipitem.controller;

import com.lr.business.entity.VipItem;
import com.lr.manage.business.Constants.Constants;
import com.lr.manage.business.vipitem.service.VipItemService;
import com.lr.result.ServiceResult;
import com.lr.rom.annotation.BasePage;
import com.lr.rom.annotation.Pagination;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import static com.lr.manage.business.Constants.Constants.IMAGE_FILE_PATH;

@Controller
@RequestMapping("/vip_item")
public class VipItemController {
    private Logger logger = LoggerFactory.getLogger(VipItemController.class);
    @Autowired
    private VipItemService vipItemService;
    @RequestMapping("/pageList")
    public String pageList(VipItem query, BasePage page, Model model){
       ServiceResult<Pagination<VipItem>> rs = vipItemService.listPageInfos(query,page);

        logger.debug(String.format("查询结果为:{%s}",rs.getData()).toString());

        for(VipItem vipitem:rs.getData().getResult()){
            String url = vipitem.getImageUrl();
            //替换URL地址 把非HTTP的换为默认访问路径
            if(null!=url){
                if(url.toLowerCase().contains(Constants.HTTP_URL_HEAD)){
                    continue;
                }else{
                   url =  IMAGE_FILE_PATH+"/"+url;
                    vipitem.setImageUrl(url);
                }
            }
        }
        model.addAttribute("query",query);
        model.addAttribute("page",rs.getData());
        return "/vip_item/list";
    }

    @RequestMapping("/newItem")
    public String newItem(Model model){
        return "/vip_item/new";
    }
    @RequestMapping("/save")
    public String save(VipItem item,Model model){
        logger.debug(String.format("入参为:%s",item));

        ServiceResult rs = vipItemService.save(item);
        if(rs.success()){
            model.addAttribute("msg",rs.getMessage());
        }
        return "/vip_item/new";
    }
    @RequestMapping("/editItem")
    public String editItem(Long id, Model model){
        ServiceResult<VipItem> rs= vipItemService.queryById(id);
        String url = rs.getData().getImageUrl();
        if(null!=url){
            if(url.toLowerCase().contains(Constants.HTTP_URL_HEAD)){
            }else{
                url =  IMAGE_FILE_PATH+"/"+url;
                rs.getData().setImageUrl(url);
            }
        }
        model.addAttribute("item",rs.getData());
        return "/vip_item/edit";
    }
    @RequestMapping("/saveEditItem")
    public String saveEditItem(VipItem item, BasePage page, Model model){
        logger.debug(String.format("入参为:%s",item));

        ServiceResult rs = vipItemService.edit(item);
        if(rs.success()){
            model.addAttribute("msg",rs.getMessage());
            model.addAttribute("id",item.getId());
        }
        return "redirect:/vip_item/editItem.htm";
    }
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(Long id,Model model){
        logger.debug(String.format("入参为:%s",id));

        ServiceResult rs = vipItemService.delete(id);
        if(rs.success()){
            model.addAttribute("msg",rs.getMessage());
        }
        return "redirect:/vip_item/pageList.htm";
    }
}
