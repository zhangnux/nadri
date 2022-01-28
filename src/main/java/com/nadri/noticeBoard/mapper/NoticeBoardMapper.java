package com.nadri.noticeBoard.mapper;

import java.util.List;

import com.nadri.coupon.util.Criteria;
import com.nadri.noticeBoard.vo.NoticeBoard;

public interface NoticeBoardMapper {
	
	int getBoardsTotalRows(Criteria criteria);
	List<NoticeBoard> searchBoards(Criteria criteria);
	
	NoticeBoard getNoticeBoardDetail(int no);
	
	void insertNoticeBoard(NoticeBoard noticeBoard);
	void updateNoticeBoard(NoticeBoard noticeBoard);
	void deleteNoticeBoard(int no);

}
