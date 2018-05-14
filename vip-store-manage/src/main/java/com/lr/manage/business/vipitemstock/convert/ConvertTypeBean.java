package com.lr.manage.business.vipitemstock.convert;

import com.lr.manage.common.util.ExcelRowToObj;
import com.lr.manage.common.util.ExcelUtil;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

public class ConvertTypeBean implements ExcelRowToObj<String> {
    private List<String> excelErrorMsgs = new ArrayList<String>();
    private List<String> rowRecord = new ArrayList<String>();
    private String code;

    private Integer rowNumber;
    @Override
    public String excelRowToObj(Row row) {

        rowNumber = row.getRowNum() + 1;
        code = ExcelUtil.getCellValue(row.getCell(0));
        if(StringUtils.isEmpty(code)){
            excelErrorMsgs.add("行[" + rowNumber + "] 合同号为空");
            return null;
        }
        return code;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
