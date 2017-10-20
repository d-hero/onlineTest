package com.etc.service;

import java.util.List;

import com.etc.entity.Exatype;
import com.etc.util.PageBean;
import com.etc.util.PageData;

/**
 * 考试类型接口
 * 
 * @author Administrator
 * 
 */
public interface IExatypeService {

	/**
	 * 加载试题类型（学生端考试）
	 * 
	 * @return
	 */
	public List<Exatype> selectAllExatype();

	
	 //学生端在线考试查询考试类型
	public List<Exatype> queryExaType();
	 
	// 分页查询并显示
	public PageData<Exatype> selectExatypeByPage(int page, int rows,
			String Exatype);

	// 查询总记录数
	public int queryExaType(PageBean pb);

	// 批量删除
	public int delete(String[] ids);

	// 增加
	int insertSelective(Exatype record);
	//修改
    int updateByPrimaryKeySelective(Exatype record);


}
