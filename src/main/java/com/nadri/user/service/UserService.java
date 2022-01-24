package com.nadri.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nadri.manager.exception.LoginErrorException;
import com.nadri.user.mapper.UserMapper;
import com.nadri.user.vo.User;

@Service
public class UserService {

	@Autowired
	UserMapper userMapper;
	
	public User login(String id, String password) {
		User user = userMapper.getUserById(id);
		if(user == null) {
			
		} else if (!password.equals(user.getPassword())) {
			
		}
		
		return user;
	}
	
	public User insertUser(User user) {
		userMapper.insertUser(user);
		return userMapper.getUserById(user.getId());
	}
	
	public User updateUser(User user) {
		User savedUser = userMapper.getUserById(user.getId());	
		user.setId(user.getId());
		return null;
	}
}
