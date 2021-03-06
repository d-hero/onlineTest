package com.etc.service;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.etc.entity.Students;
import com.etc.util.PageBean;
import com.etc.util.PageData;


public interface IStudentsService {
	
	
	public PageData<Students> selectStudentsByPage(int page, int rows, String stuname);


	public int delete(String[] ids);
	  
    public int insertSelective(Students record);
    
    public int insertStudents(Students record);
	  
	public  int updateByPrimaryKeySelective(Students record);
	
	public List<Students> selectAllStudent();
	
	public Students userLogin(String stuno,String stupwd);
	
   public Students selectStudentsBystuno(String stuno);
}
