package com.etc.service;



import java.util.List;

import com.etc.entity.Backups;
import com.etc.entity.Students;
import com.etc.util.PageData;

/**                    
*功能描述:备份表Service接口 
* @author  张献
* @version  1.0 
* create Date 2017-06-13   */  

public interface IBackupsService {
  /**
   * 
   * @param 删除的功能
   * @return
   */
	public int deleteByPrimaryKey(Object[] id);
	  /**
	   * 
	   * @param 增加的功能
	   * @return
	   */
	public int insert(Backups record);
	 
	  /**
	   * 
	   * @param 查询的功能
	   * @return
	   */
	public Backups selectByPrimaryKey(Integer backupsid);
	
	/**
	   * 
	   * @param修改的功能
	   * @return
	   */
	public  int updateByPrimaryKeySelective(Backups record);
	/**
	   * 
	   * @param查询全部分页
	   * @return
	   */
	public PageData<Backups> selectAllBackups(int page, int rows);
	
	

	   /**
  * 确定是否是修改还是插入新的备份
  * @param bk
  * @return
  */
 public Integer selectCount(Backups bk);
 
 
 
 /**
  * 通过试卷id和学生id修改
  * @param bk
  * @return
  */
 public int updateBackups(Backups bk);
 
 
 
 
 /**
  * 通过学生id，查找对应备份记录，进行试卷加载界面 的相应判断
  * @param s
  * @return
  */
 public List<Backups> selectAll(Students s);
	    
     
}
