package com.shoestar.admin.event.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoestar.admin.event.service.AdminEventService;
import com.shoestar.client.event.vo.EventVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/event/*")
@Log4j
@AllArgsConstructor
public class AdminEventController {
	
	private AdminEventService eventService;
	
	/***
	 * 이벤트 리스트 페이지 구현하기
	 * @param evo
	 * @return
	 */
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String eventList(/*@ModelAttribute("data")*/ EventVO evo, Model model) {
		log.info("eventList 호출 성공");
		
		//log.info("keyword : "+evo.getKeyword());
		//log.info("search : "+evo.getSearch());
		
		model.addAttribute("AdmineventList", eventService.AdmineventList(evo));
		
		return "admin/event/eventList";
	
	}
	
	
	//글쓰기 폼 출력하기
	@RequestMapping(value="/writeForm")
	public String writeForm(@ModelAttribute("data") EventVO evo) {
		log.info("writeForm 호출 성공");
		
		return "admin/event/eventWriteForm";
	}
	
	
	/**********************************************
	 * 글쓰기 구현하기
	 * @param galleryVO
	 * @return String
	 **********************************************/
	 @ResponseBody
	 @RequestMapping(value="/insert", method=RequestMethod.POST)
	 public String eventInsert(@ModelAttribute EventVO evo) {
		 log.info("eventInsert 호출 성공");
		 
		/* log.info("file name : " + evo.getFile().getOriginalFilename());*/
		
		 int result = 0;
		 String url ="";
			
			result = eventService.eventInsert(evo);

			if(result == 1) {
				url ="/event/eventList";
			}
			//redirect: 를 쓰면 스프링 내부에서 자동적으로 response.sendRedirect(url)를 호출해준다.
			return "redirect:"+url;
	 }
	
	
	/**
	 * 수정
	 */
	@RequestMapping(value="/update",  method=RequestMethod.GET)
	public String eventUpdate(@ModelAttribute("data") EventVO evo, Model model) {
		log.info("eventList 호출 성공");
		
		//log.info("keyword : "+evo.getKeyword());
		//log.info("search : "+evo.getSearch());
		
		model.addAttribute("eventUpdate", eventService.eventUpdate(evo));
		
		return "admin/event/eventUpdate";
	
	}
	
}
