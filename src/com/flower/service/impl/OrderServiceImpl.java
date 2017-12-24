package com.flower.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flower.model.Goods;
import com.flower.model.Order;
import com.flower.model.OrdersDetail;
import com.flower.model.User;
import com.flower.service.IGoodsService;
import com.flower.service.IOrderService;

@Service
public class OrderServiceImpl implements IOrderService{

	@Resource
	private SessionFactory sessionFactory;
	
	@Autowired
	protected HttpSession session;
	
	@Autowired
	protected IGoodsService goodsService;

	@Override
	public Order doOrder() {
		try {
			User user = (User) session.getAttribute("user");
			if (user == null){
				return null;
			}
			List<Goods> cartGoodsList = goodsService.getCart();
			if (cartGoodsList == null || cartGoodsList.isEmpty()){
				return null;
			}
			
			Integer totalNum = 0;
			long totalPrice = 0;
			OrdersDetail ordersDetail;
			List<OrdersDetail> ordersDetails = new ArrayList();
			for (Goods goods :cartGoodsList){
				totalNum += goods.getNum();
				totalPrice += goods.getPrice()*goods.getNum();
				
				ordersDetail = new OrdersDetail();
				ordersDetail.setGoodsName(goods.getGoodsName());
				ordersDetail.setPrice(goods.getPrice());
				ordersDetail.setNum(goods.getNum());
				ordersDetails.add(ordersDetail);
			}
			
			Order order = new Order();
			order.setUsername(user.getUserName());
			order.setNum(totalNum);
			order.setSum((float) totalPrice);
			order.setCreateTime(new Date());
			sessionFactory.getCurrentSession().save(order);			
			
			for (OrdersDetail detail :ordersDetails){
				detail.setOrdersId(order.getOrdersId());
				sessionFactory.getCurrentSession().save(detail);
			}
			
			return order;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Integer countAll() {
		// TODO Auto-generated method stub
		return ((Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Order o").uniqueResult()).intValue();
	}

	@Override
	public List<User> getList(Integer offset, Integer limit) {
		return sessionFactory.getCurrentSession().createQuery("from Order o")
				.setFirstResult(offset).setMaxResults(limit)
				.list();
	}

	@Override
	public List<OrdersDetail> getDetailList(Integer ordersId) {
		return sessionFactory.getCurrentSession().createQuery("from OrdersDetail od where ordersId=:ordersId")
				.setInteger("ordersId", ordersId)
				.list();
	}

}
