package com.lr.manage.business.vipitemstock.service;

import com.lr.business.entity.VipItemStock;
import com.lr.business.service.ItemStockBusinessService;
import com.lr.result.ServiceResult;
import com.lr.rom.annotation.BasePage;
import com.lr.rom.annotation.Pagination;

import java.util.Date;
import java.util.List;

public interface ItemStockService extends ItemStockBusinessService {
    ServiceResult<Pagination<VipItemStock>> listPageInfos(VipItemStock querydto, BasePage basePage);

    ServiceResult saveBatch(Date invalidateStart, Date invalidateEnd, List<String> batchDatas, Long itemId);
}