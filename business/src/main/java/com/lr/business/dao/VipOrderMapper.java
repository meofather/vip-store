package com.lr.business.dao;

import com.lr.business.entity.VipOrder;
import com.lr.rom.IBaseMapperDao;
import org.apache.ibatis.annotations.Param;

public interface VipOrderMapper extends IBaseMapperDao {
    int deleteByPrimaryKey(Long id);

    int insert(VipOrder record);

    int insertSelective(VipOrder record);

    VipOrder selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(VipOrder record);

    int updateByPrimaryKey(VipOrder record);

    VipOrder queryByOrderNo(String orderNo);

    int updateItemIdbyId(@Param("id") Long id, @Param("orderNo") String orderNo);

}