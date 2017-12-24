package com.flower.action.admin;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.flower.action.BaseAction;
import com.flower.helper.Pagination;
import com.flower.model.OrdersDetail;
import com.flower.model.User;
import com.flower.service.IOrderService;

/**
 * 后台首页
 * @author ownfi
 *
 */
@SuppressWarnings("serial")
public class OrderAction extends BaseAction {
	
	private Integer ordersId;
	
	private List<User> list;
	
	private List<OrdersDetail> detailList;
	
	@Autowired
	private IOrderService orderService;
	
	public String list() throws Exception {
		Integer total = orderService.countAll();
		pagination = new Pagination(total, ServletActionContext.getRequest());
		list = orderService.getList(pagination.offset(), pagination.limit());

		return SUCCESS;
	}
	
	public String detail() throws Exception {
		detailList = orderService.getDetailList(ordersId);
		return SUCCESS;
	}

	public Integer getOrdersId() {
		return ordersId;
	}

	public void setOrdersId(Integer ordersId) {
		this.ordersId = ordersId;
	}

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}

	public List<OrdersDetail> getDetailList() {
		return detailList;
	}

	public void setDetailList(List<OrdersDetail> detailList) {
		this.detailList = detailList;
	}

}
