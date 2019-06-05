package com.shoestar.client.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.shoestar.client.login.service.LoginService;
import com.shoestar.client.login.vo.LoginVO;
import com.shoestar.client.member.service.MemberService;
import com.shoestar.client.member.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/member/*")
@Log4j
@AllArgsConstructor

	public class MemberController{
		private MemberService memberService;
		private LoginService loginService;
		
		
			//////////////////////[회원가입 폼 처리]////////////////////////
			@RequestMapping(value="/join", method = RequestMethod.GET)
			public String joinForm(Model model){
				log.info("join get방식에 의한 메서드 호출 성공");
				return "client/member/join";
			}
			
	/*
	 * //회원수정 폼 (임시)
	 * 
	 * @RequestMapping(value="/modify", method = RequestMethod.GET) public String
	 * modifyForm(){ log.info("modify 호출 성공"); return "client/member/modify"; }
	 */
			
			
			
			/////////////////////[사용자 아이디 중복 체크 메서드]///////////////
			@ResponseBody
			@RequestMapping(value="/userIdConfirm", method=RequestMethod.POST)
			public String  userIdConfirm(@RequestParam("mem_id")String mem_id){
				int result = memberService.userIdConfirm(mem_id);
		
				return String.valueOf(result);
			}
			
			//////////////////////[회원가입 처리]//////////////////////////
			@RequestMapping(value="/join", method = RequestMethod.POST)
			public ModelAndView memberInsert(@ModelAttribute MemberVO mvo){
				
				log.info("join post방식에 의한 메서드 호출 성공");
				ModelAndView mav = new ModelAndView();
				
			int result = 0;
			result = memberService.memberInsert(mvo);
			
			switch(result){
			case 1:
					mav.addObject("codeNumber", 1); //유저 아이디가 이미 존재함
					mav.setViewName("client/member/join");
					break;
			case 3:
					mav.addObject("codeNumber", 3);
					mav.setViewName("client/member/join_success"); //새로운 맴버 추가시, 로그인페이지 이동
					break;
			default:
					mav.addObject("codeNumber", 2); //맴버추가 실패
					mav.setViewName("client/member/join");
					break;
			}
			return mav;
		}
			
			///////////////////////[회원 수정폼]/////////////////////////////
			//@SessionAttribute 메소드에 @SessionAttribute가 있을경우 파라미터로 지정된 이름으로 등록된 세션정보를 읽어와서 변수에 할당한다
			@RequestMapping(value="/modify", method = RequestMethod.GET)
			public ModelAndView memberModify(@SessionAttribute("login") LoginVO login){
				log.info("modify get 방식에 의한 메서드 호출 성공");
				ModelAndView mav = new ModelAndView();
				
				
				
				if(login==null){
					mav.setViewName("client/member/login");
					return mav;
				}
				
				MemberVO vo = memberService.memberSelect(login.getMem_id());
				mav.addObject("member", vo);
				mav.setViewName("client/member/modify");
				return mav;
			}
			
			//////////////////////[회원수정처리 AOP 예외 처리 전]/////////////////////////////
			@RequestMapping(value="/modify", method = RequestMethod.POST)
			public ModelAndView memberModifyProcess(MemberVO mvo, @SessionAttribute("login") LoginVO login, ModelAndView mav){
				log.info("modify post방식에 의한 메서드 호출 성공");
				log.info("mvo" + mvo);
				log.info("login" + login);
				if(login==null){
					mav.setViewName("client/member/login");
					return mav;
				}
				mvo.setMem_id(login.getMem_id());
				MemberVO vo = memberService.memberSelect(mvo.getMem_id());
				
				if(loginService.loginSelect(mvo.getMem_id(), mvo.getOldUserPwd()) == null){
					mav.addObject("codeNumber", 1);
					mav.addObject("member", vo);
					mav.setViewName("client/member/modify");
					return mav;
				}
				
				memberService.memberUpdate(mvo);
				mav.setViewName("redirect:/member/logout");
				return mav;
			}
			
			/////////////////////[회원 탈퇴처리 AOP 예외 처리 전]/////////////////////////
			@RequestMapping("/delete")
			public ModelAndView memberDelete(@SessionAttribute("login") LoginVO login){
				log.info("delete.do get방식에 의한 메서드 호출 성공");
				
				ModelAndView mav = new ModelAndView();
				
				if(login==null){
					mav.setViewName("client/member/login");
					return mav;
				}
				
				int errCode = memberService.memberDelete(login.getMem_id());
				switch(errCode){
				case 2:
						mav.setViewName("redirect:/member/logout");
						break;
				case 3:
						mav.addObject("codeNumber", 3);
						mav.setViewName("client/member/login");
						break;
				}
				return mav;
			}
			
		
	}