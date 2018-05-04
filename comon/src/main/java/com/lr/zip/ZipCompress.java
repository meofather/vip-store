package com.lr.zip;

import org.apache.commons.lang3.StringUtils;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipOutputStream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class ZipCompress {
    protected final static Logger logger = LoggerFactory.getLogger(ZipCompress.class);

    public static void zip(File inputFile, String zipFileName) {
        FileOutputStream out = null;
        ZipOutputStream zOut = null;
        try {
            // 创建文件输出对象out,提示:注意中文支持
            out = new FileOutputStream(new String(zipFileName.getBytes("UTF-8")));
            // 將文件輸出ZIP输出流接起来
            zOut = new ZipOutputStream(out);
            zip(zOut, inputFile, "");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (null != zOut) {
                try {
                    zOut.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
            if (null != out) {
                try {
                    out.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
        }

    }

    public static void zip(ZipOutputStream zOut, File file, String base) {
        try {
            // 如果文件句柄是目录
            if (file.isDirectory()) {
                // 获取目录下的文件
                File[] listFiles = file.listFiles();
                base = (base.length() == 0 ? "" : base + "/");
                // 遍历目录下文件
                for (int i = 0; i < listFiles.length; i++) {
                    // 递归进入本方法
                    zip(zOut, listFiles[i], base + listFiles[i].getName());
                }
            }
            // 如果文件句柄是文件
            else {
                if (StringUtils.isBlank(base)) {
                    base = file.getName();
                }
                // 填入文件句柄
                String suffix=base.substring(base.lastIndexOf(".")+1);
                if(!suffix.equals("zip")){
                    zOut.putNextEntry(new ZipEntry(base));
                    logger.info("文件名:" + file.getName() + "|加入ZIP条目:" + base);
                    // 开始压缩
                    // 从文件入流读,写入ZIP 出流
                    writeFile(zOut, file);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void writeFile(ZipOutputStream zOut, File file) throws IOException {
        logger.info("开始压缩" + file.getName());
        FileInputStream in = null;
        try {
            in = new FileInputStream(file);
            int len;
            byte[] by = new byte[1024];
            while ((len = in.read(by)) != -1)
                zOut.write(by, 0, len);
            logger.info("压缩结束" + file.getName());
        } finally {
            if (null != in) {
                in.close();
            }
        }
    }
}
