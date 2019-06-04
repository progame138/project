package com.shoestar.client.brand.dao;

import java.util.List;

import com.shoestar.client.brand.vo.NoticeReplyVO;

public interface NoticeReplyDao {
	public List<NoticeReplyVO> replyList(Integer no_no);
	
	public int replyInsert(NoticeReplyVO nvo);
	
	public int replyDelete(Integer re_no);
	
	public int replyUpdate(NoticeReplyVO nvo);
	
	public NoticeReplyVO replySelect(Integer re_no);
	
	public int replyCnt(int no_no);
	
	public int replyChoiceDelete(int no_no);

}
