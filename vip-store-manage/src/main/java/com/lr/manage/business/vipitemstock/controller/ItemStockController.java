package com.lr.manage.business.vipitemstock.controller;

import com.lr.business.entity.VipItem;
import com.lr.business.entity.VipItemStock;
import com.lr.manage.business.Constants.Constants;
import com.lr.manage.business.vipitem.service.VipItemService;
import com.lr.manage.business.vipitemstock.convert.ConvertTypeBean;
import com.lr.manage.business.vipitemstock.service.ItemStockService;
import com.lr.manage.common.util.ExcelUtil;
import com.lr.result.AjaxResult;
import com.lr.result.ServiceResult;
import com.lr.rom.annotation.BasePage;
import com.lr.rom.annotation.Pagination;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.List;

import static com.lr.manage.business.Constants.Constants.IMAGE_FILE_PATH;

@Controller
@RequestMapping("/vip_item_stock")
public class ItemStockController {
    private Logger logger = LoggerFactory.getLogger(ItemStockController.class);
    @Autowired
    private ItemStockService itemStockService;

    @RequestMapping("/pageList")
    public String pageList(VipItemStock query, BasePage page, Model model) {
        ServiceResult<Pagination<VipItemStock>> rs = itemStockService.listPageInfos(query, page);

        logger.debug(String.format("查询结果为:{%s}", rs.getData()).toString());

        model.addAttribute("query", query);
        model.addAttribute("page", rs.getData());
        return "/vip_item_stock/list";
    }

    @RequestMapping("/importData")
    @ResponseBody
    public AjaxResult importData(@DateTimeFormat(pattern = "yyyy-MM-dd") Date invalidateStart,
                                 @DateTimeFormat(pattern = "yyyy-MM-dd") Date invalidateEnd,
                                 String filePath,Long itemId, HttpServletRequest request) {
        logger.debug(String.format("入参为:{%s}{%s}{%s}", invalidateStart, invalidateEnd, filePath));

        String savePath = (String) request.getSession().getServletContext().getRealPath(IMAGE_FILE_PATH);

        logger.debug(String.format("文件地址为:{%s}", savePath+File.separator+filePath));
        File file = new File(savePath+File.separator+filePath);


        // excel转为bean
        ConvertTypeBean excelBlack = new ConvertTypeBean();
        List<String> batchDatas = ExcelUtil.readExcel(file, excelBlack);

        if(batchDatas.size() > 500){
           return AjaxResult.failed("一次只能导入500条数据");
        }
      ServiceResult rs =  itemStockService.saveBatch(invalidateStart,invalidateEnd,batchDatas,itemId);
        if(!rs.success()){
            return AjaxResult.formatFromServiceResult(rs);
        }else{
            //清除文件
            file.deleteOnExit();
        }
        return AjaxResult.success();
    }

}
