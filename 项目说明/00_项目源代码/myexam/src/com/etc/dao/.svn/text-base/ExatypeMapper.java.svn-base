package com.etc.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.etc.entity.Admins;
import com.etc.entity.Exatype;
import com.etc.util.PageBean;

/**
 * 考试类别的dao接口
 * 
 * @author 刘鹤麟
 * 
 */
@Repository(value = "exatypedao")
public interface ExatypeMapper {
	int deleteByPrimaryKey(Integer exid);

	int insert(Exatype record);

	// 增加
	int insertSelective(Exatype record);

	Exatype selectByPrimaryKey(Integer exid);

	// 修改
	int updateByPrimaryKeySelective(Exatype record);

	int updateByPrimaryKey(Exatype record);

	//学生端在线考试查询考试类型
	public List<Exatype> queryexaType();
	 

	// 分页查询并显示
	public List<Exatype> selectExatypeByPage(PageBean pb);

	// 查询总记录数
	public int queryExaType(PageBean pb);

	// 批量删除
	public int delete(String[] ids);

	/**
	 * 加载试题类型（考试）
	 * 
	 * @return
	 */
	public List<Exatype> selectAllExatype();

}