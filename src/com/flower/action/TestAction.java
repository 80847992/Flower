package com.flower.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

/**
 * 测试
 * @author ownfi
 *
 */
@SuppressWarnings("serial")
@Controller("TestAction")
public class TestAction extends BaseAction {
	
	public String index() throws Exception {
		System.out.println(ServletActionContext.getServletContext().getRealPath("/upload"));

		return SUCCESS;
	}

}
