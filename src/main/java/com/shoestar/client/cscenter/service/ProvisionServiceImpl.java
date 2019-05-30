package com.shoestar.client.cscenter.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shoestar.client.cscenter.dao.ProvisionDao;
import com.shoestar.client.cscenter.vo.ProvisionVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProvisionServiceImpl implements ProvisionService {
	private ProvisionDao pdao;
	
	@Override
	public ProvisionVO provisionList(ProvisionVO pvo) {
		ProvisionVO provisionList = new ProvisionVO();
		provisionList = pdao.provisionList(pvo);
		
		if( provisionList != null) {
			provisionList.setP_content(provisionList.getP_content().toString().replaceAll("\n", "<br>"));
		}
		return provisionList;
	}
}
