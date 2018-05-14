package com.lr.business.service;

import com.lr.business.entity.VipOrder;
import com.lr.result.ServiceResult;

public interface VipOrderBusinessService {
    ServiceResult<VipOrder> queryByOrderNo(String orderNo);

    ServiceResult<VipOrder> queryById(Long orderId);
}
