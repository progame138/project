package com.shoestar.admin.notice.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shoestar.admin.notice.service.AdminNoticeService;
import com.shoestar.client.notice.vo.NoticeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor

public class AdminNoticeController {
	@Inject // 서비스 객체 주입
	AdminNoticeService noticeService;
	
	// 공지사항 리스트 매핑
		@RequestMapping(value="/noticeList", method = RequestMethod.GET)
		public String noticeList(@ModelAttribute("data") NoticeVO nvo, Model model){
			log.info("noticeList 호출완료");
			
			List<NoticeVO> noticeList = noticeService.noticeList(nvo);
			model.addAttribute("notice", noticeList);
			
			return "client/brand/noticeList";
		}
	
	// 공지사항 상세조회
	/*@RequestMapping(value="/client/noticeDetail", method=RequestMethod.GET)
	
	public String NoticeDetail(@ModelAttribute("data") NoticeVO nvo, Model model){
		log.info("noticeDetail 호출");
		
		NoticeVO detail = noticeService.noticeDetail(nvo);
		model.addAttribute("detail", detail);
		
		return "notice/noticeDetail";
	}*/
	
	// 공지사항 글쓰기 폼 들어가기
	

}
