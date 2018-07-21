package com.lr.web.service;

import com.lr.business.entity.PayResult;
import com.lr.business.entity.VipItemStock;
import com.lr.business.service.PayResultNotifyBusinessService;
import com.lr.web.result.ServiceResult;

import java.util.List;

public interface PayResultNotifyService extends PayResultNotifyBusinessService {
    public ServiceResult<List<VipItemStock>> assginEntity(String pay_id);

    ServiceResult<Integer> saveInfo(PayResult vo);
}
