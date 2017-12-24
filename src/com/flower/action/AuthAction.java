package com.flower.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.flower.model.User;
import com.flower.service.IUserService;

/**
 * 后台首页
 * @author ownfi
 *
 */
@SuppressWarnings("serial")
@Controller("AuthAction")
public class AuthAction extends BaseAction {
	
	/**
	 * 传入参数
	 */
	private User user;
	
	@Autowired
	private IUserService userService;
	
	public String register() throws Exception {
		if (isPost()){
			User _user = null;
			if ((_user = userService.add(user)) != null){
				session.setAttribute("user",_user);
				session.setAttribute("userName", _user.getUserName());
				session.removeAttribute("error");
				return SUCCESS;
			}else{
				session.setAttribute("error", "注册失败");
			}
		}

		return NONE;
	}
	
	public String login() throws Exception {
		if (isPost()){
			User _user = null;
			if ((_user = userService.login(user)) != null){
				session.setAttribute("user",_user);
				session.setAttribute("userName", _user.getUserName());
				session.removeAttribute("error");
				return SUCCESS;
			}else{
				session.setAttribute("error", "用户名或密码错误");
			}
		}

		return NONE;
	}
	
	public String logout() throws Exception {
		session.removeAttribute("user");
		session.removeAttribute("userName");
		return SUCCESS;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
