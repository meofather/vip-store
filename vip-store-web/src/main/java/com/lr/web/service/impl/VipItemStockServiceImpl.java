package com.lr.web.service.impl;

import com.lr.business.entity.VipItemStock;
import com.lr.business.service.impl.ItemStockBusinessServiceImpl;
import com.lr.web.result.ServiceResult;
import com.lr.web.service.VipItemStockService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VipItemStockServiceImpl extends ItemStockBusinessServiceImpl implements VipItemStockService {
    @Override
    public ServiceResult<List<VipItemStock>> queryByOrderNo(String orderNo) {
        List<VipItemStock> stocks = mapper.queryByOrderNo(orderNo);
        return ServiceResult.newSuccess(stocks);
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

    @Override
    public ServiceResult<List<VipItemStock>> getListByNum(Long itemId, Integer num) {
        List<VipItemStock> stocks = mapper.getListByNum(itemId,num);
        return ServiceResult.newSuccess(stocks);
    }
}
