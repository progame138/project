package com.shoestar.client.member.dao;

import com.shoestar.client.member.vo.MemberVO;

public interface MemberDao {

	public MemberVO memberSelect(String mem_id);

	public int memberInsert(MemberVO mvo);

	public int memberUpdate(MemberVO mvo);

	public int memberDelete(String mem_id);


}
