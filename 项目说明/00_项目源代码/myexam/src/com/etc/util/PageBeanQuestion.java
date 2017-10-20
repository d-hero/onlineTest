package com.etc.util;

/**
 * 分页有关的PageBean ,暂时不做特殊的封装，暂时只拿给questions使用
 * @author lhl
 *
 */
public class PageBeanQuestion {
	
	//起始记录行
	private int start;
	//每行显示的行数
	private int pagesize;
	//试卷类别id
	private	int Exid;
	//试题类别id
	private int typeid;
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
	public int getExid() {
		return Exid;
	}
	public void setExid(int exid) {
		Exid = exid;
	}
	public int getTypeid() {
		return typeid;
	}
	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}
	public PageBeanQuestion(int start, int pagesize, int exid, int typeid) {
		super();
		this.start = start;
		this.pagesize = pagesize;
		Exid = exid;
		this.typeid = typeid;
	}
	public PageBeanQuestion() {
		super();
	}
	@Override
	public String toString() {
		return "PageBeanQuestion [start=" + start + ", pagesize=" + pagesize
				+ ", Exid=" + Exid + ", typeid=" + typeid + "]";
	}



}
