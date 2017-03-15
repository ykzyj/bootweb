package com.yk.common.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.yk.system.po.User_Info;

public class WebUtil {
	/**
	 * 获取登录员工
	 */
	public static User_Info getUser(){
		HttpServletRequest request =  getRequest();
		return (User_Info) request.getSession().getAttribute(Constants.USER_SESSION_KEY);
	}
	/**
	 * 获取request请求
	 */
	public static HttpServletRequest getRequest(){
		RequestAttributes ra = RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = ((ServletRequestAttributes)ra).getRequest();
		return request;
	}
	/**
	 * 设置session信息
	 * 
	 * */
	public static void setSessionAttr(String key,Object val){
		if(!StringUtil.isEmpty(key)){
			HttpServletRequest request = getRequest();
			request.getSession().setAttribute(key,val);
		}else{
			throw new NullPointerException("key or val is null !...");
		}
	}
	/**
	 * 移除session
	 */
	public static void removeSessionAtt(String key){
		if(StringUtil.isEmpty(key)){
			HttpServletRequest request = getRequest();
			request.getSession().removeAttribute(key);
		}else{
			throw new NullPointerException("key is null...");
		}
	}
}
