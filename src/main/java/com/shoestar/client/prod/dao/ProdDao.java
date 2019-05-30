package com.shoestar.client.prod.dao;

import java.util.List;

import com.shoestar.client.prod.vo.ProdVO;

public interface ProdDao {
	
	public List<ProdVO> prodList(ProdVO pvo);
}
