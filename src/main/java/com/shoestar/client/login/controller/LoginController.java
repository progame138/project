package com.shoestar.client.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.shoestar.client.login.service.LoginService;
import com.shoestar.client.login.vo.LoginVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@SessionAttributes("login")
@RequestMapping("/member/*")
@Log4j
@AllArgsConstructor

public class LoginController {
	private LoginService loginService;
	
	@ModelAttribute("login") //@SessionAttributes와 @ModelAttribute 같은값인 경우 클라이언트로 전송받은 값을 설정한다
	public LoginVO login(){
		return new LoginVO();
	}
	
	//////////////////////[로그인 폼 처리]////////////////////////
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String loginForm(){
		log.info("login 호출 성공");
		return "client/member/login";
	}
	
	/////////////////////[로그인 처리 (실패 횟수 제한 X)]//////////////////////////
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public ModelAndView loginInsert(@ModelAttribute LoginVO lvo, ModelAndView mav){
		log.info("login post 호출 성공");
		
		String mem_id = lvo.getMem_id();
		String mem_pwd = lvo.getMem_pwd();
		log.info(mem_id + " / " + mem_pwd);
		LoginVO loginCheckResult = loginService.loginSelect(mem_id, mem_pwd);
		
		//입력받은 아이디와 비밀번호로 DB확인 시, 일치 데이터가 존재하지 않으면
		if(loginCheckResult == null){
			mav.addObject("codeNumber", 1); //없을시 '1'
			mav.setViewName("client/member/login");
			return mav;
		}else{ //일치할 시
			mav.addObject("login", loginCheckResult);
			log.info("loginCheckResult"+loginCheckResult);
			mav.setViewName("client/member/login");
			return mav;
		}
	}
	
	///////////////////////[로그아웃 처리]///////////////////////////////////////
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus){
		sessionStatus.setComplete();
			return "redirect:/";
	}
	

}
