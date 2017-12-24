package com.flower.helper;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * 分页类
 * @author Administrator
 *
 */
public class Pagination {
	
	private Integer currentPage = 1;
	private Integer perPage = 10;
	private Integer total;
	private Integer totalPage;
	
	private HttpServletRequest request;
	
	public Pagination(Integer total) throws Exception {
		super();
		this.total = total;
		genPagination();
	}
	
	public Pagination(Integer total, HttpServletRequest request) throws Exception {
		Integer currentPage = StringHelper.isNullOrEmpty(request.getParameter("page")) ? 1 : Integer.parseInt(request.getParameter("page"));
		this.total = total;
		this.currentPage = currentPage;
		this.request = request;
		genPagination();
	}
	
	public Pagination(Integer total, HttpServletRequest request, Integer perPage) throws Exception {
		Integer currentPage = StringHelper.isNullOrEmpty(request.getParameter("page")) ? 1 : Integer.parseInt(request.getParameter("page"));
		this.total = total;
		this.currentPage = currentPage;
		this.perPage = perPage;
		this.request = request;
		genPagination();
	}
	
	private void genPagination() throws Exception{
		if (this.perPage == 0){
			throw new Exception("每页行数不能为0");
		}
		this.totalPage = this.total%this.perPage == 0 ? this.total/this.perPage : this.total/this.perPage+1;
	}
	
	public Integer offset(){
		return (currentPage - 1) * perPage;
	}
	
	public Integer limit(){
		return perPage;
	}
	
	@Override
	public String toString() {
		
		String href = "?page=%d";
		Map<String, String[]> params = request.getParameterMap();
		if (params != null && !params.isEmpty()){
			for (String key : params.keySet()) {
				if (key.equals("page"))
					continue;
				String[] values = params.get(key);
				for (int i = 0; i < values.length; i++) {
					String value = values[i];
					href += "&" + key + "=" + value;
				}
			}
		}
		
		StringBuffer pagination = new StringBuffer();
		pagination.append("<div id=\"page\">");
		
		if (currentPage.equals(totalPage)){
			pagination.append("<div class=\"last fr\">末页</div><div class=\"next fr\">»</div>");
		}else{
			pagination.append(String.format("<a class=\"last fr\" href=\""+href+"\">末页</a><a class=\"next fr\" href=\""+href+"\">»</a>", totalPage, currentPage+1));
		}
		
		pagination.append("<ul class=\"pagingUl\">");
		for (Integer i = currentPage-4;i<=currentPage+4;i++){
			if (i < 1 | i > totalPage){
				continue;
			}
			if (currentPage.equals(i)){
				pagination.append(String.format("<li><a href=\"javascript:\" class=\"activP\">%d</a></li>",i));
			}else{
				pagination.append(String.format("<li><a href=\""+href+"\">%d</a></li>",i,i));
			}
		}
		pagination.append("</ul>");
		
		if (currentPage.equals(1)){
			pagination.append("<div class=\"prv fr\">«</div><div class=\"first fr\">首页</div>");
		}else{
			pagination.append(String.format("<a class=\"prv fr\" href=\""+href+"\">«</a><a class=\"first fr\" href=\""+href+"\">首页</a>", currentPage-1, 1));
		}
		
		pagination.append("</div>");
		return pagination.toString();
	}
	
}
