package com.yc.web.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.bean.Student_baseinfo;
import com.yc.biz.StudentBiz;
import com.yc.biz.StudentjobBiz;
import com.yc.web.dto.JsonModel;

@RestController
// 类注解 同时使用@Controller 和 @ResponseBody
public class StudentControllers {
	@Resource(name = "studentBizImpl")
	private StudentBiz studentBiz;
	@Resource(name = "studentjobBizImpl")
	private StudentjobBiz studentjobBiz;

	@RequestMapping("/Student_baseinfoReg.action")
	// TODO:赋值电话
	public JsonModel register1(Student_baseinfo student_baseinfo, HttpServletRequest request, HttpSession session) {
		JsonModel jm = new JsonModel();

		try {
			boolean result1 = studentBiz.validate(student_baseinfo);
			if (result1) {
				boolean result2 = studentBiz.register1(student_baseinfo);
				if (result2) {
					jm.setCode(1);
					jm.setMsg("注册成功");
					session.setAttribute("Student", student_baseinfo);
					session.setAttribute("loginusername", null);	
				}
			} else {
				jm.setCode(0);
				jm.setMsg("注册失败，该用户已经被注册");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jm;

	}

	/**
	 * 基本信息完善
	 * 
	 * @param student_baseinfo
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/Student_update.action")
	public JsonModel update(Student_baseinfo student_baseinfo, HttpServletRequest request, HttpSession session) {
		JsonModel jm = new JsonModel();
		 String province = request.getParameter("province");
			String city = request.getParameter("city");
			String school = request.getParameter("school");
			String path = province + "_" + city + "_" + school;
			student_baseinfo.setStu_school(path);
		
			boolean result = studentBiz.register2(student_baseinfo);
			if (result) {
				jm.setCode(1);
				jm.setMsg("基本信息修改成功");
			}else{
				jm.setCode(0);
				jm.setMsg("基本信息修改失败");
			}
		
		return jm;
	}
	/**
	 * 登录
	 * 
	 * @param student_baseinfo
	 * @param request
	 * @param session
	 * @return
	 */
	@PostMapping("/Student_login.action")
	public JsonModel login(Student_baseinfo student_baseinfo, HttpServletRequest request, HttpSession session) {
		JsonModel jm = new JsonModel();
		Student_baseinfo s = studentBiz.login(student_baseinfo);
		if (s != null) {
			
			session.setAttribute("Student", s);
			session.setAttribute("loginusername", null);		
			List<String> loginlist = new ArrayList<String>();
			loginlist.add(s.getStu_username());
			List<String> loginlist2 = (List<String>) session.getAttribute("loginlist");// TODO:判断为不为空
			if (loginlist2 != null) {
				for (Object object : loginlist2) {
					if (object.equals(s.getStu_username())) {
						jm.setMsg("用户已经在线");
						jm.setCode(2);
						return jm;
					}
				}
			}
			session.setAttribute("loginlist", loginlist);
			jm.setMsg("登录成功");
			jm.setCode(1);
			int stu_id = s.getStu_id();
			session.setAttribute("stu_id", stu_id);
		} else {
			jm.setMsg("用户名或密码错误");
			jm.setCode(0);
		}

		return jm;
	}

	/**
	 * 下线
	 * 
	 * @param student_baseinfo
	 * @param request
	 * @param session
	 * @return
	 */
	public JsonModel notlogin(Student_baseinfo student_baseinfo, HttpServletRequest request, HttpSession session) {
		JsonModel jm = new JsonModel();
		Student_baseinfo s = studentBiz.login(student_baseinfo);
		List<String> loginlist2 = (List<String>) session.getAttribute("loginlist");
		for (String stu : loginlist2) {
			if (stu.equals(s.getStu_username())) {
				loginlist2.remove(s.getStu_username());
				session.setAttribute("loginlist", loginlist2);
				jm.setCode(1);
				jm.setMsg("下线成功");
			}
			jm.setCode(0);
		}
		return jm;
	}






}
