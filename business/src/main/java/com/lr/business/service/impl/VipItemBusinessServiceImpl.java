package com.lr.business.service.impl;

import com.lr.business.dao.VipItemMapper;
import com.lr.business.entity.VipItem;
import com.lr.business.service.VipItemBusinessService;
import com.lr.result.ServiceResult;
import com.lr.rom.annotation.BasePage;
import com.lr.rom.annotation.Pagination;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class VipItemBusinessServiceImpl implements VipItemBusinessService {
    @Autowired
    public VipItemMapper dao;
    @Override
    public ServiceResult<Pagination<VipItem>> listPageInfos(VipItem querydto, BasePage basePage) {
        Pagination<VipItem> pagination = new Pagination<VipItem>(basePage);
        List<VipItem> lists = dao.listInfos(querydto, pagination);
        pagination.setResult(lists);
        return ServiceResult.newSuccess(pagination);
    }

    @Override
    public ServiceResult<VipItem> queryById(Long id) {
        VipItem entity = dao.selectByPrimaryKey(id);
        return ServiceResult.newSuccess(entity);
    }

    @Override
    public ServiceResult updateRealStock(Long id,int stock) {
        int count =  dao.updateStock(id,stock);
        if(count <= 0 ){
            return ServiceResult.newFailure();
        }else{
            return ServiceResult.newSuccess();
        }
    }
}
