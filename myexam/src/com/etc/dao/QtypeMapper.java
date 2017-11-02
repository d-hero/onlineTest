package com.etc.dao;

import org.springframework.stereotype.Repository;

import com.etc.entity.Qtype;
/**
 * 试题类别
 * @author 刘鹤麟
 *
 */

@Repository(value="qtypedao")
public interface QtypeMapper {
    int deleteByPrimaryKey(Integer typeid);

    int insert(Qtype record);

    int insertSelective(Qtype record);

    Qtype selectByPrimaryKey(Integer typeid);

    int updateByPrimaryKeySelective(Qtype record);

    int updateByPrimaryKey(Qtype record);
}