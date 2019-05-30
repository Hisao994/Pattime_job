package com.yc.web.controllers;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.bean.Applyinfo;
import com.yc.bean.Student_baseinfo;
import com.yc.bean.Student_wantedjob;
import com.yc.biz.ApplyinfoBiz;
import com.yc.biz.StudentjobBiz;
import com.yc.web.dto.JsonModel;



@RestController //类注解 同时使用@Controller 和 @ResponseBody
public class StudentjobControllers {
	
	@Resource(name="studentjobBizImpl")
	private StudentjobBiz studentjobBiz;
	
	@Resource(name="applyinfoBizImpl")
	private ApplyinfoBiz applyinfoBiz;
	  //TODO 添加简历
	  @PostMapping("Studentjob.action")
	public JsonModel registerjob(Student_wantedjob student_wantedjob,HttpServletRequest request,HttpSession session){
		  JsonModel jm=new JsonModel();
		
		   String province = request.getParameter("province");
			String city = request.getParameter("city");
			String school = request.getParameter("school");
			String path = province + "_" + city + "_" + school;
			student_wantedjob.setWorkplace(path);
			
			//查询学生意向是否存在
		  Student_wantedjob ss=studentjobBiz.studentjob(student_wantedjob);
		  if(ss==null){  
			 boolean result=studentjobBiz.registerjob(student_wantedjob);
			 if(result){
				 jm.setCode(1);
		         jm.setMsg("简历提交成功");
		         session.setAttribute("student_wantedjob", student_wantedjob);
			 }else{
			      
			 jm.setCode(0);
			 jm.setMsg("简历提交失败");
			 }
		  }else{
			  jm.setCode(0);    //TODO:更新操作
		  }

		  return jm;
		  
	  }
	  
	  
	  
	  
 //TODO 修改求职意向
	  public JsonModel updatejob(Student_wantedjob student_wantedjob,HttpServletRequest request,HttpSession session){
		  JsonModel jm=new JsonModel();
		  int stu_id=(int) session.getAttribute("stu_id");
		  student_wantedjob.setStu_id(stu_id);
		  Student_wantedjob ss=studentjobBiz.studentjob(student_wantedjob);
		  if(ss!=null){
			 
			  
			 boolean result=studentjobBiz.updatejob(student_wantedjob);
			 if(result){
				 jm.setCode(1);
		         jm.setMsg("简历修改成功");
			 }else{
			      
			 jm.setCode(0);
			 jm.setMsg("简历修改败");
			 }
		  }else{
			  jm.setCode(0);    //TODO:更新操作
		  }

		  return jm;
	  }
	
	//查看应聘信息  
	  @RequestMapping("findApplyJob.action")
	  public JsonModel Applyjob(HttpServletRequest request,HttpSession session){
		  JsonModel jm=new JsonModel();
		  Student_baseinfo s=(Student_baseinfo) session.getAttribute("Student");
		  Applyinfo applyinfo=new Applyinfo();
		  applyinfo.setStu_id(s.getStu_id());
		  List<Applyinfo> list=applyinfoBiz.selectJobWithApply(applyinfo);
			if(list.size()>0&&list!=null){
				 jm.setCode(1);
		         jm.setObj(list);
			}else{
				jm.setCode(0);
				jm.setMsg("无申请记录");
			}

		  return jm;
	  }
	  
		//查看应聘信息  
	  @RequestMapping("updateStudent.action")
	  public JsonModel updateStudent(HttpServletRequest request,HttpSession session){
		  JsonModel jm=new JsonModel();
		  int stu_id=(int) session.getAttribute("stu_id");
//		  Student s=studentBiz
//			if(list.size()>0&&list!=null){
//				 jm.setCode(1);
//		         jm.setObj(list);
//			}else{
//				jm.setCode(0);
//				jm.setMsg("无申请记录");
//			}

		  return jm;
	  }
}
