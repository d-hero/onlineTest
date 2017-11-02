package com.etc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.etc.dao.ExatypeMapper;
import com.etc.entity.Admins;
import com.etc.entity.Exatype;
import com.etc.service.IExatypeService;
import com.etc.util.PageBean;
import com.etc.util.PageBeanBK;
import com.etc.util.PageData;

@Service(value = "ExatypeService")
public class ExatypeService implements IExatypeService {

	@Resource(name = "exatypedao")
	private ExatypeMapper ed;

	@Override
	public List<Exatype> selectAllExatype() {
		// TODO Auto-generated method stub
		return ed.selectAllExatype();
	}

	@Override
	public List<Exatype> queryExaType() {
		// TODO Auto-generated method stub
		return ed.queryexaType();
	}

	/**
	 * 分页
	 */
	@Override
	public PageData<Exatype> selectExatypeByPage(int page, int rows,
			String exatype) {
		PageBean pb = new PageBean();
		if (exatype == null)
			exatype = "";
		int start = 0;
		if (page > 1)
			start = (page - 1) * rows;
		pb.setStr(exatype);
		pb.setStart(start);
		pb.setPagesize(rows);
		// TODO Auto-generated method stub
		List<Exatype> data = ed.selectExatypeByPage(pb);
		int total = ed.queryExaType(pb);
		PageData<Exatype> pd = new PageData<Exatype>(data, total, rows, page);
		return pd;
	}

	@Override
	public int queryExaType(PageBean pb) {
		// TODO Auto-generated method stub
		return ed.queryExaType(pb);
	}

	// 批量删除
	@Override
	public int delete(String[] ids) {
		// TODO Auto-generated method stub
		return ed.delete(ids);
	}

	// 增加
	@Override
	public int insertSelective(Exatype exatype) {
		// TODO Auto-generated method stub
		return ed.insertSelective(exatype);
	}

	// 修改
	@Override
	public int updateByPrimaryKeySelective(Exatype record) {
		// TODO Auto-generated method stub
		return ed.updateByPrimaryKeySelective(record);
	}
}
