package com.etc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.etc.dao.AdminsMapper;
import com.etc.entity.Admins;
import com.etc.service.IAdminsService;
import com.etc.util.PageBean;
import com.etc.util.PageData;

@Service(value="AdminsService")
public class AdminsService implements IAdminsService {
     
	 @Resource(name="AdminsDao")
	private AdminsMapper adminsdao;
	
	@Override
	public PageData<Admins> selectAdminsByPage(int page, int rows,
			String  Adminname) {
		PageBean pb = new PageBean();
		if ( Adminname == null)
			 Adminname = "";
		int start = 0;
		if (page > 1)
			start = (page - 1) * rows;
		pb.setStr(Adminname);
		pb.setStart(start);
		pb.setPagesize(rows);
		// TODO Auto-generated method stub
		List<Admins> data = adminsdao.selectAdminsByPage(pb);
		int total = adminsdao.selectAdminsCount(pb);
		PageData<Admins> pd = new PageData<Admins>(data, total, rows, page);
		return pd;
	
	}

	@Override
	public int selectAdminsCount(PageBean pb) {
		// TODO Auto-generated method stub
		return  adminsdao.selectAdminsCount(pb);
	}

	@Override
	public int delete(String[] ids) {
		// TODO Auto-generated method stub
		return  adminsdao.delete(ids);
	}

	@Override
	public int insertSelective(Admins record) {
		// TODO Auto-generated method stub
		return  adminsdao.insertSelective(record);
	}

	@Override
	public int updateByPrimaryKeySelective(Admins record) {
		// TODO Auto-generated method stub
		return  adminsdao.updateByPrimaryKeySelective(record);
	}
	public List<Admins> selectAllAdmins() {
		// TODO Auto-generated method stub
		return adminsdao.selectAllAdmins();
	}

}
