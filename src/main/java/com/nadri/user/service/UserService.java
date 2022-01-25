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
	
	public User insertUser(User user) {
		userMapper.insertUser(user);
		return userMapper.getUserById(user.getId());
	}
	
	public User updateUser(User user) {
		User savedUser = userMapper.getUserById(user.getId());	
		user.setId(user.getId());
		user.setPassword(user.getPassword());
		user.setName(user.getName());
		user.setAge(user.getAge());
		user.setTel(user.getTel());
		user.setAddress(user.getAddress());
		user.setEmail(user.getEmail());
		user.setSmsCheck(user.getSmsCheck());
		user.setEmailCheck(user.getEmailCheck());
		return savedUser;
	}
	
	public User deleteUser(int no) {
		User savedUser = userMapper.getUserByNo(no);
		userMapper.deleteUser(no);
		return savedUser;
		
	}
	
	public User getUserDetail(int no) {
		return userMapper.getUserByNo(no);
	}
}
