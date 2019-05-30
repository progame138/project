package com.shoestar.client.cscenter.service;

import java.util.List;

import com.shoestar.client.cscenter.vo.FAQVO;

public interface FAQService {

	public List<FAQVO> faqList(FAQVO fvo);

	public FAQVO faqDetail(FAQVO fvo);

	//public List<FAQVO> faqList(FAQVO fvo);

	

}
