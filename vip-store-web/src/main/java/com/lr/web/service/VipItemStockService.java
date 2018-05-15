package com.lr.web.service;

import com.lr.business.entity.VipItemStock;
import com.lr.business.service.ItemStockBusinessService;
import com.lr.web.result.ServiceResult;

public interface VipItemStockService extends ItemStockBusinessService {
    public ServiceResult<VipItemStock> queryByOrderNo(String orderNo);

    ServiceResult<VipItemStock> getOne(Long itemId);

    int updateItemIdbyId(Long id, Long itemId, String mobile, String orderNo);
}
