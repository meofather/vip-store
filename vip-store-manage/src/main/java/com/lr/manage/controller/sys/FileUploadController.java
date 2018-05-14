package com.lr.manage.controller.sys;

import com.baidu.ueditor.define.FileType;
import com.baidu.ueditor.define.State;
import com.baidu.ueditor.upload.StorageManager;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.UUID;

import static com.lr.manage.business.Constants.Constants.IMAGE_FILE_PATH;

@Controller
@RequestMapping("/file")
public class FileUploadController {
    private static Log logger = LogFactory.getLog(FileUploadController.class);

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

            String savePath = (String) request.getSession().getServletContext().getRealPath(IMAGE_FILE_PATH);
            String originFileName = multipartFile.getOriginalFilename();
            String suffix = FileType.getSuffixByFilename(originFileName);

            String fileSavePath = savePath +"\\"+ UUID.randomUUID().toString().replace("-","")+ suffix;

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
}
