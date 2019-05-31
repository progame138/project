package com.shoestar.client.notice.dao;

import java.util.List;

import com.shoestar.client.notice.vo.NoticeVO;

public interface NoticeDao {
	
	public List<NoticeVO> noticeList(NoticeVO nvo);
	
	public NoticeVO noticeDetail(NoticeVO nvo);

}
