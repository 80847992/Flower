package com.flower.service;

import java.util.List;

import com.flower.model.Order;
import com.flower.model.OrdersDetail;
import com.flower.model.User;

public interface IOrderService {
	
	public Order doOrder();
	
	public Integer countAll();
	
	public List<User> getList(Integer offset,Integer limit);
	
	public List<OrdersDetail> getDetailList(Integer ordersId);
}
