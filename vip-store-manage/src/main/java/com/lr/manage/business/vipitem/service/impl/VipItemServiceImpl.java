package com.lr.manage.business.vipitem.service.impl;

import com.lr.business.dao.VipItemStockMapper;
import com.lr.business.entity.VipItem;
import com.lr.business.service.impl.VipItemBusinessServiceImpl;
import com.lr.manage.business.vipitem.service.VipItemService;
import com.lr.web.result.ServiceResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class VipItemServiceImpl extends VipItemBusinessServiceImpl implements VipItemService {

    @Autowired
    private VipItemStockMapper vipItemStockMapper;

    @Override
    public ServiceResult<Integer> save(VipItem vipItem) {
        vipItem.setRealStock(0);
        vipItem.setSalesVolume(0L);
        int count =  dao.insertSelective(vipItem);
        if(count > 0 ){
            return ServiceResult.newSuccess(count);
        }else{
            return ServiceResult.newFailure();
        }
    }

    @Override
    public ServiceResult edit(VipItem item) {
        int count =  dao.updateByPrimaryKeySelective(item);
        if(count > 0 ){
            return ServiceResult.newSuccess(count);
        }else{
            return ServiceResult.newFailure();
        }
    }


    @Override
    @Transactional
    public ServiceResult delete(Long id) {
        int countRs = dao.deleteByPrimaryKey(id);
        if(countRs <= 0){
            return ServiceResult.newFailure();
        }else{
            vipItemStockMapper.deleteByItemId(id);
        }
        return ServiceResult.newSuccess();
    }
}
