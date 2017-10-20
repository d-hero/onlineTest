package com.etc.entity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;


/**
 * 考卷类
 * @author Administrator
 *
 */
public class Tpaper {

	private Integer tpaperid;

    private String tname;

    private Exatype exatype;
    //创建一个试卷信息表
    private Paper paper;
    //创建一个试卷备份表
    private Backups backups;

    private List<Paper> papers;//每张试卷对应的考题 一对多
     

    /**
     * 总分
     * @return
     */
    public Integer getSubtotal(){
    	Integer sum=0;
    	if(papers!=null){
    	for(Paper p:papers){
    		sum+=p.getQuestions().getScore();
    	}}
    	return sum;
    }
    
    /**
     * 单选试题的集合
     * @return
     */
    public List<Questions> getQuestionsA(){
    	List<Questions> list=new ArrayList<Questions>();
    	if(papers!=null){
    	for(Paper p:papers){
    		if(p.getQuestions().getqType().getTypeid()==1){
    			list.add(p.getQuestions());
    		}
    	}
    	
    	if(list.size()==0){
    		list=null;
    	}
    	}
    	
    	
    	return list;
    }
    
    
    
    /**
     * 多选试题的集合
     * @return
     */
    public List<Questions> getQuestionsB(){
    	List<Questions> list=new ArrayList<Questions>();
    	if(papers!=null){
    	for(Paper p:papers){
    		if(p.getQuestions().getqType().getTypeid()==2){
    			list.add(p.getQuestions());
    		}
    	}
    	if(list.size()==0){
    		list=null;
    	}
    	}
    	
    	
    	return list;
    }
    
    
    
    /**
     * 判断选试题的集合
     * @return
     */
    public List<Questions> getQuestionsC(){
    	List<Questions> list=new ArrayList<Questions>();
    	if(papers!=null){
    	for(Paper p:papers){
    		if(p.getQuestions().getqType().getTypeid()==3){
    			list.add(p.getQuestions());
    		}
    	}
    	if(list.size()==0){
    		list=null;
    	}
    	}
    	
    	return list;
    }
    
    
    
    @Override  
    public boolean equals(Object o) {  
        if (o instanceof Tpaper) {  
        	Tpaper t = (Tpaper) o;  
            return this.tpaperid.equals(t.tpaperid)  
                    && this.tname.equals(t.tname) ; 
                   
        }  
        return super.equals(o);  
    }  
    
    
   

	public List<Paper> getPapers() {
		return papers;
	}

	public void setPapers(List<Paper> papers) {
		this.papers = papers;
	}

    public Backups getBackups() {
		return backups;
	}

	public void setBackups(Backups backups) {
		this.backups = backups;
	}

	public Paper getPaper() {
		return paper;
	}

	public void setPaper(Paper paper) {
		this.paper = paper;
	}

	public Exatype getExatype() {

		return exatype;
	}

	public void setExatype(Exatype exatype) {
		this.exatype = exatype;
	}


	public Integer getTpaperid() {
        return tpaperid;
    }

    public void setTpaperid(Integer tpaperid) {
        this.tpaperid = tpaperid;
    }

	public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname == null ? null : tname.trim();
    }

	@Override
	public String toString() {
		return "Tpaper [tpaperid=" + tpaperid + ", tname=" + tname
				+ ", exatype=" + exatype + ", paper=" + paper + ", backups="
				+ backups + ", papers=" + papers + "]";
	}
    
    

	
}