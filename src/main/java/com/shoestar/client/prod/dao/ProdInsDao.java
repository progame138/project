package com.shoestar.client.prod.dao;

import java.util.List;

import com.shoestar.client.prod.vo.ProdInsVO;
import com.shoestar.client.prod.vo.ProdStockVO;
import com.shoestar.client.prod.vo.ProdVO;

public interface ProdInsDao {
	
	public List<ProdInsVO> pinsListByProd(ProdVO pvo);
	
	public ProdInsVO pinsDetail(ProdInsVO pivo);
	
	public ProdInsVO pinsDetailByColor(ProdVO pvo);
	
	public ProdStockVO pstListByPins(ProdInsVO pivo);
}
