package com.flower.action.admin;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.flower.action.BaseAction;
import com.flower.helper.Pagination;
import com.flower.model.Admin;
import com.flower.model.User;
import com.flower.service.IAdminService;
import com.flower.service.IUserService;

/**
 * 后台首页
 * @author ownfi
 *
 */
@SuppressWarnings("serial")
public class AdminAction extends BaseAction {
	
	private Admin admin;
	
	private List<Admin> list;
	
	@Autowired
	private IAdminService adminService;
	
	public String list() throws Exception {
		if (isPost()){
			Admin ret = adminService.add(admin);
			if (ret != null){
				return SUCCESS;
			}
		}
		
		list = adminService.getList();
		return NONE;
	}
	
	public String delete() throws Exception {
		adminService.delete(admin);
		return SUCCESS;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public List<Admin> getList() {
		return list;
	}

	public void setList(List<Admin> list) {
		this.list = list;
	}

}
