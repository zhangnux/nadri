package com.nadri.csBoard.web.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nadri.csBoard.dto.ResponseDto;
import com.nadri.csBoard.service.CsBoardService;
import com.nadri.csBoard.vo.CsBoardReply;
import com.nadri.csBoard.web.form.ReplyInserForm;
import com.nadri.manager.annotation.LoginedManager;
import com.nadri.manager.vo.Manager;

@RestController
@RequestMapping("/rest/csboard")
public class CsBoardRestController {
	
	
	@Autowired
	private CsBoardService csService;
	
	
	
	@PostMapping("/reply/insert.nadri")
	public CsBoardReply insert(ReplyInserForm form) {

		CsBoardReply reply = new CsBoardReply();
		
		reply.setNo(form.getBoardNo());
		reply.setReplyContent(form.getReplyContent());
		
		csService.addNewReply(reply);
		
		return reply;
	}
	
	

}
