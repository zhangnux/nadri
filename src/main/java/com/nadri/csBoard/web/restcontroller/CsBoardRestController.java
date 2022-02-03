package com.nadri.csBoard.web.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nadri.csBoard.service.CsBoardService;

@RestController
@RequestMapping("/rest/csboard")
public class CsBoardRestController {
	
	
	@Autowired
	private CsBoardService csService;
	
	
	

}
