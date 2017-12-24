package com.flower.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.flower.model.User;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

/**
 * 登录状态检查拦截器
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class SessionInterceptor implements Interceptor {

	@Autowired
	protected HttpServletRequest request;
	
	@Autowired
	protected HttpSession session;
	
	@Override
	public void destroy() {

	}

	@Override
	public void init() {
		
	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		System.out.println("登录检查拦截器");
		/**
		 * 判断是否访问登录相关aciton
		 */
		String ActionName = invocation.getInvocationContext().getName();
		Boolean signing = ActionName.equals("login");
		
		/**
		 * 判断用户是否已登录
		 */
		User user = (User) session.getAttribute("user");
		Boolean userLogon = user != null && user.getUserName() != null;
		
		if (signing && userLogon){//如果正在访问登录相关，其实用户已登录，跳转到登录成功页面
			return "logon"; 
		}else if ((signing == false) && (userLogon == false)){//如果在访问普通页面，还未登录，跳转到登录页
			return Action.LOGIN;
		}else{//如果在访问普通页面，已经登录
			//@TODO
		}
		return invocation.invoke();
	}

}
