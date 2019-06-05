package com.shoestar.client.prod.service;

import java.util.List;

import com.shoestar.client.prod.vo.ProdInsVO;
import com.shoestar.client.prod.vo.ProdVO;

public interface ProdService {
	
	public List<ProdVO> prodList(ProdVO pvo);
	
	public ProdVO prodDetail(ProdVO pvo);
	
	public ProdVO prodDetailByIns(ProdInsVO pivo);
}
