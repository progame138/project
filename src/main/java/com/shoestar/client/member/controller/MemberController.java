/*package com.shoestar.client.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shoestar.client.member.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/member/*")
@Log4j
@AllArgsConstructor

public class MemberController{
	private MemberService memberService;
	
	
		//////////////////////[회원가입 폼 처리]////////////////////////
		@RequestMapping(value="/join", method = RequestMethod.GET)
		public String joinForm(Model model){
			log.info("member 호출 성공");
			return "client/member/join";
		}
	
}*/