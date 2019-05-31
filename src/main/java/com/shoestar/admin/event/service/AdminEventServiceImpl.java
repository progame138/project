package com.shoestar.admin.event.service;

//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

//import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


//import com.fasterxml.jackson.core.JsonProcessingException;
//import com.fasterxml.jackson.databind.ObjectMapper;
import com.shoestar.client.event.dao.EventDAO;
import com.shoestar.admin.event.dao.AdminEventDAO;
import com.shoestar.client.event.vo.EventVO;


import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class AdminEventServiceImpl implements AdminEventService {

	@Setter(onMethod_ =@Autowired)
	private AdminEventDAO aEventDao;
	
	// 이벤트 목록 구현
	@Override
	public List<EventVO> AdmineventList(EventVO evo) {
		log.info("목록 불러오기");
		
		List<EventVO> list = null;
		

		list = aEventDao.AdmineventList(evo);
		
		return list;
	
	}
	
	// 이벤트 글 입력 구현
	/*
	@Override
	public String eventInsert(EventVO evo) {
		String result = "";
		
		List<MultipartFile> list= evo.getFile();
		
		
		try {
			
		// 다중 처리
		// 사진 업로드 두개 처리 방법 
		//   get(0) ev_img : 원본만 저장 > 이벤트 내용이미지  || get(1) ev_thumb : 썸네일+원본 저장 > 이벤트 썸네일
		if(!list.isEmpty()) { // 안 비어 있으면
		
			log.info("비어있지 않음");
			
			int z = 0;
			int o = 1;
			
			if(list.get(z) != null ) {
				String fileName1 = FileUploadUtil.fileUpload(evo.getFile().get(z), "eventImage");
				evo.setEv_img(fileName1);
			} else if (list.get(o) != null) {
				String fileName2 = FileUploadUtil.fileUpload(evo.getFile().get(o), "eventThumb");
				evo.setEv_thumb(fileName2);
			}

		}
		
		result = eventDao.eventList(evo);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}*/



}
