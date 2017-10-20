package com.etc.service;

import java.util.List;

import com.etc.entity.Qtype;
import com.etc.entity.Questions;
import com.etc.util.PageBeanQuestionC;
import com.etc.util.PageData;

public interface IQuestionsService {
	public PageBeanQuestionC queryAll(int Exid,int Typeid, int number);
	public  List<Qtype> queryType();
	
	public PageData<Questions> selectQuestionsByType(int Exid,int typeid,int page, int rows);
	
	public int updateByPrimaryKey(Questions record);
	
	public   int insert(Questions record);
	
	public   int deleteByPrimaryallKey(String[] ids);
	
	
	public int selectQuestionsExid(int Exid, int Typeid);
	
	public List<Questions> queryall(int Typeid, int number);
}
