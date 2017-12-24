package com.flower.action.admin;

import org.springframework.beans.factory.annotation.Autowired;

import com.flower.action.BaseAction;
import com.flower.model.Admin;
import com.flower.service.IAdminService;

/**
 * 后台首页
 * @author ownfi
 *
 */
@SuppressWarnings("serial")
public class AuthAction extends BaseAction {
	
	/**
	 * 传入参数
	 */
	private Admin admin;
	
	@Autowired
	private IAdminService adminService;
	
	public String login() throws Exception {
		if (isPost()){
			Admin _admin = null;
			if ((_admin = adminService.login(admin)) != null){
				session.setAttribute("admin",_admin);
				session.setAttribute("adminName", _admin.getUsername());
				session.removeAttribute("error");
				return SUCCESS;
			}else{
				session.setAttribute("error", "用户名密码错误");
			}
		}

		return NONE;
	}
	
	public String logout() throws Exception {
		session.removeAttribute("admin");
		session.removeAttribute("adminName");
		return SUCCESS;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

}
