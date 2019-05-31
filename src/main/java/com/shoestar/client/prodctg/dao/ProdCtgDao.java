package com.shoestar.client.prodctg.dao;

import java.util.List;

import com.shoestar.client.prodctg.vo.ProdCtgVO;

public interface ProdCtgDao {
	
	public List<ProdCtgVO> getProdCtgList(ProdCtgVO pcvo);
}