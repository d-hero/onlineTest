package com.etc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.etc.entity.Tpaper;


/**
 * 考卷业务逻辑层
 * @author Administrator
 *
 */
public interface ITpaperService {

	/**
	 * 加载对应类型考卷(学生端考试)
	 * @param Exid
	 * @return
	 */
	 public List<Tpaper> selectAllTpaper(Integer Exid);
	 
	 
	 /**
	     * 加载对应试卷的试卷信息(学生端考试)
	     * @param Tpaperid
	     * @return
	     */
	    public Tpaper selectPaperByid(Integer Tpaperid);


	/*int insert(Tpaper record);*/
	

	public int insert(@Param("tpaperid")String tpaperid, @Param("exid")String exid, @Param("tname")String tname);
}
