package com.nadri.csBoard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nadri.csBoard.mapper.CsBoardMapper;

@Service
public class CsBoardService {
	
	@Autowired
	private CsBoardMapper csMapper;
	
	

}
