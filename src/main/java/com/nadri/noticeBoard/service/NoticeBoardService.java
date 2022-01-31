package com.nadri.noticeBoard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nadri.noticeBoard.mapper.NoticeBoardMapper;
import com.nadri.noticeBoard.vo.NoticeBoard;
import com.nadri.noticeBoard.web.form.Criteria;

@Service
public class NoticeBoardService {
	
	@Autowired
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
	
	public NoticeBoard getNoticeBoardDetail(int no) {
		
		return nbMapper.getNoticeBoardDetail(no);
	}
	
	public void updateViewCount(int boardNo, int viewCount) {
		NoticeBoard noticeBoard = nbMapper.getNoticeBoardDetail(boardNo);
		noticeBoard.setViewCount(viewCount);
		nbMapper.updateNoticeBoard(noticeBoard);
		
	}
	
	public void deleteNoticeBoard(int no) {
		nbMapper.deleteNoticeBoard(no);
	}
	

}
