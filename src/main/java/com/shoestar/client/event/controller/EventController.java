package com.shoestar.client.event.controller;


import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.shoestar.client.event.service.EventService;
import com.shoestar.client.event.vo.EventVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/event/*")
@Log4j
@AllArgsConstructor
public class EventController {
	
	private EventService eventService;
	
	
	/* 파라미터를 바인딩할 때 자동으로 호출되는 @InitBinder를 이용해서 변환을 처리할 수 있다. */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
								// 대상, 필드명, 설정값
		binder.registerCustomEditor(MultipartFile.class, "file",
					new StringTrimmerEditor(true));
					// null을 설정하기 위한 클래스
	}
	
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
