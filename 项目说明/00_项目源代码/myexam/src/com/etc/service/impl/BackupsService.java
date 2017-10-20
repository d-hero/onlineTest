package com.etc.service.impl;

import java.util.List;




import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.etc.dao.BackupsMapper;
import com.etc.entity.Backups;
import com.etc.entity.Students;
import com.etc.service.IBackupsService;
import com.etc.util.PageBean;
import com.etc.util.PageBeanBK;
import com.etc.util.PageData;

/**                    
*功能描述:备份表Service 
* @author  张献
* @version  1.0 
* create Date 2017-06-13   */ 
/**
 * 
 * @param 删除的功能
 * @return
 */
@Service(value="BackupsService")
public class BackupsService implements IBackupsService {
	@Resource(name = "Backupsdao")
	private BackupsMapper Backupsdao ;
	@Override
	public int deleteByPrimaryKey(Object[] id) {
		// TODO Auto-generated method stub
		return Backupsdao.deleteByPrimaryKey(id);
	}
 
	/**
	   * 
	   * @param 增加的功能
	   * @return
	   */
	@Override 
	public int insert(Backups record) {
		// TODO Auto-generated method stub
		return Backupsdao.insert(record);
	}
	/**
	   * 
	   * @param 查询的功能
	   * @return
	   */
	@Override
	public Backups selectByPrimaryKey(Integer backupsid) {
		// TODO Auto-generated method stub
		return Backupsdao.selectByPrimaryKey(backupsid);
	}
	/**
	   * 
	   * @param修改的功能
	   * @return
	   */
	@Override
	public int updateByPrimaryKeySelective(Backups record) {
		// TODO Auto-generated method stub
		return Backupsdao.updateByPrimaryKeySelective(record);
	}
	/**
	   * 
	   * @param查询全部分页
	   * @return
	   */
	@Override
	public PageData<Backups> selectAllBackups(int page, int rows) {
		// TODO Auto-generated method stub
		int start = 0;
		if (page > 1)
			start = (page - 1) * rows;

		// 此时需要根据page rows构建一个pageBean对象
		PageBeanBK pbb = new PageBeanBK();
		pbb.setPagesize(rows);
		pbb.setStart(start);

		//将实例化的pb对象传递给dao 完成查询 得到total data集合对象
		List<Backups> data = Backupsdao.selectAllBackups(pbb);
		int total = Backupsdao.selectBackupsCount(pbb);
		//将集合对象 totoal的值 封装成一个PageData对象
		
		PageData<Backups> pd = new PageData<Backups>(data, total, rows, page);
		return pd;
	}

	@Override
	public Integer selectCount(Backups bk) {
		// TODO Auto-generated method stub
		return Backupsdao.selectCount(bk);
	}

	@Override
	public int updateBackups(Backups bk) {
		// TODO Auto-generated method stub
		return Backupsdao.updateBackups(bk);
	}
	
	@Override
	public List<Backups> selectAll(Students s) {
		// TODO Auto-generated method stub
		return Backupsdao.selectAll(s);
	}
	
}
