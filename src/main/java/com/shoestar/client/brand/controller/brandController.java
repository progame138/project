package com.shoestar.client.brand.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shoestar.client.notice.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/brand/*")
@AllArgsConstructor

public class brandController {
	private NoticeService noticeService;
	
	// 브랜드 첫ㅂ
	
}
