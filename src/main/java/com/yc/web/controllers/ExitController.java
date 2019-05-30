package com.yc.web.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.bean.Merchant_baseinfo;
@Slf4j
@Controller
public class ExitController {
	
	
	@RequestMapping("/exit.action")
	public String Merchant_baseinfoReg(HttpServletRequest request, Merchant_baseinfo mbInfo, HttpSession session) {
		session.invalidate();
		return "index";
	}
}
