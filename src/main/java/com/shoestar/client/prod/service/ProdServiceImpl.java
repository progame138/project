package com.shoestar.client.prod.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoestar.client.prod.dao.ProdDao;
import com.shoestar.client.prod.vo.ProdVO;

import lombok.Setter;

/**
 * Prod 전담 서비스
 * @author 배정훈
 */
@Service
public class ProdServiceImpl implements ProdService {
	
	@Setter(onMethod_ = @Autowired)
	private ProdDao prodDao;

	@Override
	public List<ProdVO> prodList(ProdVO pvo) {
		List<ProdVO> list = prodDao.prodList(pvo);
		
		return list;
	}

}
