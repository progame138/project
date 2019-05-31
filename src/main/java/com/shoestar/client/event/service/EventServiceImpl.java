package com.shoestar.client.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shoestar.admin.event.dao.AdminEventDAO;
import com.shoestar.client.event.dao.EventDAO;
import com.shoestar.client.event.vo.EventVO;


import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class EventServiceImpl implements EventService {

	@Setter(onMethod_ = @Autowired)
	private EventDAO eventDao;

	@Setter(onMethod_ =@Autowired)
	private AdminEventDAO aEventDao;
	
	// 이벤트 목록 구현
	@Override
	public List<EventVO> eventList(EventVO evo) {
		log.info("목록 불러오기");
		
		List<EventVO> list = null;
		

		list = aEventDao.eventList(evo);
		
		return list;
	
	}

	// 이벤트 글 상세 구현
	@Override
	public EventVO eventDetail(EventVO evo) {
		EventVO detail = new EventVO();
		detail = aEventDao.eventDetail(evo);
		
		return detail;
	}


}
