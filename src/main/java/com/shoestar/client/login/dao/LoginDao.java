package com.shoestar.client.login.dao;

import com.shoestar.client.login.vo.LoginVO;

public interface LoginDao {
	
	public LoginVO userIdSelect(String mem_id);

	public LoginVO loginSelect(LoginVO lvo);

	



}
