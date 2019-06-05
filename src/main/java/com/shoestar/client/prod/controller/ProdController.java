package com.shoestar.client.prod.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoestar.client.prod.service.ProdInsService;
import com.shoestar.client.prod.service.ProdService;
import com.shoestar.client.prod.vo.ProdInsVO;
import com.shoestar.client.prod.vo.ProdVO;
import com.shoestar.common.exception.BadRequestException;
import com.shoestar.common.exception.ResourceNotFoundException;

import lombok.AllArgsConstructor;

/**
 * 상품 관련을 처리하는 컨트롤러
 * @author 배정훈
 */
@Controller
@AllArgsConstructor
@RequestMapping("/product/*")
public class ProdController {
	
	private ProdService prodService;
	private ProdInsService prodInsService;
	
	
	/**
	 * 상품 검색 정보를 읽어오는 메서드
	 * @param pvo 검색 필터를 담은 ProdVO 객체
	 * @return 검색 결과를 JSON 형태로 담은 List
	 */
	@RequestMapping(value="/getList", method=RequestMethod.GET, produces={MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public List<ProdVO> getList(ProdVO pvo) {
		List<ProdVO> list = prodService.prodList(pvo);
		
		return list;
	}
	
	/**
	 * 상품 리스트 표시 화면
	 * @return productList.jsp
	 */
	@GetMapping(value="/showList")
	public String showList() {
		return "client/product/productList";
	}
	
	
	/**
	 * 상품 단일 정보를 읽어오는 메서드
	 * @return 검색 결과를 "prodVO"에 담아 productDetail.jsp 반환
	 * @throws 검색 결과가 없을 경우 404 에러
	 */
	@RequestMapping(value="/prod", method=RequestMethod.GET)
	public String showDetail(Integer pi_no, Integer pd_no, Integer color, Model model) throws ResourceNotFoundException, BadRequestException {
		ProdVO pvo = new ProdVO();
		ProdInsVO pivo = new ProdInsVO();
		
		ProdVO prodInfo = null;
		ProdInsVO pinsInfo = null;
		
		if(pi_no != null) {
			pivo.setPi_no(pi_no);
			prodInfo = prodService.prodDetailByIns(pivo);
			pinsInfo = prodInsService.pinsDetail(pivo);
		} else if(pd_no != null) {
			pvo.setPd_no(pd_no);
			if(color != null)
				pvo.setColor(color);
			prodInfo = prodService.prodDetail(pvo);
			pinsInfo = prodInsService.pinsDetailByColor(pvo);
		} else {
			throw new BadRequestException("잘못 된 요청입니다.");
		}
		
		if(pinsInfo == null || prodInfo == null) {
			throw new ResourceNotFoundException("해당 제품을 찾을 수 없습니다.");
		}
		
		model.addAttribute("prod", prodInfo);
		model.addAttribute("pins", pinsInfo);
		
		return "client/product/productDetail";
	}
	
	
	@RequestMapping(value="/pinsList", method={RequestMethod.GET}, produces={MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public List<ProdInsVO> pinsList(ProdVO pvo) {
		List<ProdInsVO> result = prodInsService.pinsListByProd(pvo);
		return result;
	}
}