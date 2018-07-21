package com.lr.web.service.impl;

import com.lr.business.entity.VipOrder;
import com.lr.business.service.impl.VipOrderBusinessServiceImpl;
import com.lr.web.service.VipOrderService;
import org.springframework.stereotype.Service;

@Service
public class VipOrderServiceImpl extends VipOrderBusinessServiceImpl implements VipOrderService {
    @Override
    public int updateItemIdbyId(Long id, String orderNo) {

        return mapper.updateItemIdbyId(id,orderNo);
    }
    @Override
    public int updateStatusByOrderNo(int status, String orderNo) {

        return mapper.updateStatusByOrderNo(status,orderNo);
    }

    @Override
    public int insert(VipOrder vipOrder) {
        return mapper.insert(vipOrder);
    }

    @Override
    public int update(VipOrder order) {
        return mapper.updateByOrderNoSelective(order);
    }
}
