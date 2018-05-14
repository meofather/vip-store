package com.lr.business.service.impl;

import com.lr.business.dao.VipOrderMapper;
import com.lr.business.entity.VipOrder;
import com.lr.business.service.VipOrderBusinessService;
import com.lr.result.ServiceResult;
import org.springframework.beans.factory.annotation.Autowired;

public class VipOrderBusinessServiceImpl implements VipOrderBusinessService {
    @Autowired
   public VipOrderMapper mapper;

    @Override
    public ServiceResult<VipOrder> queryByOrderNo(String orderNo) {
        VipOrder entity = mapper.queryByOrderNo(orderNo);
        return ServiceResult.newSuccess(entity);
    }

    @Override
    public ServiceResult<VipOrder> queryById(Long orderId) {
        VipOrder entity = mapper.selectByPrimaryKey(orderId);
        return ServiceResult.newSuccess(entity);
    }
}
