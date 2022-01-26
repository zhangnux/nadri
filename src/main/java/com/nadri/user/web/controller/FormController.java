package com.nadri.user.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nadri.user.dto.ResponseDto;
import com.nadri.user.form.UserInsertForm;
import com.nadri.user.model.ResponseService;
import com.nadri.user.model.SingleResponseData;
import com.nadri.user.service.UserService;
import com.nadri.user.vo.User;

import lombok.extern.slf4j.Slf4j;

@RestController
public class FormController {

	@Autowired
	UserService userService;

	@Autowired
	ResponseService responseService;
	
	@PostMapping("/api/user")
	public ResponseDto<Integer> save(@RequestBody User user) {
		System.out.println("FormController save호출됨");
		// 실제 DB에 insert를 하고 아래서 return 되면 된다.
		return new ResponseDto<Integer>(HttpStatus.OK,1); // 자바오브젝트를 JSON으로 변환 후 리턴(Jackson)
	}
	

}
