package com.lr.business.dao;

import com.lr.business.entity.VipOrder;
import com.lr.web.rom.IBaseMapperDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface VipOrderMapper extends IBaseMapperDao {
    int deleteByPrimaryKey(Long id);

    int insert(VipOrder record);

    int insertSelective(VipOrder record);

    VipOrder selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(VipOrder record);

    int updateByOrderNoSelective(VipOrder record);

    int updateByPrimaryKey(VipOrder record);

    VipOrder queryByOrderNo(String orderNo);

    int updateItemIdbyId(@Param("id") Long id, @Param("orderNo") String orderNo);

    int updateStatusByOrderNo(@Param("status") int status, @Param("orderNo") String orderNo);

}