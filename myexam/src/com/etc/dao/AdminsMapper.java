package com.etc.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.etc.entity.Admins;
import com.etc.entity.Students;
import com.etc.util.PageBean;
/**
 * 
 * @author郭
 *
 */

@Repository(value = "AdminsDao")
public interface AdminsMapper {
	
	//分页查询并显示
	List<Admins> selectAdminsByPage(PageBean pb);
	
	//查询记录数
	public int selectAdminsCount(PageBean pb);
	
    //批量删除管理员
	public int delete(String[] ids);

     //增加学生
    int insertSelective(Admins record);

    //修改信息
    int updateByPrimaryKeySelective(Admins record);
    
    //查询所有管理员信息 
    List<Admins> selectAllAdmins();

}