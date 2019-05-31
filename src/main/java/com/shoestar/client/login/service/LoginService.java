package com.shoestar.client.login.service;

import com.shoestar.client.login.vo.LoginVO;

public interface LoginService {

	public LoginVO loginSelect(String mem_id, String mem_pwd);

	public LoginVO userIdSelect(String mem_id);
}
