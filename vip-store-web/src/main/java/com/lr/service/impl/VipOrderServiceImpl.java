package com.lr.service.impl;

import com.lr.business.entity.VipOrder;
import com.lr.business.service.VipOrderBusinessService;
import com.lr.business.service.impl.VipOrderBusinessServiceImpl;
import com.lr.service.VipOrderService;
import org.apache.tools.ant.types.Mapper;

public class VipOrderServiceImpl extends VipOrderBusinessServiceImpl implements VipOrderService{
    @Override
    public int updateItemIdbyId(Long id, String orderNo) {

        return mapper.updateItemIdbyId(id,orderNo);
    }

    @Override
    public int insert(VipOrder vipOrder) {
        return mapper.insert(vipOrder);
    }
}
