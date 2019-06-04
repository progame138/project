package com.shoestar.client.cscenter.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shoestar.client.cscenter.dao.QNADao;
import com.shoestar.client.cscenter.vo.QNAVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QNAServiceImpl implements QNAService {
	
	private QNADao qdao;
	
	@Override
	public List<QNAVO> qnaList(QNAVO qvo) {
		log.info("qnaList.......");
		List<QNAVO> list = null;
		list = qdao.qnaList(qvo);
		return list;
	}

}
