package com.shoestar.client.prod.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shoestar.client.prod.service.ProdService;
import com.shoestar.client.prod.vo.ProdVO;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/product/*")
public class ProdController {
	
	private ProdService prodService;
	
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String prodList(ProdVO pvo, Model model) {
		
		model.addAttribute("prodList", prodService.prodList(pvo));
		return "client/product/productList";
	}
}
