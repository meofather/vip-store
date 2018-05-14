package com.lr.business.dao;

import com.lr.business.entity.VipItemStock;
import com.lr.rom.IBaseMapperDao;
import com.lr.rom.annotation.Pagination;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface VipItemStockMapper extends IBaseMapperDao {
    int deleteByPrimaryKey(Long id);

    int insert(VipItemStock record);

    int insertSelective(VipItemStock record);

    VipItemStock selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(VipItemStock record);

    int updateByPrimaryKey(VipItemStock record);

    void deleteByItemId(Long itemId);

    List<VipItemStock> listInfos(@Param("query") VipItemStock querydto, @Param("page") Pagination<VipItemStock> pagination);

    int insertBatch(@Param("invalidateStart") Date invalidateStart,
                    @Param("invalidateEnd") Date invalidateEnd,
                    @Param("batchDatas") List<String> batchDatas,
                    @Param("itemId") Long itemId);

    VipItemStock queryByOrderNo(String orderNo);

    VipItemStock getOne(Integer itemId);

    public int updateItemIdbyId(@Param("id") Long id,
                                @Param("itemId") Long itemId, @Param("mobile") String mobile,
                                @Param("orderNo") String orderNo);
}