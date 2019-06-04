package com.shoestar.admin.notice.dao;

import java.util.List;

import com.shoestar.client.notice.vo.NoticeVO;

public interface AdminNoticeDao {
	
	public List<NoticeVO> noticeList(NoticeVO nvo); // 게시판 목록보여주기
	
	public NoticeVO noticeDetail(NoticeVO nvo); // 상세정보창 보여주기
	
	public int noticeInsert(NoticeVO nvo); // 입력하기
	
	public int noticeUpdate(NoticeVO nvo); // 수정하기
	 
	public int noticeDelete(int no_no); // 삭제하기
	
	public int noticeListCnt(NoticeVO nvo); // 게시글 세기

}
