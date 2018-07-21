package com.lr.web.service;

import com.lr.business.entity.VipItemStock;
import com.lr.business.service.ItemStockBusinessService;
import com.lr.web.result.ServiceResult;

import java.util.List;

public interface VipItemStockService extends ItemStockBusinessService {
    public ServiceResult<List<VipItemStock>> queryByOrderNo(String orderNo);

    ServiceResult<VipItemStock> getOne(Long itemId);

    int updateItemIdbyId(Long id, Long itemId, String mobile, String orderNo);

    ServiceResult<List<VipItemStock>> getListByNum(Long itemId, Integer num);
}
