package com.flower.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import com.flower.model.Admin;
import com.flower.service.IAdminService;

@Service
public class AdminServiceImpl implements IAdminService{

	@Resource
	private SessionFactory sessionFactory;
	
	@Override
	public Admin add(Admin admin) {
		sessionFactory.getCurrentSession().save(admin);
		return admin;
	}

	@Override
	public Admin login(Admin admin) {
		Admin _admin = null;
		if (admin.getUsername().equals("admin")
				&& admin.getPassword().equals("123456")){
			_admin = new Admin();
			_admin.setUsername(admin.getUsername());
			return _admin;
		}else{
			_admin = (Admin) sessionFactory.getCurrentSession().createQuery("from Admin a where username=:username")
				.setString("username",admin.getUsername())
				.uniqueResult();
			if (admin != null || admin.getPassword().equals(_admin.getPassword())){
				return _admin;
			}
		}
		return _admin;
	}

	@Override
	public List<Admin> getList() {
		return sessionFactory.getCurrentSession().createQuery("from Admin a").list();
	}

	@Override
	public void delete(Admin admin) {
		sessionFactory.getCurrentSession().delete(admin);
	}

}
