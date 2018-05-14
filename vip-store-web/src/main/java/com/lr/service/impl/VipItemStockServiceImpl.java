package com.lr.service.impl;

import com.lr.business.entity.VipItemStock;
import com.lr.business.service.ItemStockBusinessService;
import com.lr.business.service.impl.ItemStockBusinessServiceImpl;
import com.lr.result.ServiceResult;
import com.lr.service.VipItemService;
import com.lr.service.VipItemStockService;

public class VipItemStockServiceImpl extends ItemStockBusinessServiceImpl implements VipItemStockService {
    @Override
    public ServiceResult<VipItemStock> queryByOrderNo(String orderNo) {
        VipItemStock stock = mapper.queryByOrderNo(orderNo);
        return ServiceResult.newSuccess(stock);
    }

    @Override
    public ServiceResult<VipItemStock> getOne(Integer itemId) {

        VipItemStock stock = mapper.getOne(itemId);

        return ServiceResult.newSuccess(stock);
    }

    @Override
    public int updateItemIdbyId(Long id, Long itemId, String mobile, String orderNo) {
        return mapper.updateItemIdbyId(id,itemId,mobile,orderNo);
    }
}
