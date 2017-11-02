package com.etc.service;

import java.util.List;

import com.etc.entity.Paper;



/**
 * 试卷信息表的业务逻辑层接口
 * @author Administrator
 *
 */
public interface IPaperService {

	 /**
     * 加载对应试卷的试卷信息(学生端考试)
     * @param Tpaperid
     * @return
     */
	public List<Paper> selectPaperByid(Integer Tpaperid);
}
