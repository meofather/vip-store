package com.lr.manage.business.vipitemstock.service.impl;

import com.lr.business.entity.VipItemStock;
import com.lr.business.service.impl.ItemStockBusinessServiceImpl;
import com.lr.manage.business.vipitem.service.VipItemService;
import com.lr.manage.business.vipitemstock.service.ItemStockService;
import com.lr.web.result.ServiceResult;
import com.lr.web.rom.annotation.BasePage;
import com.lr.web.rom.annotation.Pagination;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class ItemStockServiceImpl extends ItemStockBusinessServiceImpl implements ItemStockService {
    private Logger logger = LoggerFactory.getLogger(ItemStockServiceImpl.class);
    @Autowired
    VipItemService vipItemService;
    @Override
    public ServiceResult<Pagination<VipItemStock>> listPageInfos(VipItemStock querydto, BasePage basePage) {
        Pagination<VipItemStock> pagination = new Pagination<>(basePage);
        List<VipItemStock> lists = mapper.listInfos(querydto, pagination);
        pagination.setResult(lists);
        return ServiceResult.newSuccess(pagination);
    }

    @Override
    @Transactional
    public ServiceResult saveBatch(Date invalidateStart, Date invalidateEnd, List<String> batchDatas, Long itemId) {
      int count =  mapper.insertBatch(invalidateStart,invalidateEnd,batchDatas,itemId);
        if(count <= 0){
            return ServiceResult.newFailure("保存失败");
        }
        logger.debug(String.format("执行结果为:{%s}", count));
        ServiceResult rs = vipItemService.updateRealStock(itemId, count);
        if(!rs.success()){
            new Exception("操作失败");
        }
        return ServiceResult.newSuccess();
    }
}
