package com.shoestar.client.event.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoestar.client.event.dao.EventDAO;
import com.shoestar.client.event.vo.EventVO;
import com.shoestar.common.file.FileUploadUtil;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class EventServiceImpl implements EventService {

	@Setter(onMethod_ = @Autowired)
	private EventDAO eventDao;
	
	@Override
	public String eventList(EventVO evo) {
		int result = 0;
		// 사진 업로드 두개 처리 방법 ? : 사진 1 : 썸네일+원본 저장 > 이벤트 썸네일  || 사진 2 : 원본만 저장 > 이벤트 내용이미지  
		if(evo.getFile() != null) {
			/*String fileName = FileUploadUtil.fileUpload(evo.getEv_file(), "event");
			evo.setEv_file(fileName);
			
			String*/
			
		}
		return "";
	}

}
