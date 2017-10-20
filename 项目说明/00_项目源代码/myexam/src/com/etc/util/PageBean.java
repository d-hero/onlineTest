package com.etc.util;

/**
 * 分页有关的PageBean ,暂时不做特殊的封装，暂时只拿给User使用
 * 
 * @author Administrator
 * 
 */
public class PageBean {

	// 起始记录行
	private int start;
	// 每行显示的行数
	private int pagesize;
	// 学生的ID
	private int id;
	// 模糊查询同时分页 查询条件 输入查找的用户名
	private String str;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public PageBean() {
		// TODO Auto-generated constructor stub
	}

	public PageBean(int start, int pagesize, String str) {
		super();
		this.start = start;
		this.pagesize = pagesize;
		this.str = str;
	}
	

	public PageBean(int start, int pagesize, int id) {
		super();
		this.start = start;
		this.pagesize = pagesize;
		this.id = id;
	}

	public PageBean(int start, int pagesize) {
		super();
		this.start = start;
		this.pagesize = pagesize;
	}

	@Override
	public String toString() {
		return "PageBean [start=" + start + ", pagesize=" + pagesize + ", str="
				+ str + "]";
	}

}
