package com.yk.common.page.po;

public class Page {

	private int totalNumber;
	private int totalPage;
	private int currentPage;
	private int pageNumber=10;
	private int dbIndex;
	private int dbNumber;
	public void initCount() {
		int totalPageTemp=totalNumber/pageNumber;
		if(totalPageTemp*pageNumber<totalNumber)
		{
			totalPage=totalPageTemp+1;
		}
		if(totalPage<=0)
		{
			totalPage=1;
		}
		dbIndex=(currentPage-1)*pageNumber;
		dbNumber=pageNumber;
	}
	public int getTotalNumber() {
		return totalNumber;
	}
	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pagenumber) {
		pageNumber = pagenumber;
	}
	public int getDbIndex() {
		return dbIndex;
	}
	public void setDbIndex(int dbIndex) {
		this.dbIndex = dbIndex;
	}
	public int getDbNumber() {
		return dbNumber;
	}
	public void setDbNumber(int dbNumber) {
		this.dbNumber = dbNumber;
	}
}
