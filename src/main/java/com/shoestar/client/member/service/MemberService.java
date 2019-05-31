package com.shoestar.client.member.service;

import com.shoestar.client.member.vo.MemberVO;

public interface MemberService {

	public int userIdConfirm(String mem_id);

	public int memberInsert(MemberVO mvo);

	public MemberVO memberSelect(String mem_id);

	public int memberUpdate(MemberVO mvo);

	public int memberDelete(String mem_id);


}
