package com.lr.business.dao;

import com.lr.business.entity.PayResult;
import com.lr.web.rom.IBaseMapperDao;
import org.springframework.stereotype.Repository;

@Repository
public interface PayResultMapper extends IBaseMapperDao {
    int insert(PayResult record);
}