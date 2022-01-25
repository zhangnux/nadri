package com.nadri.lodging.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nadri.lodging.service.RoomService;

@Controller
@RequestMapping("/lodging/room")
public class RoomController {

	@Autowired
	private RoomService roomService;
	
	@GetMapping("/insert")
	public String insert() throws Exception {
		roomService.insertRoom();
		return null;
	}
}
