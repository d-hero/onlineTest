package com.etc.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.etc.dao.QuestionsMapper;
import com.etc.entity.Qtype;
import com.etc.entity.Questions;
import com.etc.service.IQuestionsService;
import com.etc.util.PageBean;
import com.etc.util.PageBeanQuestion;
import com.etc.util.PageBeanQuestionC;
import com.etc.util.PageData;
@Service(value="QuestionsService")
public class QuestionsService implements IQuestionsService {
@Resource(name="QuestionsDao")
    QuestionsMapper dao;
	@Override
	public PageBeanQuestionC queryAll(int Exid,int Typeid, int number) {
		// TODO Auto-generated method stub
		//获取question的集合
		List<Questions> list= dao.queryAll(Exid,Typeid, number);
         int count =  dao.selectQuestionsExid(Exid, Typeid);
        PageBeanQuestionC pb = new PageBeanQuestionC();
        pb.setCount(count);
        pb.setList(list);
		return pb;
	}
	/**
	 * 传入pagedata的值 返回question的data
	 */
	@Override
	public PageData<Questions> selectQuestionsByType(int Exid, int typeid,
			int page, int rows) {
		// TODO Auto-generated method stub
		int start = 0;
		if (page > 1)
			start = (page - 1) * rows;

		// 此时需要根据page rows构建一个pageBean对象
		PageBeanQuestion pb = new PageBeanQuestion();
		pb.setPagesize(rows);
		pb.setStart(start);
		pb.setExid(Exid);
		pb.setTypeid(typeid);
        

		//将实例化的pb对象传递给dao 完成查询 得到total data集合对象
		List<Questions> data = dao.selectQuestionsByType(pb);
		for(Questions q: data)
			System.out.println("内部q"+q.getContent());
		
		int total = dao.selectQuestionsCount(pb);
		//将集合对象 totoal的值 封装成一个PageData对象
		
		PageData<Questions> pd = new PageData<Questions>(data, total, rows, page);
		return pd;
	}

@Override
	public List<Qtype> queryType() {
		// TODO Auto-generated method stub
	List<Qtype> list=dao.queryType();
		return list;
	}
/**
 * 修改试题内容
 */
@Override
public int updateByPrimaryKey(Questions record) {
	// TODO Auto-generated method stub
	return dao.updateByPrimaryKey(record);
}

/**
 * 新增试题
 */
@Override
public int insert(Questions record) {
	// TODO Auto-generated method stub
	return dao.insert(record);
}
/**
 * 批量删除
 */
@Override
public int deleteByPrimaryallKey(String[] ids) {
	// TODO Auto-generated method stub
	return dao.deleteByPrimaryallKey(ids);
}


//查询题目的总记录数
@Override
	public int selectQuestionsExid(int Exid, int Typeid) {
		// TODO Auto-generated method stub
		return dao.selectQuestionsExid(Exid, Typeid);
	}


//自我检测
@Override
public List<Questions> queryall(int Typeid, int number) {
	return dao.queryall(Typeid, number);
}
}
