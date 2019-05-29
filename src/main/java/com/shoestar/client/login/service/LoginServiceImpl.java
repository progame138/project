package com.shoestar.client.login.service;

import org.springframework.stereotype.Service;

import com.shoestar.client.login.dao.LoginDao;
import com.shoestar.client.login.vo.LoginVO;

import lombok.Setter;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Setter(onMethod_=@Autowired)
	private LoginDao loginDao;

	@Override
	//로그인처리//
	public LoginVO loginSelect(String mem_id, String mem_pwd) {

		LoginVO lvo = new LoginVO();
		lvo.setMem_id(mem_id);
		lvo.setMem_pwd(mem_pwd);

		LoginVO vo = loginDao.loginSelect(lvo);
		return vo;
	}
	
	
}
