package com.flower.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flower.model.User;
import com.flower.service.IUserService;

@Service
public class UserServiceImpl implements IUserService{

	@Autowired
	private HttpSession session;
	
	@Resource
	private SessionFactory sessionFactory;
	
	@Override
	public User add(User user) {
		try {
			sessionFactory.getCurrentSession().save(user);
			login(user);
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			sessionFactory.getCurrentSession().getTransaction().rollback();
			return null;
		}
	}

	@Override
	public User login(User user) {
		User _user = (User) sessionFactory.getCurrentSession().createQuery("from User u where userName=:username")
			.setString("username",user.getUserName())
			.uniqueResult();
		if (_user == null || !user.getPassword().equals(_user.getPassword())){
			return null;
		}
		return _user;
	}

	@Override
	public Integer countAll() {
		return ((Long)sessionFactory.getCurrentSession().createQuery("select count(*) from User u").uniqueResult()).intValue();
	}

	@Override
	public List<User> getList(Integer offset, Integer limit) {
		return sessionFactory.getCurrentSession().createQuery("from User u")
				.setFirstResult(offset).setMaxResults(limit)
				.list();
	}

	@Override
	public void delete(Integer userId) {
		User user = (User) sessionFactory.getCurrentSession().get(User.class, userId);
		sessionFactory.getCurrentSession().delete(user);
	}

	@Override
	public User getCurrent() {
		return (User) session.getAttribute("user");
	}

}
