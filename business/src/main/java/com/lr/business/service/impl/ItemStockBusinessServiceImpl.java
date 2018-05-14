package com.lr.business.service.impl;

import com.lr.business.dao.VipItemStockMapper;
import com.lr.business.service.ItemStockBusinessService;
import org.springframework.beans.factory.annotation.Autowired;

public class ItemStockBusinessServiceImpl implements ItemStockBusinessService {
    @Autowired
    public VipItemStockMapper mapper;
}
