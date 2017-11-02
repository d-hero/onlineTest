package com.etc.dao;

import java.util.List;

import org.springframework.stereotype.Repository;


import com.etc.entity.Tpaper;


/**
 * 试卷接口
 * @author Administrator
 *
 */
@Repository(value="TpaperDao")
public interface TpaperMapper {
    int deleteByPrimaryKey(Integer tpaperid);

 /*   int insert(Tpaper record);*/
    
    int insert(String tpaperid, String exid, String tname);

    int insertSelective(Tpaper record);

    Tpaper selectByPrimaryKey(Integer tpaperid);

    int updateByPrimaryKeySelective(Tpaper record);

    int updateByPrimaryKey(Tpaper record);
    
    /**
     * 加载对应考试类型的试卷(学生端考试)
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

	
    
}