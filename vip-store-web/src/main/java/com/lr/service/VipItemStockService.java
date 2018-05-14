package com.lr.service;

import com.lr.business.entity.VipItemStock;
import com.lr.business.service.ItemStockBusinessService;
import com.lr.result.ServiceResult;

public interface VipItemStockService extends ItemStockBusinessService {
    public ServiceResult<VipItemStock> queryByOrderNo(String orderNo);

    ServiceResult<VipItemStock> getOne(Integer itemId);

    int updateItemIdbyId(Long id, Long itemId, String mobile, String orderNo);
}
