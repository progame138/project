package com.shoestar.admin.cscenter.controller;

import org.springframework.stereotype.Controller;
//import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cscenter/*")
//@AllArgsConstructor
public class AdminHomeCSController {
	
	
	//private 
	//어드민 고객센터 홈링크
	@GetMapping("/admin")
	public String csAdminMain() {
		log.info("admin CS센터 홈 호출");
		return "admin/cscenter/csAdminMain";
	}
}
