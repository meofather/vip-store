package com.lr.manage.controller;

import com.lr.manage.common.shiro.ShiroUtils;
import com.lr.manage.permission.AuthPermission;
import com.lr.manage.permission.AuthorityType;
import com.lr.web.result.AjaxResult;
import com.lr.web.rom.annotation.BasePage;
import com.lr.web.rom.annotation.Pagination;
import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@AuthPermission(authType = AuthorityType.NO)
@Controller
@RequestMapping("/demo")
public class AccountController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(AccountController.class);

    /**
     * DEMO :调整到FREEMARKER页面
     *
     * @param model
     * @return
     */
    @RequestMapping("/ftl")
    public String ftlDemo(Model model,
            @RequestParam(value = "queryName", required = false, defaultValue = "") String queryName,
            HttpServletRequest request) {

        System.out.println("2222");
        model.addAttribute("title", "Spring MVC And Freemarker");
        model.addAttribute("content", " Hello world ， test my first spring mvc ! ");
        BasePage basePage = super.newPage(request);

        System.out.println("ShiroUtils" + ShiroUtils.getCurrentUserName());
        Pagination<String> pagination = new Pagination(basePage);
        pagination.setTotal(200);
        model.addAttribute("pagination", pagination);
        model.addAttribute("queryName", queryName);
        return "demo";
    }

    /**
     * 
     * @名称 ftlPage
     * @描述 TODO(这里用一句话描述这个方法的作用)
     * @返回类型 String
     * @日期 2016年10月18日 下午3:26:25
     * @创建人 王海波
     * @更新人 王海波
     *
     */
    @RequestMapping("/ftlPage")
    public String ftlPage(Model model) {
        return "ftlpage_demo";
    }

    @RequestMapping("/test")
    @ResponseBody
    public AjaxResult test() {

        String s = "12312";
        Integer a = Integer.parseInt(s);
        return AjaxResult.failed("err");
    }

    @RequestMapping("/test12")
    @ResponseBody
    public String test12() {

        return "对不起，你的请求有异常";
    }

    @RequestMapping("/test2")
    @ResponseBody
    public AjaxResult testSuccess() {

        Map<String, Object> map = new HashedMap();
        map.put("name", "赵凯");
        map.put("age", 12);
        map.put("isuser", false);
        return AjaxResult.success(map);
    }

    @RequestMapping("/test3")
    @ResponseBody
    public AjaxResult test3() {

        return AjaxResult.failed("对不起，你的请求有异常");
    }

    @RequestMapping("/test4")
    @ResponseBody
    public AjaxResult test4() {

        return AjaxResult.failed("对不起，你的请求有异常", -10002);
    }
}
