package com.shoestar.client.event.vo;


import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class EventVO {
	private int ev_no; // 이벤트 번호
	private String ev_title; // 이벤트 제목
	private String ev_content; // 이벤트 내용
	private List<MultipartFile> file; // 파일이 하나 이상일때는 배열 또는 list로 
	private String ev_img; // 이벤트 이미지
	private String ev_thumb; // 이벤트 썸네일
	private Date ev_date; // 이벤트 등록일
	private Date ev_edate; // 이벤트 만료일
	
	
	
}
