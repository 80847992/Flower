package com.flower.action.admin;

import java.io.File;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.flower.action.BaseAction;
import com.flower.helper.Pagination;
import com.flower.model.Category;
import com.flower.model.Goods;
import com.flower.service.IGoodsService;

/**
 * 后台首页
 * @author ownfi
 *
 */
@SuppressWarnings("serial")
public class GoodsAction extends BaseAction {
	
	private Integer goodsId;
	
	private Integer categoryId;
	
	private Category category;
	
	private Goods goods;
	
	private File file;
	
	private String fileContentType;
	
    private String fileFileName;
	
	private List<Category> categoryList;
	
	private List<Goods> goodList;
	
	@Autowired
	private IGoodsService goodsService;
	
	public String list() throws Exception {
		Integer total = goodsService.countAll();
		pagination = new Pagination(total, ServletActionContext.getRequest());
		goodList = goodsService.getList(pagination.offset(), pagination.limit());

		return SUCCESS;
	}
	
	public String categoryInput() throws Exception {
		if (isPost()){			
			Category ret = goodsService.addCategory(category);
			if (ret != null){
				setMessage("添加成功");
			}
		}
		
		categoryList = goodsService.getCategoryList();

		return SUCCESS;
	}
	
	public String categoryDelete() throws Exception {
		goodsService.categoryDelete(categoryId);
		return SUCCESS;
	}
	
	public String input() throws Exception {
		if (isPost()){
			String imgUrl = goodsService.handleUpload(file, fileFileName);
			goods.setImgUrl(imgUrl);
			Goods ret = goodsService.add(goods);
			if (ret != null){
				setMessage("添加成功");
				return SUCCESS;
			}
		}
		
		categoryList = goodsService.getCategoryList();

		return NONE;
	}
	
	public String edit() throws Exception {
		if (isPost()){
			System.out.println(file);
			if (file != null){
				String imgUrl = goodsService.handleUpload(file, fileFileName);
				goods.setImgUrl(imgUrl);
			}
			Goods ret = goodsService.edit(goods);
			if (ret != null){
				setMessage("修改成功");
				return SUCCESS;
			}
		}
		
		goods = goodsService.get(goodsId);
		categoryList = goodsService.getCategoryList();
		
		return NONE;
	}
	
	public String delete() throws Exception {
		goodsService.delete(goodsId);
		return SUCCESS;
	}

	public Integer getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public List<Category> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}

	public List<Goods> getGoodList() {
		return goodList;
	}

	public void setGoodList(List<Goods> goodList) {
		this.goodList = goodList;
	}

}
