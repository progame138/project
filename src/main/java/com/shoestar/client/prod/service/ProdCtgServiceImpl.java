package com.shoestar.client.prod.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoestar.client.prod.dao.ProdCtgDao;
import com.shoestar.client.prod.vo.ProdColorVO;
import com.shoestar.client.prod.vo.ProdCtgVO;

import lombok.Setter;

@Service
public class ProdCtgServiceImpl implements ProdCtgService {
	
	@Setter(onMethod_ = @Autowired)
	private ProdCtgDao prodCtgDao;
	
	@Override
	public List<ProdCtgVO> getProdCtgList(ProdCtgVO pcvo) {
		List<ProdCtgVO> result = prodCtgDao.getProdCtgList(pcvo);
		
		return result;
	}

	@Override
	public List<Integer> getAvailableSize(ProdCtgVO pcvo) {
		List<Integer> result = prodCtgDao.getAvailableSize(pcvo);
		
		return result;
	}

	@Override
	public List<ProdColorVO> getAvailableColor(ProdCtgVO pcvo) {
		List<ProdColorVO> result = prodCtgDao.getAvailableColor(pcvo);
		return result;
	}
}
