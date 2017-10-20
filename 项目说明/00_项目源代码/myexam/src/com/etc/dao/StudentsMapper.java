package com.etc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.etc.entity.Students;
import com.etc.entity.Sturesult;
import com.etc.util.PageBean;


@Repository(value = "StudentsDao")
public interface StudentsMapper {
	
	/**
	 * 泽玲
	 * 分页查询
	 * @param stuid
	 * @return pb
	 */
	

	List<Students> selectStudentsByPage(PageBean pb);

	/**
	 * 查询记录数
	 * 
	 * @param pb
	 * @return
	 */
	public int selectStudentsCount(PageBean pb);
	
	    
	/**
	 * 
	 * 根据主键删除
	 * @param stuid
	 * @return int
	 */
    int deleteByPrimaryKey(Integer stuid);
    
    
    /**
     * 批量删除
     * @param ids
     * @return
     */
    public int delete(String[] ids);

    /**
     * 增加一个学生记录
     * @param record
     * @return
     *   
     */
    int insert(Students record);
    
    int insertStudents(Students record);
     /**
      * 
      * 对字段进行判断再增加(如果为Null就忽略增加)
      * @param record
      * @return
      */
    int insertSelective(Students record);
    
    /**
     * 查询学生所有信息
     * @param stuid
     * @return
     */
   List<Students> selectAllStudent();
   /**
    * 自定义一个根据准考证获取学生信息的方法实现
    * @param pb
    * @return
    */
   public Students selectStudentsBystuno(String stuno);
    
    /**
     * 
     * 对字段进行判断再修改(如果为Null就忽略更新)
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Students record);
     
    
    /**
     * 根据主键修改信息
     * @param record
     * @return
     */
    int updateByPrimaryKey(Students record);

  
	public Students userLogin(@Param("stuno")String stuno,@Param("stupwd")String stupwd);
}