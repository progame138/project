package com.shoestar.client.cscenter.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.shoestar.client.cscenter.service.FAQService;
import com.shoestar.client.cscenter.vo.FAQVO;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cscenter/*")
@Log4j
@AllArgsConstructor
public class FAQController {
	
	private FAQService faqService;
	
	/*
	 * @InitBinder public void initBinder(WebDataBinder binder) {
	 * binder.registerCustomEditor(FAQVO.class, "faq_date", new
	 * StringTrimmerEditor(true)); }
	 */
	
	@RequestMapping(value="/faqList", method=RequestMethod.GET)
	public String faqList(@ModelAttribute("data") FAQVO fvo, Model model) {
		List<FAQVO> faqList = faqService.faqList(fvo);
		model.addAttribute("faqList", faqList);
		
		return "client/cscenter/faqList";
	}
	
	//FAQ게시판 상세정보
	@RequestMapping(value="/faqDetail", method=RequestMethod.GET)
	public String faqDetail(@ModelAttribute("data") FAQVO fvo, Model model) {
		log.info("FAQ 상세페이지 호출 성공");
		
		FAQVO detail = faqService.faqDetail(fvo);
		model.addAttribute("detail", detail);
		
		return "client/cscenter/faqDetail";
	}
	
	
	//고객센터 링크
	@GetMapping("/")
	public String csMain() {
		return "client/cscenter/csMain";
	}
	
	
}
