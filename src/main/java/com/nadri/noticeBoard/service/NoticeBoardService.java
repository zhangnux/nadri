package com.nadri.noticeBoard.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nadri.coupon.util.Criteria;
import com.nadri.noticeBoard.mapper.NoticeBoardMapper;
import com.nadri.noticeBoard.vo.NoticeBoard;

@Service
public class NoticeBoardService {
	
	private NoticeBoardMapper nbMapper;
	
	public int getBoardsTotalRows(Criteria criteria) {
		return nbMapper.getBoardsTotalRows(criteria);
	}
	
	public List<NoticeBoard> searchBoards(Criteria criteria){
		return nbMapper.searchBoards(criteria);
	}
	
	
	
	
	public void addNewNoticeBoard(NoticeBoard noticeBoard) {
		
		nbMapper.insertNoticeBoard(noticeBoard);
	}
	
	

}
