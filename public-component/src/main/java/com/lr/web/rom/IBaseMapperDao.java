// BaseDao
package com.lr.web.rom;

import com.lr.web.rom.annotation.Pagination;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface IBaseMapperDao<E, PK> extends IBaseMapper {
    /**
     * @param e
     * @description 详细说明
     */
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void add(final E e);


    /**
     * @param e
     * @description 详细说明
     */
    Integer remove(@Param(value = "id") final PK e);

    /**
     * @param e
     * @description 详细说明
     */
    Integer update(final E e);

    /**
     * @param id
     * @return
     * @throws Exception
     * @description 详细说明
     */
    E getEntity(@Param(value = "id") final PK id);

    /**
     * @return
     * @description 详细说明
     */
    List<E> getEntities(@Param(value = "page") Pagination<E> page, @Param(value = "e") final E e);

}
