package com.flower.service;

import java.util.List;

import com.flower.model.Admin;

public interface IAdminService {

	public Admin add(Admin admin);
	
	public Admin login(Admin admin);
	
	public List<Admin> getList();
	
	public void delete(Admin admin);
}
