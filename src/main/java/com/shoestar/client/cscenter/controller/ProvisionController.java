package com.shoestar.client.cscenter.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shoestar.client.cscenter.service.ProvisionService;
import com.shoestar.client.cscenter.vo.ProvisionVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cscenter/*")
@Log4j
@AllArgsConstructor
public class ProvisionController {
	
	private ProvisionService provisionService;
	
	@RequestMapping(value="/provision", method=RequestMethod.GET)
	public String provisionList(@ModelAttribute("data") ProvisionVO pvo ,Model model) {
		
		ProvisionVO provisionList = provisionService.provisionList(pvo);
		
		model.addAttribute("provisionList", provisionList);
		
		return "client/cscenter/provision";
	}
}
