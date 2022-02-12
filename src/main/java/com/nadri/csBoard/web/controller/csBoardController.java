package com.nadri.csBoard.web.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nadri.csBoard.service.CsBoardService;
import com.nadri.csBoard.util.Pagination;
import com.nadri.csBoard.vo.CsBoard;
import com.nadri.csBoard.web.form.Criteria;
import com.nadri.csBoard.web.form.CsBoardInsertForm;
import com.nadri.manager.annotation.LoginedManager;
import com.nadri.manager.vo.Manager;
import com.nadri.user.annotation.LoginedUser;
import com.nadri.user.util.SessionUtils;
import com.nadri.user.vo.User;


@Controller
@RequestMapping("/csboard")
public class csBoardController {
	
	@Autowired
	private CsBoardService csService;
	
	
	
	@GetMapping("/userlist.nadri")
	public String userList(@RequestParam(name = "page", required = false, defaultValue = "1") String page,
			Criteria criteria, Model model) {
		
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		if (user == null) {
			return "localhost/home.nadri";
		}
		
		criteria.setUserNo(user.getNo());
		int totalRecords = csService.getCsBoardsTotalRowsByUserNo(criteria);
		// 현재 페이지번호와 총 데이터 갯수를 전달해서 페이징 처리에 필요한 정보를 제공하는 Pagination객체 생성
		Pagination pagination = new Pagination(page, totalRecords);
				
		// 요청한 페이지에 대한 조회범위를 criteria에 저장
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		
		List<CsBoard> csBoards = csService.searchCsBoardsByUserNo(criteria);
		model.addAttribute("csBoards", csBoards);
		model.addAttribute("pagination", pagination);
		
		return "/csBoard/userlist";
	}
	
	
	
	@GetMapping("/list.nadri")
	public String list(@LoginedManager Manager manager, @RequestParam(name = "page", required = false, defaultValue = "1") String page,
			Criteria criteria, Model model) {
		int totalRecords = csService.getCsBoardsTotalRows(criteria);
		// 현재 페이지번호와 총 데이터 갯수를 전달해서 페이징 처리에 필요한 정보를 제공하는 Pagination객체 생성
		Pagination pagination = new Pagination(page, totalRecords);
						
		// 요청한 페이지에 대한 조회범위를 criteria에 저장
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());

		List<CsBoard> csBoards = csService.searchCsBoards(criteria);
		model.addAttribute("csBoards", csBoards);
		model.addAttribute("pagination", pagination);
		
		
		return "/csBoard/list";
	}

	
	@GetMapping("/detail.nadri")
	public String detail(int no, Model model) {
		
		CsBoard csBoard = csService.getCsBoardDetailByNo(no);
		model.addAttribute("csBoard", csBoard);
		
		return "/csBoard/detail";
	}
	
	@GetMapping("/insert.nadri")
	public String form() {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		if (user == null) {
				return "redirect:userlist.nadri";
			}
		
		
		return "/csBoard/form";
	}
	
	@PostMapping("/insert.nadri")
	public String save(@LoginedUser User user, CsBoardInsertForm form) throws IOException {
		
		//User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		
		CsBoard csBoard = new CsBoard();
		
		BeanUtils.copyProperties(form, csBoard);
		
		csBoard.setUserNo(user.getNo());
		csService.addNewCsBoard(csBoard);

		return "redirect:userlist.nadri";
	}
	
	@GetMapping("/modify.nadri")
	public String modifyform(int no, Model model) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		CsBoard csBoard = csService.getCsBoardDetailByNo(no);
		model.addAttribute("csBoard", csBoard);
		
		return "/csBoard/modifyform";
	}
	
	@PostMapping("/modify.nadri")
	public String modify(CsBoardInsertForm form) {
		
		CsBoard csBoard = csService.getCsBoardDetailByNo(form.getNo());
		
		csBoard.setCsType(form.getCsType());
		csBoard.setTitle(form.getTitle());
		csBoard.setContent(form.getContent());
		
		
		csService.updateCsBoard(csBoard);
		
		return "redirect:detail.nadri?no=" + form.getNo();
	}
	
	@GetMapping("/delete.nadri")
	public String delete(int no) {
		
		csService.deleteCsBoard(no);
		
		return "redirect:userlist.nadri";
	}
	
	
	
	

}
