package com.shoestar.client.brand.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoestar.client.brand.dao.NoticeReplyDao;
import com.shoestar.client.brand.vo.NoticeReplyVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor

public class NoticeReplyServiceImpl implements NoticeReplyService{

	@Setter(onMethod_=@Autowired)
	private NoticeReplyDao noticeReplyDao;
	
	
	@Override
	public List<NoticeReplyVO> replyList(Integer no_no) {
		List<NoticeReplyVO> list = null;
		list = noticeReplyDao.replyList(no_no);
		return list;
	}

	@Override
	public int replyInsert(NoticeReplyVO nvo) {
		int result = 0;
		result = noticeReplyDao.replyInsert(nvo);
		return result;
	}

	@Override
	public int replyDelete(Integer re_no) {
		int result = 0;
		result = noticeReplyDao.replyDelete(re_no);
		return result;
	}

	@Override
	public int replyUpdate(NoticeReplyVO nvo) {
		int result = 0;
		result = noticeReplyDao.replyUpdate(nvo);
		return result;
	}

	@Override
	public NoticeReplyVO replySelect(Integer re_no) {
		NoticeReplyVO nvo = null;
		nvo = noticeReplyDao.replySelect(re_no);
		return nvo;
	}

}
