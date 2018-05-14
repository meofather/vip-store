package com.lr.business.service;

import com.lr.business.entity.VipPayResultNotifyRecord;
import com.lr.result.ServiceResult;

public interface PayResultNotifyBusinessService {
    ServiceResult<VipPayResultNotifyRecord> queryByOrderNo(String orderNo);
}
