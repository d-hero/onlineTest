package com.etc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



import org.springframework.web.servlet.ModelAndView;

import com.etc.entity.DESUtil;
import com.etc.entity.Students;
import com.etc.service.impl.StudentsService;
import com.etc.util.PageData;

@Controller
@RequestMapping("Students")
public class StudentsController {

		@Resource(name = "StudentsService")
		private StudentsService ss;
		private String key = "S2L3M2A9I1S08902";
		
		/**
		 * 分页查询
		 * @param page
		 * @param rows
		 * @param stuname
		 * @return
		 * @throws Exception 
		 */
		@RequestMapping(value = "query", method = RequestMethod.GET)
		@ResponseBody
		public Map queryAllByPage(int page, int rows, String name) throws Exception {
			
			System.out.println("分页查询显示" + page + ","
					+ rows + ", stuname:" + name);

			Map map = new HashMap();
			PageData<Students> pd = ss.selectStudentsByPage(page, rows,name);
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
		  public boolean addStudents (Students students){
			String encryptData = null;
			String pwd = students.getStupwd();
			String sno = students.getStuno();
			try {
				 encryptData = DESUtil.encrypt(pwd, key);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			students.setStupwd(encryptData);
			students.setStuno(sno);
			int flag =ss.insertSelective(students);
			return flag>0;
			
		}
		
         /**
          * 删除学生信息
          * @param ids
          * @return
          */

		// //http://localhost:8080/xiaomi/users/delUsers/1 delete
		@RequestMapping(value = "delete", method = RequestMethod.POST)
		@ResponseBody
		public boolean delUsers(String ids) {
	    System.out.println("删除"+ids);
	    String[] id=ids.split(",");
	 	return ss.delete(id)>0;

		}
		/**
		 * 修改学生信息
		 * @param id
		 * @param student
		 * @return
		 */
	
		//http://localhost:8080/xiaomi/users/updateUsers/1   
		@RequestMapping(value ="update02/{stuid}", method = RequestMethod.POST)
		@ResponseBody
		public boolean updateEmp02(@PathVariable(value = "stuid") int id,
				Students  student) {
			System.out.println("update");
			
			return ss.updateByPrimaryKeySelective(student)>0;
			
		}
		
		/**
		 * 修改学生信息
		 * @param id
		 * @param student
		 * @return
		 */
	
		//http://localhost:8080/xiaomi/users/updateUsers/1   
		@RequestMapping(value ="update/{stuid}", method = RequestMethod.POST)
		@ResponseBody
		public ModelAndView updateEmp(
				Students  student,HttpServletRequest request) {
			Students s = (Students) request.getSession().getAttribute("stu");
			String stuno = s.getStuno();
			student.setStuno(stuno);
			request.getSession().setAttribute("stu", student);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("student/updatestudent");
			return mav;
			
		}
		/**
		 * 查询所有学生信息(学生注册)
		 * @param id
		 * @param student
		 * @return
		 */
		@RequestMapping(value="selectAll",method=RequestMethod.POST)
		@ResponseBody
		public boolean selectAllStudent(String stuno,HttpServletRequest request){
			boolean flag = true;
			List<Students> list = ss.selectAllStudent();
			for (Students students : list) {
				if(stuno.equals(students.getStuno()))
				{
					flag = false;					
				}
			}
			return flag;
		}
		/**
		 * 查询所有学生信息(学生登入)
		 * @param id
		 * @param student
		 * @return
		 * @throws Exception 
		 */
		@RequestMapping(value="selectAll1",method=RequestMethod.POST)
		@ResponseBody
		public boolean selectAllStudentLogin(String stuno,String stupwd,HttpServletRequest request) throws Exception{
			boolean flag = false;
			System.out.println("111111111111111111111111111111111111111111111111222222222222222222");
			List<Students> list = ss.selectAllStudent();
			System.out.println(stuno+" "+stupwd);
			for (Students students : list) {
				System.out.println("student.pwd= "+students.getStupwd());
				if(stuno.equals(students.getStuno()) && stupwd.equals(students.getStupwd()))
				{			   
					flag = true;
				}
			}
			System.out.println("得到的结果:"+flag);
			return flag;
		}
		/**
		 * 查询所有学生信息(学生登入)
		 * @return
		 */
		@RequestMapping(value="userLogin",method=RequestMethod.POST)
		public String userLogin(HttpServletRequest request,String stuno,String stupwd) {
			ModelAndView mad = new ModelAndView();
			System.out.println("stuno="+stuno);
			System.out.println("stupwd="+stupwd);
			Students stu = ss.userLogin(stuno,stupwd);
			System.out.println("userLogin查询完成");
			if(stu!=null){
				System.out.println("查询成功");
				System.out.println("userLogin"+stu.getStuno());
				request.getSession().setAttribute("stu",stu);
				return "student/index";
			}
			else 
				return "student/login";
		}
	/*	@RequestMapping(value="userLogin",method=RequestMethod.POST)
		public ModelAndView index(HttpServletRequest request,String stuno,String stupwd) {
			ModelAndView mad = new ModelAndView();
			System.out.println("stuno="+stuno);
			System.out.println("stupwd="+stupwd);
			Students stu = ss.userLogin(stuno,stupwd);
			System.out.println("userLogin查询完成");
			if(stu!=null){
				System.out.println("查询成功");
				request.getSession().setAttribute("stu",stu);
				mad.setViewName("student/index");
			}
			else {
				System.out.println("查询失败");
				mad.setViewName("student/login");
				mad.addObject("msg","用户名或者密码错误");
			}
			return mad;
		}*/
	/*	@RequestMapping(value="login",method=RequestMethod.POST)
		public ModelAndView index2(HttpServletRequest request,String stuno) {
		Students stu = ss.selectStudentsBystuno(stuno);
		request.getSession().setAttribute("stu",stu);
		System.out.println(stu.toString());
        ModelAndView mad = new ModelAndView();
        mad.setViewName("student/index");
		return mad;
		}*/
}
		
		