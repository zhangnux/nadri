package com.nadri.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nadri.manager.exception.LoginErrorException;
import com.nadri.manager.mapper.ManagerMapper;
import com.nadri.manager.vo.Manager;

@Service
public class ManagerService {
	
	@Autowired
	ManagerMapper mapper;
	
	public Manager login(String id, String password) {
		Manager manager = mapper.getManager(id);
		if (manager == null) {
			throw new LoginErrorException("존재하지 않는 정보입니다");
		} else if (!password.equals(manager.getPassword())) {
			throw new LoginErrorException("존재하지 않는 정보입니다");
		}
		return manager;
	}
}
