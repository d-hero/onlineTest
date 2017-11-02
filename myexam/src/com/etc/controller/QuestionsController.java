package com.etc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.etc.entity.Exatype;
import com.etc.entity.Qtype;
import com.etc.entity.Questions;
import com.etc.service.impl.QuestionsService;
import com.etc.util.PageBeanQuestionC;
import com.etc.util.PageData;
//随机生成题目
@Controller
@RequestMapping("question")
public class QuestionsController {
	@Resource(name="QuestionsService")
	QuestionsService qs;
	 @RequestMapping(value="addQuestions", method=RequestMethod.GET)
	  @ResponseBody
	public ModelAndView queryAll(Integer type1,Integer type2,Integer type3){
		 ModelAndView mv=new ModelAndView();
         Integer sum=0;
			List<Questions> listA= qs.queryall(1, type1);
			for(Questions q:listA){
				sum+=q.getScore();
			}
         
			List<Questions> listB= qs.queryall(2, type2);
			for(Questions q:listB){
				sum+=q.getScore();
			}
			
			List<Questions> listC= qs.queryall(3, type3);
			
			for(Questions q:listC){
				sum+=q.getScore();
			}
			
			System.out.println("listA:"+listA);
			System.out.println("listB:"+listB);
			System.out.println("listC:"+listC);
			mv.addObject("listA", listA);
			mv.addObject("listB", listB);
			mv.addObject("listC", listC);
			mv.addObject("sum", sum);
			mv.setViewName("student/testpaper");
			
			return mv;
	}
	  
	  
	  @RequestMapping(value="question02", method=RequestMethod.GET)
	  @ResponseBody
	public List<Qtype> queryType(){
		  System.out.println(qs.queryType());
		return qs.queryType();
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
		@RequestMapping(value = "query", method = RequestMethod.GET)
		@ResponseBody  //返回的是json对象
		public Map queryAllByPage(int page, int rows, int Exid, int typeid) {
			// 不要看到 System.out.println log4j
			// js alert();		
			Map map = new HashMap();
			System.out.println("page="+page);
			System.out.println("rows="+rows);
			PageData<Questions> pd = qs.selectQuestionsByType(Exid, typeid, page, rows);  //1 rows其实就是pageBean中的那个pagesize	
			map.put("rows", pd.getData());
			for(Questions s:pd.getData()){
				System.out.println(s.getContent());
			}
			System.out.println(pd.getTotal());
			map.put("total", pd.getTotal());		
			return map;
		}
		/**
		 * 刘鹤麟 
		 * 添加试题
		 * @return返回添加是否成功
		 */
		@RequestMapping(value="add",method=RequestMethod.POST)
		@ResponseBody
       public boolean addQuestion(Questions question,int Exid,int typeid) {
			Exatype e = new Exatype();
			e.setExid(Exid);
			System.out.println(e);
			Qtype q = new Qtype();
			q.setTypeid(typeid);
			question.setqType(q);
			question.setExaType(e);
			question.setStatus(0);
			System.out.println(q);
		return qs.insert(question)>0;
	}
		/**
		 * 刘鹤麟 
		 * 删除试题
		 * @return返回删除是否成功
		 */
		@RequestMapping(value="delete",method=RequestMethod.POST)
		@ResponseBody
       public boolean deleteQuestion(String ids) {
	   String[] allid = ids.split(",");
		return qs.deleteByPrimaryallKey(allid)>0;
	}	
		
		
		/**
		 * 刘鹤麟 
		 * 修改试题
		 * @return返回修改是否成功
		 */
		@RequestMapping(value="update",method=RequestMethod.POST)
		@ResponseBody
       public boolean updateQuestion(Questions question,int Exid,int typeid,Integer questionsid) {
			
			Exatype e = new Exatype();
			question.setQuestionsid(questionsid);
			e.setExid(Exid);
			Qtype q = new Qtype();
			q.setTypeid(typeid);
			question.setqType(q);
			question.setExaType(e);
			question.setStatus(0);
		return qs.updateByPrimaryKey(question)>0;
	}	
		
	  @RequestMapping(value="question03", method=RequestMethod.GET)
      @ResponseBody
	public Map selectQuestionsExid(int Exid,int Typeid,int number){
		 // System.out.println(qs.queryType());
		  Map map = new HashMap();
		  PageBeanQuestionC pb = qs.queryAll(Exid, Typeid, number);
		  map.put("list",pb.getList());
		  map.put("count", pb.getCount());
		  
		return  map;
	}
    
	  
	  /**
	   * 自我检测，类型，数量联动
	   * @param Exid
	   * @param Typeid
	   * @return
	   */
	  @RequestMapping(value="selectQTypeCount", method=RequestMethod.POST)
	  @ResponseBody
	  public int selectQuestionsExid(Integer Exid,Integer Typeid){
		  // System.out.println(qs.queryType());
		  System.out.println("类型id"+Exid+"试题类型id："+Typeid);
		  return qs.selectQuestionsExid(Exid, Typeid);
	}
	
}
