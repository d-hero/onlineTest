package com.etc.service;

import java.util.List;

import com.etc.entity.Admins;
import com.etc.entity.Students;
import com.etc.util.PageBean;
import com.etc.util.PageData;

public interface IAdminsService {
	
	//分页查询并显示
	public PageData<Admins> selectAdminsByPage(int page, int rows, String  adminname);
		
		//查询记录数
		public int selectAdminsCount(PageBean pb);
		
	    //删除管理员
		public int delete(String[] ids);

	     //增加学生
	    int insertSelective(Admins record);

	    //修改信息
	    int updateByPrimaryKeySelective(Admins record);

	    //查询所有管理员
	    List<Admins> selectAllAdmins();
}
