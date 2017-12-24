package com.flower.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.flower.helper.Pagination;
import com.opensymphony.xwork2.ActionSupport;

@Controller
public class BaseAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	private String message;
	
	@Autowired
	protected HttpSession session;
	
	/**
	 * 分页组件
	 */
	protected Pagination pagination;
	
	@Override
	public String execute() throws Exception {
		return super.execute();
	}
	
	protected Boolean isPost(){
		return ServletActionContext.getRequest().getMethod().equalsIgnoreCase("POST");
	}

	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
