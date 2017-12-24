package com.flower.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.flower.service.IOrderService;
import com.flower.service.IUserService;

/**
 * 后台首页
 * @author ownfi
 *
 */
@SuppressWarnings("serial")
@Controller("OrderAction")
public class OrderAction extends BaseAction {
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IOrderService orderService;
	
	public String doOrder() throws Exception {
		if (userService.getCurrent() == null){
			session.setAttribute("error", "请先登录");
			return LOGIN;
		}
		if ((orderService.doOrder()) != null){
			session.setAttribute("error", "下单成功，请到后台查看");
			return SUCCESS;
		}else{
			session.setAttribute("error", "下单失败");
			return ERROR;
		}
	}

}
