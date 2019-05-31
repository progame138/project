package com.shoestar.client.event.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoestar.client.event.service.EventService;
import com.shoestar.client.event.vo.EventVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/event/*")	//    /client/event/* 지금 어드민에서 클라이언트 접근하려면 client붙여야 하는데 매핑값이..
@Log4j
@AllArgsConstructor
public class EventController {
	
	private EventService eventService;
	
	/***
	 * 이벤트 리스트 페이지 구현하기
	 * @param evo
	 * @return
	 */
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String eventList(EventVO evo, Model model) {
		log.info("eventList 호출 성공");
		
		model.addAttribute("eventList", eventService.eventList(evo));
		
		
		return "client/event/eventList";
	
	}
	
	/** 
	 * 이벤트 상세정보글 구현
	 * @param EventVO
	  * @return String
	 */
//	 @ResponseBody
	 @GetMapping(value="/detail")
	 public String eventDetail(@ModelAttribute("data") EventVO evo, Model model) {
		 log.info("eventDetail 호출 성공");
		 log.info("evo = " + evo);
		 
		 EventVO detail = eventService.eventDetail(evo);
		 model.addAttribute("detail", detail);
		 
		 return "client/event/eventDetail";
	 }
	
	
	
	
	
}
