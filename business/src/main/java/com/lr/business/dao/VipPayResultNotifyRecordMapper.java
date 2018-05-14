package com.lr.business.dao;

import com.lr.business.entity.VipPayResultNotifyRecord;
import com.lr.rom.IBaseMapperDao;

public interface VipPayResultNotifyRecordMapper extends IBaseMapperDao {
    int deleteByPrimaryKey(Long id);

    int insert(VipPayResultNotifyRecord record);

    int insertSelective(VipPayResultNotifyRecord record);

    VipPayResultNotifyRecord selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(VipPayResultNotifyRecord record);

    int updateByPrimaryKey(VipPayResultNotifyRecord record);

    VipPayResultNotifyRecord queryByOrderNo(String orderNo);

}