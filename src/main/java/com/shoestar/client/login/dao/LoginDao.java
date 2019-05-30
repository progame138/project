package com.shoestar.client.login.dao;

import com.shoestar.client.login.vo.LoginVO;

public interface LoginDao {

	public LoginVO loginSelect(LoginVO lvo);

	public LoginVO memIdSelect(String mem_id);

}
