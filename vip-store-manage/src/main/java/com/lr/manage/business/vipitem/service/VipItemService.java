package com.lr.manage.business.vipitem.service;

import com.lr.business.entity.VipItem;
import com.lr.business.service.VipItemBusinessService;
import com.lr.web.result.ServiceResult;

public interface VipItemService extends VipItemBusinessService{

    ServiceResult<Integer> save(VipItem vipItem);

    ServiceResult edit(VipItem item);


    ServiceResult delete(Long id);
}



