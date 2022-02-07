package com.nadri.csBoard.web.restcontroller;

import java.io.IOException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.nadri.csBoard.service.CsBoardService;
import com.nadri.csBoard.vo.CsBoardReply;
import com.nadri.csBoard.web.form.ReplyInserForm;


@RestController
@RequestMapping("/rest/csboard")
public class CsBoardRestController {
	
	
	@Autowired
	private CsBoardService csService;
	
	static final Logger logger = LogManager.getLogger(CsBoardService.class);
	
	@PostMapping("/reply/insert.nadri")
	public void insert(ReplyInserForm form) {

		CsBoardReply reply = new CsBoardReply();
		
		reply.setNo(form.getNo());
		reply.setReplyContent(form.getReplyContent());
		
		csService.addNewReply(reply);
		
		
	}
	
	@GetMapping("/reply/show.nadri")
	public CsBoardReply show(@RequestParam("no") int boardNo) throws IOException {
		
		
		return csService.getReplyByNo(boardNo);
	}
	
	

}
