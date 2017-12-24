package com.flower.service;

import java.io.File;
import java.util.List;

import com.flower.model.Category;
import com.flower.model.Goods;
import com.flower.vo.GoodsSearchVO;

public interface IGoodsService {
	
	public Integer countAll();
	
	public List<Goods> getList(Integer offset,Integer limit);
	
	public Integer countAll(GoodsSearchVO goodsSearch);
	
	public List<Goods> getList(GoodsSearchVO goodsSearch,Integer offset,Integer limit);
	
	public List<Goods> addToCart(Integer goodsId);
	
	public void removeFromShopping(Integer goodsId);
	
	public List<Goods> getCart();
	
	public Category addCategory(Category category);
	
	public Goods add(Goods goods);
	
	public Goods edit(Goods goods);
	
	public List<Category> getCategoryList();
	
	public Goods get(Integer goodsId);
	
	public void categoryDelete(Integer categoryId);
	
	public String handleUpload(File file, String fileName);
	
	public void delete(Integer goodsId);
}
