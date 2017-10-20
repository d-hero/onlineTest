package com.etc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.etc.dao.SturesultMapper;
import com.etc.entity.Students;
import com.etc.entity.Sturesult;
import com.etc.entity.Tpaper;
import com.etc.service.ISturesultService;
import com.etc.util.PageBean;
import com.etc.util.PageData;
@Service(value="SturesultService")
public class SturesultService implements ISturesultService {
	//注入一个SturesultDao
	@Resource
	private SturesultMapper SturesultDao;

	/**
	 *  分页显示（面向管理员，显示学生的ID和学生的姓名）
	 */
	@Override
	public PageData<Sturesult> showByPage(int page,int pagesize) {
		// 判断起始的记录数
		int start=0;
		if(page>1)
			start=(page-1)*pagesize;
		PageBean pb=new PageBean(start, pagesize);
		//调用方法，查找数据
		List<Sturesult> data=SturesultDao.showByPage(pb);
		//查找总记录数
		int total=SturesultDao.countNum(pb);
		PageData<Sturesult> pageDate=new PageData<Sturesult>(data, total, pb.getPagesize(), pb.getStart());
		
		return pageDate;
	}
	/**
	 *  分页显示（面向学生，不显示学生的ID和学生的姓名）
	 */
	@Override
	public Students showByPageForStu(int stuid) {
		
		return SturesultDao.showByPageForStu(stuid);
	}

	/**
	 * 根据试卷ID显示对应的试卷
	 */
	@Override
	public Tpaper showPaper(int tpaperid) {
	
		//不能简单的返回 得到tpaper中的属性  set  再返回
		Tpaper t=new Tpaper();
		Tpaper tpaper= SturesultDao.showPaper(tpaperid);
		
//		t.setTname(tpaper.getTname());
//		tpaper.getPaper().getOrderno()
//		t.setPaper(t.);
		
//		return t;
		return SturesultDao.showPaper(tpaperid);
	}
	
	
	/**
	 * 查询类型一的数量
	 */
	@Override
	public Integer countType1(int typeid,int tpaperid) {
		return SturesultDao.countType1(typeid,tpaperid);
	}
	@Override
	public int insertSelective(Sturesult record) {
		// TODO Auto-generated method stub
		return SturesultDao.insertSelective(record);
	}
	@Override
	public int updateByPrimaryKeySelective(Sturesult record) {
		// TODO Auto-generated method stub
		return SturesultDao.updateByPrimaryKeySelective(record);
	}
	
	
	
	
	
	
	
	
	
}
