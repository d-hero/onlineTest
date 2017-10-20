package com.etc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.etc.dao.TpaperMapper;
import com.etc.entity.Tpaper;
import com.etc.service.ITpaperService;


/**
 * 考卷业务逻辑层实现类
 * @author Administrator
 *
 */
@Service(value="TpaperService")
public class TpaperService implements ITpaperService {

	@Resource(name="TpaperDao")
	private TpaperMapper tm; 
	
	
	/**
	 * 加载对应类型考卷(学生端考试)
	 */
	@Override
	public List<Tpaper> selectAllTpaper(Integer Exid) {
		// TODO Auto-generated method stub
		return tm.selectAllTpaper(Exid);
	}


	@Override
	public Tpaper selectPaperByid(Integer Tpaperid) {
		// TODO Auto-generated method stub
		return tm.selectPaperByid(Tpaperid);
	}
	

	public int insert(String tpaperid, String exid, String tname) {
		return tm.insert(tpaperid,exid,tname);
	}
	

}
