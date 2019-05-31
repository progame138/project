package com.shoestar.client.event.service;

import java.util.List;

import com.shoestar.client.event.vo.EventVO;

public interface EventService {
	public List<EventVO> eventList(EventVO evo);
	public EventVO eventDetail(EventVO evo);
}
