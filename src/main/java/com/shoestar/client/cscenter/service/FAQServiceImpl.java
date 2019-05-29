package com.shoestar.client.cscenter.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shoestar.client.cscenter.dao.FAQDao;
import com.shoestar.client.cscenter.vo.FAQVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
//@AllArgsConstructor
public class FAQServiceImpl implements FAQService {
	
	private FAQDao fdao;
	/*
	@Override
	public List<FAQVO> faqList(FAQVO fvo) {
		log.info("faqList..............");
		List<FAQVO> list = null;
		list = fdao.faqList(fvo);
		return list;
	}
	*/
	
}
