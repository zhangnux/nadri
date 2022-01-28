package com.nadri.csBoard.mapper;

import java.util.List;

import com.nadri.csBoard.vo.CsBoard;
import com.nadri.csBoard.vo.CsBoardReply;

public interface CsBoardMapper {
	
	List<CsBoard> getAllCsBoards();
	CsBoard getCsBoardDetailByNo(int no);	// 보드 넘버로 디테일 가져오기
	CsBoardReply getReplyByNo(int no);		// cs보드 넘버로 답변 가져오기(답변은 단 하나다. 부족하면 전화나 다시 질문하라고 함)
	
	
	void insertCsBoard();
	void updateCsBoard();
	void deleteCsBoard();
	
	
	void insertCsBoardReply();
	void updateCsBoardReply();
	void deleteCsBoardReply();

}
