package com.shoestar.client.event.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	/***
	 * 이벤트 리스트 페이지 구현하기
	 * @param evo
	 * @return
	 */
	@RequestMapping("/eventList")
	public String eventList() {
		log.info("eventList 호출 성공");
		
		return "client/event/eventList";
	}
	
}
