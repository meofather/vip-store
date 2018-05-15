package com.lr.business.dao;

import com.lr.business.entity.VipItem;
import com.lr.web.rom.IBaseMapperDao;
import com.lr.web.rom.annotation.Pagination;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VipItemMapper extends IBaseMapperDao {
    int deleteByPrimaryKey(Long id);

    int insert(VipItem record);

    int insertSelective(VipItem record);

    VipItem selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(VipItem record);

    int updateByPrimaryKeyWithBLOBs(VipItem record);

    int updateByPrimaryKey(VipItem record);

    List<VipItem> listInfos(VipItem querydto, Pagination<VipItem> pagination);

    int updateStock(@Param("id") Long id,
                          @Param("stock") int stock);
}