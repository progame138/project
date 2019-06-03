
package com.shoestar.client.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shoestar.client.member.dao.MemberDao;
import com.shoestar.client.member.vo.MemberVO;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Setter(onMethod_=@Autowired)
	private MemberDao memberDao;

	@Override
	public int userIdConfirm(String mem_id) {
		int result;
		if(memberDao.memberSelect(mem_id) != null){
			result = 1;
		}else{
			result = 2;
		}
		return result;
	}

	@Transactional
	@Override
	public int memberInsert(MemberVO mvo) {
		
		int sCode = 2;
		if(memberDao.memberSelect(mvo.getMem_id()) != null){
			return 1;
		}else{
			try{
				sCode = memberDao.memberInsert(mvo);
				if(sCode == 1){
					return 3;
				}else{
					return 2;
				}
			}catch(RuntimeException e){
				e.printStackTrace();
				return 2;
			}
		}
	}

	@Override
	public MemberVO memberSelect(String mem_id) {
		MemberVO vo = memberDao.memberSelect(mem_id);
		return vo;
	}
	
	@Transactional
	@Override
	public int memberUpdate(MemberVO mvo) {
		int result = memberDao.memberUpdate(mvo);
		return result;
	}

	@Transactional
	@Override
	public int memberDelete(String mem_id) {
		int mCode, isSuccessCode=3;
		try{
			mCode = memberDao.memberDelete(mem_id);
			if(mCode==1){
				isSuccessCode = 2;
			}
		}catch(Exception e){
			e.printStackTrace();
			isSuccessCode = 3;
		}
		return isSuccessCode;
	}

}
