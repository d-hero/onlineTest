package com.etc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.etc.dao.StudentsMapper;
import com.etc.entity.Students;
import com.etc.service.IStudentsService;
import com.etc.util.PageBean;
import com.etc.util.PageData;


@Service(value="StudentsService")
public class StudentsService implements IStudentsService {

	 @Resource(name="StudentsDao")
	private StudentsMapper  studentsdao;
	
	
	@Override
	public int delete(String[] ids) {
		// TODO Auto-generated method stub
		return studentsdao.delete(ids);
	}

	@Override
	public int insertSelective(Students record) {
		// TODO Auto-generated method stub
		return studentsdao.insertSelective(record);
	}
	@Override
	public int insertStudents(Students record){
		
		return studentsdao.insertStudents(record);
	}
	
	

	@Override
	public int updateByPrimaryKeySelective(Students record) {
		// TODO Auto-generated method stub
		return studentsdao.updateByPrimaryKeySelective(record);
	}

	@Override
	public PageData<Students> selectStudentsByPage(int page, int rows,
			String stuname) {
		
			PageBean pb = new PageBean();
			if (stuname == null)
				stuname = "";
			int start = 0;
			if (page > 1)
				start = (page - 1) * rows;
			pb.setStr(stuname);
			pb.setStart(start);
			pb.setPagesize(rows);
			// TODO Auto-generated method stub
			List<Students> data = studentsdao.selectStudentsByPage(pb);
			int total = studentsdao.selectStudentsCount(pb);
			PageData<Students> pd = new PageData<Students>(data, total, rows, page);
			return pd;
		
	}
	@Override
	public List<Students> selectAllStudent() {
		// TODO Auto-generated method stub
		List<Students> list = studentsdao.selectAllStudent();
		return list;
	}

	@Override
	public Students selectStudentsBystuno(String stuno) {
		// TODO Auto-generated method stub
		return studentsdao.selectStudentsBystuno(stuno);
	}

	@Override
	public Students userLogin(String stuno, String stupwd) {
		// TODO Auto-generated method stub
		return studentsdao.userLogin(stuno,stupwd);
	}
}
