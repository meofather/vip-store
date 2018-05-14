package com.lr.service.impl;

import com.lr.business.entity.VipItemStock;
import com.lr.business.entity.VipOrder;
import com.lr.business.entity.VipPayResultNotifyRecord;
import com.lr.business.service.VipOrderBusinessService;
import com.lr.business.service.impl.PayResultNotifyBusinessServiceImpl;
import com.lr.param.PayResult;
import com.lr.result.ServiceResult;
import com.lr.service.PayResultNotifyService;
import com.lr.service.VipItemService;
import com.lr.service.VipItemStockService;
import com.lr.service.VipOrderService;
import org.apache.poi.ss.formula.functions.Count;
import org.springframework.beans.factory.annotation.Autowired;

import java.math.BigDecimal;
import java.util.Date;

public class PayResultNotifyServiceImpl extends PayResultNotifyBusinessServiceImpl implements PayResultNotifyService {

    @Autowired
    private VipItemService vipItemService;

    @Autowired
    private VipItemStockService vipItemStockService;

    @Autowired
    private VipOrderService vipOrderService;
    @Override
    public ServiceResult<VipItemStock> assginEntity(String pay_id) {
        // 这orderId就是返回参数中的pay_id
        ServiceResult<VipItemStock> stockRs = vipItemStockService.queryByOrderNo(pay_id);
        if (null != stockRs.getData()) {
            return ServiceResult.newSuccess(stockRs.getData());
        }
        ServiceResult<VipOrder> rs = vipOrderService.queryByOrderNo(pay_id);
        if(rs.success()) {
            stockRs  = vipItemStockService.getOne(rs.getData().getItemId());

            if (null == stockRs.getData()) {
                return null;
            }

            int isSuccess = vipOrderService.updateItemIdbyId(stockRs.getData().getId(),
                    rs.getData().getOrderNo());

            isSuccess += vipItemStockService.updateItemIdbyId(stockRs.getData().getId(),
                    stockRs.getData().getItemId(), stockRs.getData().getMobile(), stockRs.getData().getOrderNo());

            if (isSuccess > 1) {
                return ServiceResult.newSuccess(stockRs.getData());
            }
        }
        return null;
    }

    @Override
    public ServiceResult<Integer> saveInfo(PayResult vo) {
        VipPayResultNotifyRecord payEntity = new VipPayResultNotifyRecord();
        paramSet(vo,payEntity);
        int count = mapper.insertSelective(payEntity);
        if(count > 0 ){
            return ServiceResult.newSuccess();
        }
        return ServiceResult.newFailure();
    }

    private void paramSet(PayResult vo, VipPayResultNotifyRecord payEntity) {
        payEntity.setCreateTime(new Date());
        payEntity.setMoney(new BigDecimal(Double.valueOf(vo.getMoney())));
        payEntity.setParam(vo.getParam());
        payEntity.setPayId(vo.getPay_id());
        payEntity.setPayNo(vo.getPay_no());
        payEntity.setPayTag(vo.getPay_tag());
        payEntity.setPayTime(new Date(Long.valueOf(vo.getPay_time())));
        payEntity.setPrice(new BigDecimal(Double.valueOf(vo.getPrice())));
        payEntity.setSign(vo.getSign());
        payEntity.setType(vo.getType());
    }

}
