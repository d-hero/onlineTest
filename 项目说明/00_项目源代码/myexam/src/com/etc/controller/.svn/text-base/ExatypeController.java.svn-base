package com.etc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.etc.entity.Admins;
import com.etc.entity.Exatype;
import com.etc.entity.Qtype;
import com.etc.service.impl.ExatypeService;
import com.etc.util.PageData;



@Controller
@RequestMapping(value="ExaType")
public class ExatypeController {

	
	@Resource(name="ExatypeService")
	private ExatypeService es;
	
	@RequestMapping(value="selectAll",method=RequestMethod.POST)
	public ModelAndView selectall(){
		System.out.println("查询所有的考试类型");
		ModelAndView mv=new ModelAndView();
		List<Exatype> list=es.selectAllExatype();
		System.out.println(list);
		mv.addObject("list", list);
		mv.setViewName("student/exatype");
		return mv;
	}
	
	   /**
	    * 使用ajax加载学生端考试类别
	    * @return
	    */
	  @RequestMapping(value="selecttype", method=RequestMethod.GET)
	  @ResponseBody
	public List<Exatype> queryType(){
		  System.out.println(es.queryExaType());
		  return es.queryExaType();
	}
	
		/**
		 * 分页查询
		 * @param page
		 * @param rows
		 * @param 
		 * @return
		 */
		@RequestMapping(value = "query", method = RequestMethod.GET)
		@ResponseBody
		public Map queryAllByPage(int page, int rows, String exatype) {
			
			System.out.println("分页查询显示" + page + ","
					+ rows + ", Exatype:" + exatype);

			Map map = new HashMap();
			
			PageData<Exatype> pd = es.selectExatypeByPage(page, rows, exatype);
			map.put("page",pd.getPage());
			map.put("rows", pd.getData());
			map.put("total", pd.getTotal());
			System.out.println(map);
			return map;
		}
		//批量删除 
		@RequestMapping(value = "delete", method = RequestMethod.POST)
		@ResponseBody
		public boolean deleExatype(String ids){
			String[] id=ids.split(",");
		return	es.delete(id)>0;
		}
		
		//增加
		@RequestMapping(value = "add", method = RequestMethod.POST)
		@ResponseBody
		public boolean addExatype(Exatype exatype){
			return es.insertSelective(exatype)>0;
		}
		//修改
		@RequestMapping(value ="update/{exid}", method = RequestMethod.POST)
		@ResponseBody
		public boolean updateExatype(@PathVariable(value="exid") int exid,Exatype exatype){
			return es.updateByPrimaryKeySelective(exatype)>0;
			
		}
}
