package com.lr.business.service.impl;

import com.lr.business.dao.VipPayResultNotifyRecordMapper;
import com.lr.business.entity.VipPayResultNotifyRecord;
import com.lr.business.service.PayResultNotifyBusinessService;
import com.lr.web.result.ServiceResult;
import org.springframework.beans.factory.annotation.Autowired;


public class PayResultNotifyBusinessServiceImpl implements PayResultNotifyBusinessService {
    @Autowired
    public VipPayResultNotifyRecordMapper mapper;

    @Override
    public ServiceResult<VipPayResultNotifyRecord> queryByOrderNo(String orderNo) {
        VipPayResultNotifyRecord entity = mapper.queryByOrderNo(orderNo);
        return ServiceResult.newSuccess(entity);
    }
}
