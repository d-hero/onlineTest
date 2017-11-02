package com.etc.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.etc.entity.Paper;


/**
 * 试卷信息类数据访问接口
 * @author Administrator
 *
 */
@Repository(value="PaperDao")
public interface PaperMapper {
    int deleteByPrimaryKey(Integer paperid);

    int insert(Paper record);

    int insertSelective(Paper record);

    Paper selectByPrimaryKey(Integer paperid);

    int updateByPrimaryKeySelective(Paper record);

    int updateByPrimaryKey(Paper record);
    
    /**
     * 加载对应试卷的试卷信息(学生端考试)
     * @param Tpaperid
     * @return
     */
    public List<Paper> selectPaperByid(Integer Tpaperid);
}