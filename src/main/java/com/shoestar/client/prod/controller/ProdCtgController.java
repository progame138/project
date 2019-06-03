package com.shoestar.client.prod.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.shoestar.client.prod.service.ProdCtgService;
import com.shoestar.client.prod.vo.ProdCtgVO;

import lombok.Setter;

@RestController
@RequestMapping("/pctg/*")
public class ProdCtgController {
	
	@Setter(onMethod_ = @Autowired)
	private ProdCtgService prodCtgService;
	
	
	@RequestMapping(value="/getList", method=RequestMethod.GET, produces={MediaType.APPLICATION_JSON_UTF8_VALUE})
	public List<ProdCtgVO> getProdCtgList(ProdCtgVO pcvo) {
		List<ProdCtgVO> result = prodCtgService.getProdCtgList(pcvo);
		
		return result;
	}
	
	@RequestMapping(value="/getSize", method=RequestMethod.GET, produces={MediaType.APPLICATION_JSON_UTF8_VALUE})
	public List<Integer> getAvailableSize(ProdCtgVO pcvo) {
		List<Integer> result = prodCtgService.getAvailableSize(pcvo);
		
		return result;
	}
}
