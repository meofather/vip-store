package com.lr.service;

import com.lr.business.entity.VipItemStock;
import com.lr.business.service.PayResultNotifyBusinessService;
import com.lr.param.PayResult;
import com.lr.result.ServiceResult;

public interface PayResultNotifyService extends PayResultNotifyBusinessService{
    public ServiceResult<VipItemStock> assginEntity(String pay_id);

    ServiceResult<Integer> saveInfo(PayResult vo);
}
