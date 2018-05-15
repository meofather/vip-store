package com.lr.web.service;

import com.lr.business.entity.VipItemStock;
import com.lr.business.service.PayResultNotifyBusinessService;
import com.lr.web.param.PayResult;
import com.lr.web.result.ServiceResult;

public interface PayResultNotifyService extends PayResultNotifyBusinessService {
    public ServiceResult<VipItemStock> assginEntity(String pay_id);

    ServiceResult<Integer> saveInfo(PayResult vo);
}
