package com.etc.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.etc.entity.Backups;
import com.etc.entity.Exatype;
import com.etc.entity.Students;
import com.etc.entity.Sturesult;
import com.etc.entity.Tpaper;
import com.etc.service.ISturesultService;
import com.etc.service.impl.BackupsService;
import com.etc.service.impl.TpaperService;



@Controller
@RequestMapping(value="Tpaper")
public class TpaperController {

	
	@Resource(name="TpaperService")
	private TpaperService ts;
	
	
	@Resource(name = "BackupsService")
	private BackupsService bs;
	
	
	@Resource
	private ISturesultService ibs;
	
	@RequestMapping(value="insert",method=RequestMethod.GET)
	public String insert(String tpaperid,String exid, String tname){
		//在加载对应考试类型的试卷时，需选在备份试题卷中中查找该学生是否有正在考试或已经考完的试卷
		System.out.println("进入到insert");
		int n= ts.insert(tpaperid,exid,tname);
		if(n==1) 
			System.out.println("添加成功");
		else 
			System.out.println("添加失败");
		return "admin/paperManage";
	}
	
	@RequestMapping(value="selectAll/{exid}",method=RequestMethod.GET)
	public ModelAndView selectall(@PathVariable("exid") int exid){
		//在加载对应考试类型的试卷时，需选在备份试题卷中中查找该学生是否有正在考试或已经考完的试卷
		Students s=new Students();
		s.setStuid(1);
		List<Backups> listB=bs.selectAll(s);
		System.out.println(listB);
		System.out.println("查询所有的考试类型");
		ModelAndView mv=new ModelAndView();		
		List<Tpaper> list=ts.selectAllTpaper(exid);
		if(list.isEmpty()){
			System.out.println("为空,没有任何该类型试卷");
		}
		System.out.println(list);
		mv.addObject("list", list);
		mv.addObject("listB", listB);
		mv.setViewName("student/tpaper");
		return mv;
	}
	
	
	
	/**
	 * 进行考试，增加对应学生成绩记录
	 * @param tpaperid
	 * @param model
	 * @return
	 */
	@RequestMapping(value="selectPaper/{tpaperid}",method=RequestMethod.GET)
	public ModelAndView selectall(@PathVariable("tpaperid") int tpaperid,Model model){
		System.out.println("查询所有的属于该试卷的考题id"+tpaperid);
		ModelAndView mv=new ModelAndView();
		Tpaper list=ts.selectPaperByid(tpaperid);
		String tname="";
		if(list.getTname()!=null){//试卷名称
		tname=list.getTname();}
		model.addAttribute("tname", tname);
		System.out.println(list);
		mv.addObject("list", list);
		mv.addObject("listA", list.getQuestionsA());
		mv.addObject("listB", list.getQuestionsB());
		mv.addObject("listC", list.getQuestionsC());
		mv.setViewName("student/paper");
		
		
		Sturesult s=new Sturesult();
		Students st=new Students();
		st.setStuid(1);
		 Tpaper t=new Tpaper();
		 t.setTpaperid(1);
		 s.setStu(st);
		 s.setTpaper(t);
		 ibs.insertSelective(s);
		return mv;
	}
	
	/**
	 * 更新，每隔一段时间进行数据更新
	 * @param etime
	 * @param stime
	 * @param bk
	 * @return
	 */
	@RequestMapping(value = "addBackup", method = RequestMethod.POST)
	@ResponseBody
	public boolean add(String etime,String stime,Integer result, Backups bk) {
		boolean flag=false;
		System.out.println("result="+result);
		System.out.println("开始时间："+etime);
		System.out.println("剩余时间："+stime);
		String[] eTime=etime.split(" ");
		String[] sTime=stime.split(" ");
 	    bk.setExatime(time(eTime));
	    bk.setSurplustime(time(sTime));
		System.out.println("加载的试卷答案等:" + bk);
		bk.setBktype(0);//备份卷状态0位还未考完
		Students s=new Students();
		s.setStuid(1);
		bk.setStudent(s);
		if((time(eTime)==0)&&(time(sTime)==0)){
			bk.setBktype(1);//时间都为0时，状态设置1，为已考完试
		}
		
		System.out.println("加载后"+bk);
		//先判断是要新增、还是修改
		if(bs.selectCount(bk)>0){//有记录则是修改
			flag=bs.updateBackups(bk)>0;
			System.out.println("bk修改");
			
			Sturesult ss=new Sturesult();
			Students st=new Students();
			s.setStuid(1);
			 Tpaper t=new Tpaper();
			 t.setTpaperid(1);
			 ss.setStu(st);
			 ss.setTpaper(t);
			 ss.setSturesult(result);
			 ibs.updateByPrimaryKeySelective(ss);//提交学生成绩表成绩
			
		}else{//反之，则是新增记录
			System.out.println("bk新增");
			flag = bs.insert(bk)>0;
		}
		
		
		return flag;
	}
	
	/**
	 * 时间转换， 1分12秒，转换为1*60+12=72s
	 * @param time
	 * @return
	 */
	private int time(String[] time){
//		return Integer.valueOf(time[1])*60+Integer.valueOf(time[3])*60;
		for(int i=0;i<time.length;i++){
			System.out.println(i+"次："+time[i]);
		}
		//输出后是第3和四索引处才是时间分钟和秒
		return  Integer.valueOf(time[3])*60+Integer.valueOf(time[4]);

	}
}
