package com.shoestar.client.prod.dao;

import java.util.List;

import com.shoestar.client.prod.vo.ProdInsVO;

public interface ProdInsDao {
	
	public List<ProdInsVO> getList(ProdInsVO pivo);
}
