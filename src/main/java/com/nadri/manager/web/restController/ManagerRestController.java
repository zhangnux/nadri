package com.nadri.manager.web.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nadri.manager.service.ManagerService;
import com.nadri.manager.util.SessionUtils;
import com.nadri.manager.vo.Manager;
import com.nadri.manager.web.model.ResponseDto;

@RestController
@RequestMapping("/rest/admin")
public class ManagerRestController {
	
	@Autowired
	ManagerService service;
	
	@PostMapping("/login.do")
	public ResponseDto<?> login(String id, String password) {
		ResponseDto<?> responseDto = new ResponseDto<>();
		try {
			Manager manager = service.login(id, password);
			SessionUtils.addAttribute("LOGIN_MANAGER", manager);
			responseDto.setStatus("OK");
			return responseDto;
		} catch (RuntimeException e) {
			responseDto.setStatus("FAIL");
			responseDto.setError("존재하지 않는 정보입니다.");
			return responseDto;
		}
	}
	
}
