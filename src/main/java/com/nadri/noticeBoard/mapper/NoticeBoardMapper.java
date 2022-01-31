package com.nadri.noticeBoard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nadri.noticeBoard.vo.NoticeBoard;
import com.nadri.noticeBoard.web.form.Criteria;

@Mapper
public interface NoticeBoardMapper {
	
	int getBoardsTotalRows(Criteria criteria);
	List<NoticeBoard> searchBoards(Criteria criteria);
	
	NoticeBoard getNoticeBoardDetail(int no);
	
	void updateViewCount(int viewCount);
	
	void insertNoticeBoard(NoticeBoard noticeBoard);
	void updateNoticeBoard(NoticeBoard noticeBoard);
	void deleteNoticeBoard(int no);

}
