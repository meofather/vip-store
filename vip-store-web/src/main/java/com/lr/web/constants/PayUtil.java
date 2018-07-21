package com.lr.web.constants;

import java.util.UUID;

import com.lr.web.util.DateUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;


public class PayUtil {

	private static Logger logger = LogManager.getLogger(PayUtil.class);

	public static String UID = "46895";

	public static String NOTIFY_URL = "http://47.98.110.224:8098/vip-store/pays/notifyPay";

	public static String RETURN_URL = "http://47.98.110.224:8098/vip-store/pays/returnPay";

	public static String BASE_URL = "http://api2.yy2169.com:52888/creat_order/";

	public static String TOKEN = "MqqH5qiUBrSurNu1Y8mfJ7dloYTftvml";

	public static String getOrderIdByUUId() {
		int machineId = 1;// 最大支持1-9个集群机器部署
		int hashCodeV = UUID.randomUUID().toString().hashCode();
		if (hashCodeV < 0) {// 有可能是负数
			hashCodeV = -hashCodeV;
		}
		// 0 代表前面补充0;d 代表参数为正数型
		return machineId + String.format("%01d", hashCodeV)+ DateUtils.getCurrentTimeNum();
	}
	
}
