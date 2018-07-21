package com.lr.manage.controller.sys;

import com.baidu.ueditor.ActionEnter;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@Controller
@RequestMapping("/ueditor")
public class UeditorController {
    private static Log logger = LogFactory.getLog(UeditorController.class);
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
            response.setHeader("Content-Type", "text/html");

            request.setCharacterEncoding("utf-8");
            response.getWriter().write(new ActionEnter(request, savePath).exec());
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
