package com.lr.manage.controller.sys;

import com.baidu.ueditor.define.FileType;
import com.baidu.ueditor.define.State;
import com.baidu.ueditor.upload.StorageManager;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.UUID;


@Controller
@RequestMapping("/file")
public class FileController {
    private static Log logger = LogFactory.getLog(FileController.class);
    @Value("${filePath}")
    private String savePath;
    /**
     * 文件上传
     *
     * @return
     */
    @RequestMapping(value = "/fileUpload")
    public void fileUpload(HttpServletRequest request, HttpServletResponse response) {
        try {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            MultipartFile multipartFile = multipartRequest.getFile("file");

            String originFileName = multipartFile.getOriginalFilename();
            String suffix = FileType.getSuffixByFilename(originFileName);

            String fileSavePath = savePath +File.separator+ UUID.randomUUID().toString().replace("-","")+ suffix;

            logger.debug(new File(savePath).exists());
            File targetFile = new File(savePath);
            if (!targetFile.exists()) {
                targetFile.mkdirs();
            }
            logger.debug(new File(savePath).exists());


            logger.debug(fileSavePath);

            State storageState = StorageManager.saveFileByInputStream(multipartFile.getInputStream(), fileSavePath, 51200000);

            logger.debug(String.format("保存结果为[%s]",storageState.toJSONString()));

            request.setCharacterEncoding("utf-8");
            response.setHeader("Content-Type", "application/json");
            response.getWriter().write(storageState.toJSONString());
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /**
     * 文件上传
     *
     * @return
     */
    @RequestMapping(value = "/readImage")
    public void fileRead(HttpServletRequest request, HttpServletResponse response,String path) {
        try {
            if(null == path){
                return;
            }
            if(!path.endsWith(".jpg")&&!path.endsWith(".png")&&!path.endsWith(".gif")){
                return;
            }
            String fileSavePath = savePath +File.separator+path;
            File file =new File(fileSavePath);
            if(path.endsWith(".jpg")){
                response.setContentType("image/jpeg");
            }else if(path.endsWith(".png")){
                response.setContentType("image/png");
            }else if(path.endsWith(".gif")){
                response.setContentType("image/gif");
            }
            response.setHeader("Access-Control-Allow-Origin", "*");//设置该图片允许跨域访问
            FileInputStream fileInputStream = new FileInputStream(file);
            byte[] b = new byte[fileInputStream.available()];
            fileInputStream.read(b);
            ServletOutputStream out = response.getOutputStream();
            out.write(b);
            logger.debug(String.format("获取文件路径为[%s]",fileSavePath));
            fileInputStream.close();
            out.flush();
            out.close();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
        }
    }
}
