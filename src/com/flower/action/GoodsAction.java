package com.flower.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.flower.helper.Pagination;
import com.flower.model.Category;
import com.flower.model.Goods;
import com.flower.service.IGoodsService;
import com.flower.vo.GoodsSearchVO;

/**
 * 后台首页
 * @author ownfi
 *
 */
@SuppressWarnings("serial")
@Controller("GoodsAction")
public class GoodsAction extends BaseAction {
	
	private Integer goodsId;
	
	/**
	 * 传入参数
	 */
	private GoodsSearchVO goodsSearch;
	
	private Goods goods;
	
	private List<Goods> list;
	
	private List<Category> categoryList;
	
	private Float cartSum;
	
	@Autowired
	private IGoodsService goodsService;
	
	public String list() throws Exception {
		if (goodsSearch != null){
			Integer total = goodsService.countAll(goodsSearch);
			pagination = new Pagination(total, ServletActionContext.getRequest());
			list = goodsService.getList(goodsSearch,pagination.offset(),pagination.limit());
		}else{
			Integer total = goodsService.countAll();
			pagination = new Pagination(total, ServletActionContext.getRequest());
			list = goodsService.getList(pagination.offset(),pagination.limit());
		}
		
		categoryList = goodsService.getCategoryList();
		
		return SUCCESS;
	}
	
	public String buy() throws Exception {
		
		goods = goodsService.get(goodsId);
		
		return SUCCESS;
	}
	
	public String shopping() throws Exception {
		
		if (goodsId != null){
			goodsService.addToCart(goodsId);
		}
		list = goodsService.getCart();
		
		cartSum = 0f;
		for (Goods goods : list){
			cartSum += goods.getPrice() * goods.getNum();
		}
		
		return SUCCESS;
	}
	
	public String removeFromShopping() throws Exception {
		
		if (goodsId != null){
			goodsService.removeFromShopping(goodsId);
		}
		
		return SUCCESS;
	}

	public Integer getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public GoodsSearchVO getGoodsSearch() {
		return goodsSearch;
	}

	public void setGoodsSearch(GoodsSearchVO goodsSearch) {
		this.goodsSearch = goodsSearch;
	}

	public List<Goods> getList() {
		return list;
	}

	public void setList(List<Goods> list) {
		this.list = list;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public List<Category> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}

	public Float getCartSum() {
		return cartSum;
	}

	public void setCartSum(Float cartSum) {
		this.cartSum = cartSum;
	}

}
