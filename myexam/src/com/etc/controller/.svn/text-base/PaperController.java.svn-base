package com.etc.controller;


import java.util.List;

import javax.annotation.Resource;




import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;





import com.etc.entity.Paper;
import com.etc.service.impl.PaperService;



@Controller
@RequestMapping(value="Paper")
public class PaperController {

	
	@Resource(name="PaperService")
	private PaperService ps;
	
	
	@RequestMapping(value="selectAll/{tpaperid}",method=RequestMethod.GET)
	public ModelAndView selectall(@PathVariable("tpaperid") int tpaperid,Model model){
		System.out.println("查询所有的属于该试卷的考题");
		ModelAndView mv=new ModelAndView();
		List<Paper> list=ps.selectPaperByid(tpaperid);
		String tname="";
		for(Paper paper:list){
			System.out.println(paper.getTpaper().getTname());
			tname=paper.getTpaper().getTname();
		}
		model.addAttribute("tname", tname);
		System.out.println(list);
		mv.addObject("list", list);
		mv.setViewName("student/paper");
		return mv;
	}
}
