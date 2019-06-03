package com.shoestar.client.modify.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/modify/*")
@Log4j
@AllArgsConstructor
public class ModifyController {

	
	//회원수정 폼 (임시)
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public String modifyForm(){
		log.info("modify 호출 성공");
		return "client/member/modify";
	}
}
