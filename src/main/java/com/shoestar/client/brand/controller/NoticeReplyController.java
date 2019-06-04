package com.shoestar.client.brand.controller;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shoestar.client.brand.Service.NoticeReplyService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping(value="/replies")
@Log4j


public class NoticeReplyController {
	
	private NoticeReplyService noticeReplyService;
	
/*	@GetMapping(value="/all/{no_no}",
				produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
							MediaType.APPLICATION_JSON_VALUE})
	


});*/
	

}
