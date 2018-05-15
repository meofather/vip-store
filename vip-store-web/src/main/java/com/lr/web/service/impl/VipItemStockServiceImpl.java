package com.lr.web.service.impl;

import com.lr.business.entity.VipItemStock;
import com.lr.business.service.impl.ItemStockBusinessServiceImpl;
import com.lr.web.result.ServiceResult;
import com.lr.web.service.VipItemStockService;
import org.springframework.stereotype.Service;

@Service
public class VipItemStockServiceImpl extends ItemStockBusinessServiceImpl implements VipItemStockService {
    @Override
    public ServiceResult<VipItemStock> queryByOrderNo(String orderNo) {
        VipItemStock stock = mapper.queryByOrderNo(orderNo);
        return ServiceResult.newSuccess(stock);
    }

    @Override
    public ServiceResult<VipItemStock> getOne(Long itemId) {

        VipItemStock stock = mapper.getOne(itemId);

        return ServiceResult.newSuccess(stock);
    }

    @Override
    public int updateItemIdbyId(Long id, Long itemId, String mobile, String orderNo) {
        return mapper.updateItemIdbyId(id,itemId,mobile,orderNo);
    }
}
