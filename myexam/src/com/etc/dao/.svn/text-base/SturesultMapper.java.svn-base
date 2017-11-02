package com.etc.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.etc.entity.Students;
import com.etc.entity.Sturesult;
import com.etc.entity.Tpaper;
import com.etc.util.PageBean;
/**
 * 成绩的显示, 点击详情可以显示试卷
 * @author 丁佳丽
 * @version 1.0
 * @create Date 2017年6月14日
 *
 */
@Repository(value="SturesultDao")
public interface SturesultMapper {
    int deleteByPrimaryKey(Integer srid);

    int insert(Sturesult record);

    int insertSelective(Sturesult record);

    Sturesult selectByPrimaryKey(Integer srid);

    int updateByPrimaryKeySelective(Sturesult record);

    int updateByPrimaryKey(Sturesult record);
    
    /**
     * 分页显示（面向管理员）
     * @param pb 
     * @return
     */
    public List<Sturesult> showByPage(PageBean pb);
    
    /**
     * 分页显示（面向学生）
     * @param pb 
     * @return
     */
    public Students showByPageForStu(int stuid);
    
    /**
     * 总记录数
     * @param pb
     * @return
     */
    public Integer countNum(PageBean pb);
    /**
     * 根据试卷ID显示相应的考卷
     * @param tpaperid  试卷ID
     * @return
     */
    public Tpaper showPaper(int tpaperid);
    
    /**
     * 查找试题类型一的题数
     * @param typeid
     * @return
     */
    public Integer countType1(int typeid,int tpaperid);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}