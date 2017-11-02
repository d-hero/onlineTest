package com.etc.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.etc.entity.Qtype;
import com.etc.entity.Questions;
import com.etc.util.PageBean;
import com.etc.util.PageBeanQuestion;
@Repository("QuestionsDao")
public interface QuestionsMapper {
    int deleteByPrimaryKey(Integer questionsid);

    int insert(Questions record);

    int insertSelective(Questions record);

    Questions selectByPrimaryKey(Integer questionsid);

    int updateByPrimaryKeySelective(Questions record);

    int updateByPrimaryKey(Questions record);
    //随机生成试卷 Typeid提型  number数量
	public List<Questions> queryAll(int Exid, int Typeid,int number);

    //通过试题类别和考试类别查询questions
	public List<Questions> selectQuestionsByType(PageBeanQuestion pb);
	//查询总记录数
	public int selectQuestionsCount(PageBeanQuestion pb);

    //typeid 题型  typename 题型名称
	public   List<Qtype> queryType();
	
	public   int deleteByPrimaryallKey(String[] ids);
	//查询题目的总记录数 
	public int selectQuestionsExid(int Exid,int Typeid);
	
	
	public List<Questions> queryall(int Typeid,int number);

}