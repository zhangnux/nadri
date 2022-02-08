package com.nadri.manager.web.restController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nadri.manager.annotation.LoginedManager;
import com.nadri.manager.dto.UserCriteria;
import com.nadri.manager.service.ManagerService;
import com.nadri.manager.util.SessionUtils;
import com.nadri.manager.vo.Manager;
import com.nadri.manager.web.model.ResponseDto;
import com.nadri.user.vo.User;

@RestController
@RequestMapping("/rest/admin")
public class ManagerRestController {
	
	static final Logger log = LogManager.getLogger(ManagerRestController.class);
	
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
	
	/**
	 * 회원 정보 검색 창
	 * @param manager
	 * @param criteria
	 * @return
	 */
	@GetMapping("/userSearch.do")
	public Map<String, Object> userSearch(@LoginedManager Manager manager, UserCriteria criteria) {
		log.info("확인: " + criteria.toString());
		ResponseDto<User> response = new ResponseDto<>();
		List<User> userList = service.getUserByCriteria(criteria);
		int no = service.getCountUserByCriteria(criteria);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("items", userList);
		map.put("totalBlock", Math.ceil(no/5.0));
		map.put("active", criteria.getPageNo());
		
		return map;
	}
}
