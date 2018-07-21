package com.lr.web.service.impl;

import com.lr.business.entity.PayResult;
import com.lr.business.entity.VipItemStock;
import com.lr.business.entity.VipOrder;
import com.lr.business.entity.VipPayResultNotifyRecord;
import com.lr.business.service.impl.PayResultNotifyBusinessServiceImpl;
import com.lr.web.constant.NumberConstants;
import com.lr.web.result.ServiceResult;
import com.lr.web.service.PayResultNotifyService;
import com.lr.web.service.VipItemService;
import com.lr.web.service.VipItemStockService;
import com.lr.web.service.VipOrderService;
import com.sun.javafx.binding.StringFormatter;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Service
public class PayResultNotifyServiceImpl extends PayResultNotifyBusinessServiceImpl implements PayResultNotifyService {
    private static Logger logger = LogManager.getLogger(PayResultNotifyServiceImpl.class);
    @Autowired
    private VipItemService vipItemService;

    @Autowired
    private VipItemStockService vipItemStockService;

    @Autowired
    private VipOrderService vipOrderService;

    /**
     * 给订单发货
     * 这orderId就是返回参数中的pay_id
     */
    @Override
    public ServiceResult<List<VipItemStock>> assginEntity(String pay_id) {

        //先查询是否存在已经分配过的数据了
        ServiceResult<List<VipItemStock>> stockRs = vipItemStockService.queryByOrderNo(pay_id);
        if (null != stockRs.getData() && stockRs.getData().size() > NumberConstants.NUM_ZERO) {
            return ServiceResult.newSuccess(stockRs.getData());
        }

        //查询订单
        ServiceResult<VipOrder> rs = vipOrderService.queryByOrderNo(pay_id);

        //判断查询是否成功
        if (rs.success() && rs.getData() != null) {
            stockRs = vipItemStockService.getListByNum(rs.getData().getItemId(), rs.getData().getNum());

            if (null == stockRs.getData() || stockRs.getData().size() == NumberConstants.NUM_ZERO) {
                return null;
            }
            //单条的需要给订单更新
            if (rs.getData().getNum().intValue() == NumberConstants.NUM_ONE) {
                vipOrderService.updateItemIdbyId(stockRs.getData().get(NumberConstants.NUM_ZERO).getId(),
                        rs.getData().getOrderNo());
            }

            for (VipItemStock stock : stockRs.getData()) {
                vipItemStockService.updateItemIdbyId(stock.getId(),
                        stock.getItemId(), rs.getData().getMobile(), rs.getData().getOrderNo());
            }
            //更新状态
            vipOrderService.updateStatusByOrderNo(NumberConstants.NUM_FOUR, rs.getData().getOrderNo());

            return ServiceResult.newSuccess(stockRs.getData());
        } else {
            logger.error(StringFormatter.format("查询订单异常 订单号为【%s】", pay_id));
        }
        return null;
    }

    @Override
    public ServiceResult<Integer> saveInfo(PayResult vo) {
        VipPayResultNotifyRecord payEntity = new VipPayResultNotifyRecord();
        paramSet(vo, payEntity);
        int count = mapper.insertSelective(payEntity);
        int influence = payResultMapper.insert(vo);
        if (influence > 0) {
            return ServiceResult.newFailure();
        }
        //更新状态
        vipOrderService.updateStatusByOrderNo(NumberConstants.NUM_TWO, payEntity.getPayId());
        if (count > 0) {
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
