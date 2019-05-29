package com.shoestar.client.prod.service;

import java.util.List;

import com.shoestar.client.prod.vo.ProdVO;

public interface ProdService {
	
	public List<ProdVO> prodList(ProdVO pvo);
}
