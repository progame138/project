package com.shoestar.client.cscenter.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shoestar.client.cscenter.service.FAQService;
import com.shoestar.client.cscenter.vo.FAQVO;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cscenter/*")
@Log4j

public class FAQController {
	
	
	@GetMapping("/test")
	public String test() {
		return "client/cscenter/csMain";
	}
}
