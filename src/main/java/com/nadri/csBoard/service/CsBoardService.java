package com.nadri.csBoard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nadri.csBoard.mapper.CsBoardMapper;
import com.nadri.csBoard.vo.CsBoard;
import com.nadri.csBoard.vo.CsBoardReply;
import com.nadri.csBoard.web.form.Criteria;

@Service
public class CsBoardService {
	
	@Autowired
	private CsBoardMapper csMapper;
	
	
	public int getCsBoardsTotalRows(Criteria criteria) {
		
		return csMapper.getCsBoardsTotalRows(criteria);
	}
	
	public List<CsBoard> searchCsBoards(Criteria criteria){
		
		return csMapper.searchCsBoards(criteria);
	}
	
	public CsBoardReply getReplyByNo(int no) {
		return csMapper.getReplyByNo(no);
	}
	
	
	
	
	public int getCsBoardsTotalRowsByUserNo(Criteria criteria) {
		return csMapper.getCsBoardsTotalRowsByUserNo(criteria);
	}
	
	public List<CsBoard> searchCsBoardsByUserNo(Criteria criteria){
		return csMapper.searchCsBoardsByUserNo(criteria);
	}
	
	public CsBoard getCsBoardDetailByNo(int no) {
		return csMapper.getCsBoardDetailByNo(no);
	}

	
	public void addNewCsBoard(CsBoard csBoard) {
		csMapper.insertCsBoard(csBoard);
	}
	
	public void updateCsBoard(CsBoard csBoard) {
		csMapper.updateCsBoard(csBoard);
	}
	
	public void deleteCsBoard(int no) {
		csMapper.deleteCsBoard(no);
	}
	
	
	public void addNewReply(CsBoardReply reply) {
		csMapper.insertCsBoardReply(reply);
	}
	
	public void updateReply(CsBoardReply reply) {
		csMapper.updateCsBoardReply(reply);
	}
	
	
}
