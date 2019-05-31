package com.shoestar.admin.event.dao;


import java.util.List;

import com.shoestar.client.event.vo.EventVO;

public interface AdminEventDAO {
	public List<EventVO> eventList(EventVO evo);
}
