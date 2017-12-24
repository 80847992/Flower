package com.flower.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flower.helper.StringHelper;
import com.flower.model.Category;
import com.flower.model.Goods;
import com.flower.service.IGoodsService;
import com.flower.vo.GoodsSearchVO;

@Service
public class GoodsServiceImpl implements IGoodsService{

	@Resource
	private SessionFactory sessionFactory;
	
	@Autowired
	protected HttpSession session;

	@Override
	public Integer countAll() {
		return ((Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Goods g").uniqueResult()).intValue();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Goods> getList(Integer offset,Integer limit) {
		return sessionFactory.getCurrentSession().createQuery("from Goods g")
				.setFirstResult(offset).setMaxResults(limit)
				.list();
	}
	
	@Override
	public Integer countAll(GoodsSearchVO goodsSearch) {
		try {
			String hql = "from Goods g where 1=1";
			if (!StringHelper.isNullOrEmpty(goodsSearch.getGoodsName())){
				hql += String.format(" AND g.goodsName like '%%%s%%'",goodsSearch.getGoodsName());
			}
			if (!StringHelper.isNullOrEmpty(goodsSearch.getCategoryId())){
				hql += String.format(" AND g.category.id=%d",goodsSearch.getCategoryId());
			}
			return ((Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Goods g").uniqueResult()).intValue();
		} catch (Exception e) {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Goods> getList(GoodsSearchVO goodsSearch,Integer offset,Integer limit) {
		try {
			String hql = "from Goods g where 1=1";
			if (!StringHelper.isNullOrEmpty(goodsSearch.getGoodsName())){
				hql += String.format(" AND g.goodsName like '%%%s%%'",goodsSearch.getGoodsName());
			}
			if (!StringHelper.isNullOrEmpty(goodsSearch.getCategoryId())){
				hql += String.format(" AND g.category.id=%d",goodsSearch.getCategoryId());
			}
			return sessionFactory.getCurrentSession().createQuery(hql)
					.setFirstResult(offset).setMaxResults(limit).list();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Goods> addToCart(Integer goodsId) {
		try{
			Goods goods = (Goods) sessionFactory.getCurrentSession().get(Goods.class, goodsId);
			if (goods == null){
				return null;
			}
			List<Goods> cartGoodsList = (List<Goods>) getCart();
			Boolean exists = false;
			for (Goods row : cartGoodsList){
				if (row.getId().equals(goods.getId())){
					row.setNum(row.getNum());
					exists = true;
					break;
				}
			}
			if (exists == false){
				goods.setNum(1);
				cartGoodsList.add(goods);
			}
			session.setAttribute("cartGoodsList", cartGoodsList);
			return cartGoodsList;
		}catch (Exception e) {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Goods> getCart() {
		List<Goods> cartGoodsList = (List<Goods>) session.getAttribute("cartGoodsList");
		if (cartGoodsList == null){
			cartGoodsList = new ArrayList<Goods>();
		}
		return cartGoodsList;
	}

	@Override
	public Category addCategory(Category category) {
		sessionFactory.getCurrentSession().save(category);
		return category;
	}

	@Override
	public Goods add(Goods goods) {
		goods.setCategory((Category)sessionFactory.getCurrentSession().get(Category.class, goods.getCategoryId()));
		sessionFactory.getCurrentSession().save(goods);
		return goods;
	}

	@Override
	public List<Category> getCategoryList() {
		return sessionFactory.getCurrentSession().createQuery("from Category g").list();
	}

	@Override
	public Goods edit(Goods goods) {
		goods.setCategory((Category)sessionFactory.getCurrentSession().get(Category.class, goods.getCategoryId()));
		sessionFactory.getCurrentSession().update(goods);
		return goods;
	}

	@Override
	public Goods get(Integer goodsId) {
		return (Goods) sessionFactory.getCurrentSession().get(Goods.class, goodsId);
	}

	@Override
	public void categoryDelete(Integer categoryId) {
		Category category = (Category) sessionFactory.getCurrentSession().get(Category.class, categoryId);
		sessionFactory.getCurrentSession().delete(category);
	}

	@Override
	public String handleUpload(File file, String fileName) {
		try {
			String root = ServletActionContext.getServletContext().getRealPath("/upload");
			File path = new File(root);
			if(!path.exists())path.mkdirs();
            //保存文件
            FileUtils.copyFile(file, new File(path,fileName));
	        return "upload/" + fileName;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public void delete(Integer goodsId) {
		Goods goods = (Goods) sessionFactory.getCurrentSession().get(Goods.class, goodsId);
		sessionFactory.getCurrentSession().delete(goods);
	}

	@Override
	public void removeFromShopping(Integer goodsId) {
		List<Goods> cartGoodsList = (List<Goods>) getCart();
		List<Goods> newCartGoodsList = new ArrayList<Goods>();
		for (Goods row : cartGoodsList){
			if (!row.getId().equals(goodsId)){
				newCartGoodsList.add(row);
			}
		}
		session.setAttribute("cartGoodsList", newCartGoodsList);
	}

}
