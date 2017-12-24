package com.flower.action.admin;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.flower.action.BaseAction;
import com.flower.helper.Pagination;
import com.flower.model.User;
import com.flower.service.IUserService;

/**
 * 后台首页
 * @author ownfi
 *
 */
@SuppressWarnings("serial")
public class UserAction extends BaseAction {
	
	private Integer userId;
	
	private List<User> list;
	
	@Autowired
	private IUserService userService;
	
	public String list() throws Exception {
		Integer total = userService.countAll();
		pagination = new Pagination(total, ServletActionContext.getRequest(),1);
		list = userService.getList(pagination.offset(), pagination.limit());

		return SUCCESS;
	}
	
	public String delete() throws Exception {
		userService.delete(userId);
		return SUCCESS;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}

}
