package com.etc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.etc.entity.Backups;
import com.etc.service.IBackupsService;
import com.etc.service.impl.BackupsService;
import com.etc.util.PageData;
/**                    
*功能描述:备份表controller 
* @author  张献
* @version  1.0 
* create Date 2017-06-14   */ 
@Controller
@RequestMapping("backupsapi")
public class BackupsController {

	@Resource(name = "BackupsService")
	private BackupsService bs;

	@RequestMapping(value = "add", method = RequestMethod.POST)
	@ResponseBody
	public String add(Backups bk) {
		System.out.println("user:" + bk);
		boolean flag = bs.insert(bk)>0;
		if (flag)
			return "true";
		return "false";
	}

	@RequestMapping(value="delete/{no}",method=RequestMethod.DELETE)
	@ResponseBody
	public boolean dele(@PathVariable("no") String no) {
		System.out.println("no :"+no);
		Object id[] = no.split(",");
		return bs.deleteByPrimaryKey(id)>0;
	}
	
	@RequestMapping(value="update/{id}",method=RequestMethod.POST)
	@ResponseBody
	public boolean update(Backups bk) {
		System.out.println(bk);
		return bs.updateByPrimaryKeySelective(bk)>0;
	}
	
	
	
	
	/**
	 * 
	 * @param page
	 *            页码
	 * @param rows
	 *            每页显示的行
	 * @param truename
	 *            模糊查询的条件(关键字)
	 * @return
	 */
	@RequestMapping(value = "show", method = RequestMethod.GET)
	@ResponseBody  //返回的是json对象
	public Map queryAllByPage(int page, int rows) {
		// 不要看到 System.out.println log4j
		// js alert();
	/*	System.out.println("我查询了所有用户~分页~~~~~~~~~~~~~~~~~~~~~" + page + ","
				+ rows + ", getusername:" + username);*/
         
		Map map = new HashMap();
		PageData<Backups> pd = bs.selectAllBackups(page, rows);  //1 rows其实就是pageBean中的那个pagesize
		System.out.println(pd);
		map.put("rows", pd.getData());
		map.put("total", pd.getTotal());
		System.out.println(map);
		return map;
	}

}
