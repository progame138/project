package com.shoestar.client.cscenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cscenter/*")
@Log4j
//@AllArgsConstructor
public class QNAController {
		//1:1문의게시판
		@GetMapping("/qnaBoard")
		public String csMain() {
			return "client/cscenter/qnaBoard";
		}
}
