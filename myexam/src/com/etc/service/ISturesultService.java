package com.etc.service;

import java.util.List;

import com.etc.entity.Students;
import com.etc.entity.Sturesult;
import com.etc.entity.Tpaper;
import com.etc.util.PageData;
/**
 * 成绩分页显示，根据试卷ID查看相应的试卷
 * @author 丁佳丽
 * @version 1.0
 * @create date 2017年6月15日14:59:42
 *
 */
public interface ISturesultService {

    /**
     * 分页显示（面向管理员）
     * @param pb 
     * @return
     */
    public PageData<Sturesult> showByPage(int page,int pagesize);
    /**
     * 分页显示（面向学生）
     * @param pb 
     * @return
     */
    public Students showByPageForStu(int stuid);
   
    
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
    
    
    
    int insertSelective(Sturesult record);
    
    int updateByPrimaryKeySelective(Sturesult record);
    
}
