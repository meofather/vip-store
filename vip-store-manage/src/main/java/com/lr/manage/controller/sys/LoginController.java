package com.lr.manage.controller.sys;

import com.lr.manage.common.shiro.ShiroUtils;
import com.lr.manage.permission.AuthPermission;
import com.lr.manage.permission.AuthorityType;
import com.lr.web.result.AjaxResult;
import com.lr.web.util.IpUtil;
import com.sun.javafx.binding.StringFormatter;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.session.SessionException;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 麦芽普惠登录
 *
 * @author dell
 */
@AuthPermission(authType = AuthorityType.NO)
@Controller
public class LoginController {
	private static Log logger = LogFactory.getLog(LoginController.class);

	public static final String SHIRO_REDIS_SESSION = "lr_own:shiro_redis:session";
	
	/**
	 * 系统登录
	 *
	 * @param
	 * @param userName
	 * @param password
	 * @return
	 */
	@RequestMapping(value = "/dologin", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult login(HttpServletRequest request, String userName, String password) {
		String result = "";
		try {
			if (StringUtils.isEmpty(userName) || StringUtils.isEmpty(password)) {
				return AjaxResult.failed("用户名或验证码不能为空");
			}
			Subject subject = SecurityUtils.getSubject();
			subject.login(new UsernamePasswordToken(userName, password));
			if (subject.isAuthenticated()) {
				logger.info("--------登录后台成功--------更新最后登录时间，记录登录日志");
				String userIpAddress = IpUtil.getIpAddr(request);
				logger.info("--------登录后台成功--------"+userIpAddress);

			}
		} catch (UnknownAccountException e) {
			result = "用户名或密码不正确";
		} catch (IncorrectCredentialsException e) {
			logger.error("登录管理系统异常", e);
			result = "用户名或密码不正确";
		} catch (LockedAccountException e) {
			result = "账户已锁定";
			logger.error("登录管理系统异常", e);
		} catch (ExcessiveAttemptsException e) {
			result = "用户名或密码错误次数过多";
			logger.error("登录管理系统异常", e);
		} catch (SessionException e) {
			result = "会话已过期,请重新登录";
			logger.error("登录管理系统异常", e);
		} catch (AuthenticationException e) {
			result = e.getMessage();
			logger.error("登录管理系统异常", e);
		} catch (Exception e) {
			result = "系统异常,请稍后重试";
			logger.error("登录管理系统异常", e);
		}
		logger.info(StringFormatter.format("处理登录的post请求dologin.htm，手机号:{},短信验证码:{}", userName, password));
		if (!"".equals(result)) {
			return AjaxResult.failed(result);
		} else {
			return AjaxResult.success();
		}
	}

	/**
	 * 登录页
	 *
	 * @return
	 */
	@RequestMapping(value = "/login")
	public String loginPage() {
		return "login";
	}

	/**
	 * 登录成功首页
	 *
	 * @return
	 */
	@RequestMapping(value = "/index")
	public String index() {
		try {
			Subject subject = SecurityUtils.getSubject();
			if (subject.isAuthenticated()) {
				//成功
			}
		} catch (Exception e) {
			logger.error("进入首页异常",e);
		}
		return "index";
	}

	/**
	 * 退出登录
	 *
	 * @return
	 */
	@RequestMapping(value = "/exitLogin")
	public String exitLogin() {
		try {
			Subject subject = SecurityUtils.getSubject();
			if (subject.isAuthenticated()) {
				// 记录退出日志
				// 更新此次登录的退出时间
				String userName = ShiroUtils.getCurrentUserName();
				logger.info(StringFormatter.format("用户{}退出登录", userName));
				subject.logout();
			}
		} catch (Exception e) {
			logger.error( "用户退出登录异常",e);
		}
		return "redirect:login.htm";
	}
}
