package com.lr.web.util;

/**
 * INFO: info
 * User: zhaokai
 * Date: 2016/9/6 - 14:39
 * Version: 1.0
 * History: <p>如果有修改过程，请记录</P>
 */

public class ResultCodeUtils {
    /**
     *
     * @param codes
     * @return
     */
    public static Integer getResultCode(String... codes) {
        StringBuffer str = new StringBuffer();
        for (int index = 0; index < codes.length; index++) {
            str.append(codes[index]);
        }
        return Integer.parseInt(str.toString());
    }


    public static String formatString(Integer value, Integer formatLength) {
        String newString = String.format("%0" + formatLength + "d", value);
        return newString;
    }

    public static String formatString(Long value, Integer formatLength) {
        String newString = String.format("%0" + formatLength + "d", value);
        return newString;
    }
}
