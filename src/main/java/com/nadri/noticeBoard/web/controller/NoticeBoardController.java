package com.nadri.noticeBoard.web.controller;

import java.io.IOException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nadri.noticeBoard.service.NoticeBoardService;
import com.nadri.noticeBoard.util.Pagination;
import com.nadri.noticeBoard.vo.NoticeBoard;
import com.nadri.noticeBoard.web.form.Criteria;
import com.nadri.noticeBoard.web.form.NoticeBoardInserform;
import com.nadri.noticeBoard.web.form.NoticeBoardModifyForm;


@Controller
@RequestMapping("/noticeBoard")
public class NoticeBoardController {
	
	static final Logger logger = LogManager.getLogger(NoticeBoardController.class);
	
	@Autowired
	private NoticeBoardService nbService;
	
	
	@GetMapping("/list.nadri")
	public String list(@RequestParam(name = "page", required = false, defaultValue = "1") String page,
			Criteria criteria, Model model) {
		
		int totalRecords = nbService.getBoardsTotalRows(criteria);
		// 현재 페이지번호와 총 데이터 갯수를 전달해서 페이징 처리에 필요한 정보를 제공하는 Pagination객체 생성
		Pagination pagination = new Pagination(page, totalRecords);
		
		// 요청한 페이지에 대한 조회범위를 criteria에 저장
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		
		// 검색조건(opt, value)과 조회범위(beginIndex, endIndex)가 포함된 Criteria를 서비스에 전달해서 데이터 조회
		List<NoticeBoard> noticeBoards = nbService.searchBoards(criteria);
		
		model.addAttribute("noticeBoards", noticeBoards);		
		model.addAttribute("pagination", pagination);
		
		return "/noticeBoard/list";
	}
	
	@GetMapping("/userlist.nadri")
	public String userList(@RequestParam(name = "page", required = false, defaultValue = "1") String page,
			Criteria criteria, Model model) {
		
		int totalRecords = nbService.getBoardsTotalRows(criteria);
		// 현재 페이지번호와 총 데이터 갯수를 전달해서 페이징 처리에 필요한 정보를 제공하는 Pagination객체 생성
		Pagination pagination = new Pagination(page, totalRecords);
		
		// 요청한 페이지에 대한 조회범위를 criteria에 저장
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		
		// 검색조건(opt, value)과 조회범위(beginIndex, endIndex)가 포함된 Criteria를 서비스에 전달해서 데이터 조회
		List<NoticeBoard> noticeBoards = nbService.searchBoards(criteria);
		
		model.addAttribute("noticeBoards", noticeBoards);		
		model.addAttribute("pagination", pagination);
		
		return "/noticeBoard/userlist";
	}
	
	
	@GetMapping("/insert.nadri")
	public String form() {
		
		return "/noticeBoard/form";
	}
	
	@PostMapping("/insert.nadri")
	public String save(NoticeBoardInserform form) throws IOException {
		
		logger.debug("입력폼 정보: " + form);
		
		NoticeBoard noticeBoard = new NoticeBoard();
		
		BeanUtils.copyProperties(form, noticeBoard);
		nbService.addNewNoticeBoard(noticeBoard);
		
		return "redirect:list.nadri";
	}
	
	@GetMapping("/detail.nadri")
	public String detail(int no, Model model) {
		
		NoticeBoard noticeBoard = nbService.getNoticeBoardDetail(no);
		
		int viewCount = (noticeBoard.getViewCount() + 1);

		nbService.updateViewCount(no, viewCount);
		model.addAttribute("noticeBoard", noticeBoard);
		
		return "/noticeBoard/detail";
	}
	
	@GetMapping("/delete.nadri")
	public String delete(int no) {
		
		nbService.deleteNoticeBoard(no);
		
		return "redirect:list.nadri";
	}
	
	@GetMapping("/modify.nadri")
	public String modifyform(int no, Model model) {
		NoticeBoard noticeBoard = nbService.getNoticeBoardDetail(no);
		
		model.addAttribute("noticeBoard", noticeBoard);
		
		return "/noticeBoard/modifyform";
	}
	

	@PostMapping("/modify.nadri")
	public String modify(NoticeBoardModifyForm form) {
		
		logger.debug("입력폼 정보: " + form);
		
		NoticeBoard noticeBoard = nbService.getNoticeBoardDetail(form.getNo());
		
		noticeBoard.setTitle(form.getTitle());
		noticeBoard.setContent(form.getContent());
		
		nbService.updateNoticeBoard(noticeBoard);
		
		return "redirect:detail.nadri?no=" + form.getNo();
	}

}
