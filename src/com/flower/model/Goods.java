package com.flower.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="goods")
public class Goods {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;

	@Column(name="goodsName",length=50)
	private String goodsName;

	@Column(name="description",length=200)
	private String description;
	
	@Column(name="price")
	private Float price;
	
	@Column(name="imgUrl",length=50)
	private String imgUrl;
	
	@Transient
	private Integer num;
	
	@Transient
	private Integer categoryId;
	
	@ManyToOne
	@JoinColumn(name="categoryId",referencedColumnName="id")
	private Category category;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	@Override
	public String toString() {
		return "Goods [id=" + id + ", goodsName=" + goodsName + ", description=" + description + ", price=" + price
				+ ", category=" + category + ", imgUrl=" + imgUrl + ", num=" + num + "]";
	}
	
	

}
