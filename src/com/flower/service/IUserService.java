package com.flower.service;

import java.util.List;

import com.flower.model.User;

public interface IUserService {

	public User add(User user);
	
	public User login(User user);
	
	public Integer countAll();
	
	public List<User> getList(Integer offset,Integer limit);
	
	public void delete(Integer userId);
	
	public User getCurrent();
}
