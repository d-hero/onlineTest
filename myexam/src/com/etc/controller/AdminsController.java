package com.etc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.etc.entity.Admins;
import com.etc.service.impl.AdminsService;
import com.etc.util.PageData;

@SuppressWarnings("all")
@Controller
@RequestMapping("Admins")
public class AdminsController {

		@Resource(name = "AdminsService")
		private AdminsService as;

		
		/**
		 * 分页查询
		 * @param page
		 * @param rows
		 * @param stuname
		 * @return
		 */
		@RequestMapping(value = "query", method = RequestMethod.GET)
		@ResponseBody
		public Map queryAllByPage(int page, int rows, String Adminname) {
			
			System.out.println("分页查询显示" + page + ","
					+ rows + ", Adminname:" + Adminname);

			Map map = new HashMap();
			
			PageData<Admins> pd = as.selectAdminsByPage(page, rows, Adminname);
			map.put("page",pd.getPage());
			map.put("rows", pd.getData());
			map.put("total", pd.getTotal());
			System.out.println(map);
			return map;
		}
		
	
		
		/**
		 * 增加学生信息
		 * @param students
		 * @return
		 */
	
		@RequestMapping(value = "add", method = RequestMethod.POST)
		@ResponseBody
		  public boolean addAdmins (Admins admins){
			System.out.println("Students:"+admins);
			return as.insertSelective(admins)>0;
			
		}
		
         /**
          * 删除学生信息
          * @param ids
          * @return
          */

		// //http://localhost:8080/xiaomi/users/delUsers/1 delete
		@RequestMapping(value = "delete", method = RequestMethod.POST)
		@ResponseBody
		public boolean delAdmins(String ids) {
	    System.out.println("删除"+ids);
	    String[] id=ids.split(",");
	 	return as.delete(id)>0;

		}

		
		/**
		 * 修改学生信息
		 * @param id
		 * @param student
		 * @return
		 */
	
		 
		@RequestMapping(value ="update/{adminid}", method = RequestMethod.POST)
		@ResponseBody
		public boolean updateAdmins(@PathVariable(value = "adminid") int id,
				Admins  admins) {
			System.out.println("update");
			return as.updateByPrimaryKeySelective(admins)>0;
			
		}
		/**
		 * 查询管理员信息
		 * @param id
		 * @param student
		 * @return
		 */
		@RequestMapping(value="selectAll",method=RequestMethod.POST)
		@ResponseBody
		public boolean selectAllStudentLogin(String adminno,String adminpwd){
			boolean flag = false;
			List<Admins> list = as.selectAllAdmins();
			ModelAndView mv = new ModelAndView();
			
			for (Admins admins : list) {
				if(adminno.equals(admins.getAdminno()) && adminpwd.equals(admins.getAdminpwd()))
				{
					flag = true;
					//mv.addObject("result", adminno);
					//mv.setViewName("main");
				}
				}
			return flag;
		}
		
}
		
		