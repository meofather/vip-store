package com.lr.business.service;

import com.lr.business.entity.VipItem;
import com.lr.result.ServiceResult;
import com.lr.rom.annotation.BasePage;
import com.lr.rom.annotation.Pagination;

public interface VipItemBusinessService {
    ServiceResult<Pagination<VipItem>> listPageInfos(VipItem querydto, BasePage basePage);

    ServiceResult<VipItem> queryById(Long id);

    /**
     *
     * @param id itemId
     * @param stock 加/减的库存数 如为减设为负数即可
     * @return
     */
    ServiceResult updateRealStock(Long id,int stock);
}
