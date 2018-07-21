package com.lr.business.service.impl;

import com.lr.business.dao.PayResultMapper;
import com.lr.business.dao.VipPayResultNotifyRecordMapper;
import com.lr.business.entity.PayResult;
import com.lr.business.entity.VipPayResultNotifyRecord;
import com.lr.business.service.PayResultNotifyBusinessService;
import com.lr.web.result.ServiceResult;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;


public class PayResultNotifyBusinessServiceImpl implements PayResultNotifyBusinessService {

    @Autowired
    public VipPayResultNotifyRecordMapper mapper;

    @Autowired
    public PayResultMapper payResultMapper;

    @Override
    public ServiceResult<VipPayResultNotifyRecord> queryByOrderNo(String orderNo) {
        VipPayResultNotifyRecord entity = mapper.queryByOrderNo(orderNo);
        return ServiceResult.newSuccess(entity);
    }
    @Override
    public int insertPayResult(PayResult record){
       return payResultMapper.insert(record);
    }
}
