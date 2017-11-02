package com.etc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.etc.dao.PaperMapper;
import com.etc.entity.Paper;
import com.etc.service.IPaperService;
/**
 * 试卷信息类的业务逻辑层实现类
 * @author Administrator
 *
 */
@Service(value="PaperService")
public class PaperService implements IPaperService {

	/**
	 * 注入对应的数据访问接口
	 */
	@Resource(name="PaperDao")
	private PaperMapper pm;
	
	 /**
     * 加载对应试卷的试卷信息(学生端考试)
     * @param Tpaperid
     * @return
     */
	@Override
	public List<Paper> selectPaperByid(Integer Tpaperid) {
		// TODO Auto-generated method stub
		return pm.selectPaperByid(Tpaperid);
	}

}
