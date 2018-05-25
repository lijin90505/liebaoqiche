package com.ibest.druid.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ibest.framework.common.persistence.BaseController;

@Controller
@RequestMapping(value="${adminPath}/druid")
public class DruidController extends BaseController{
	
	private static final Logger logger =LoggerFactory.getLogger(DruidController.class);
	
	@RequestMapping(value="/monitor")
	public String monitorData(){
		/*ModelAndView model = new ModelAndView();
		model.setViewName("redirect:http://123.125.218.30:60005/druid/login.html");*/
		/*model.setViewName("redirect:http://localhost:8080/druid/login.html");*/
		return "module/druid/druid";
	}
	
}
