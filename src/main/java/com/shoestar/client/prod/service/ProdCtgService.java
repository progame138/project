package com.shoestar.client.prod.service;

import java.util.List;

import com.shoestar.client.prod.vo.ProdColorVO;
import com.shoestar.client.prod.vo.ProdCtgVO;

public interface ProdCtgService {
	
	public List<ProdCtgVO> getProdCtgList(ProdCtgVO pcvo);
	
	public List<Integer> getAvailableSize(ProdCtgVO pcvo);
	
	public List<ProdColorVO> getAvailableColor(ProdCtgVO pcvo);
}
