package com.etc.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.etc.entity.Backups;
import com.etc.entity.Students;
import com.etc.util.PageBeanBK;



@Repository(value="Backupsdao")
public interface BackupsMapper {
    int deleteByPrimaryKey(Object[] id);

    int insert(Backups record);


    Backups selectByPrimaryKey(Integer backupsid);


    int updateByPrimaryKeySelective(Backups record);
    List<Backups> selectAllBackups(PageBeanBK pbb);
    int selectBackupsCount(PageBeanBK pbb);
    
    /**
     * 确定是否是修改还是插入新的备份
     * @param bk
     * @return
     */
    public Integer selectCount(Backups bk);
    
    
    /**
     * 通过试卷id和学生id修改
     * @param bk
     * @return
     */
    public int updateBackups(Backups bk);
    
    /**
     * 通过学生id，查找对应备份记录，进行试卷加载界面 的相应判断
     * @param s
     * @return
     */
    public List<Backups> selectAll(Students s);
}