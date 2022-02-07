package com.nadri.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nadri.manager.exception.LoginErrorException;
import com.nadri.user.mapper.UserMapper;
import com.nadri.user.vo.User;

// 스프링이 컴포넌트 스캔을 통해 Bean에 등록, IoC 해쥼
@Service
@Transactional
public class UserService {

	@Autowired
	private UserMapper userMapper;
	
	public User login(String id, String password) {
		// 회원정보
		User user = userMapper.getUserById(id);		
		if (user == null) {
			throw new LoginErrorException("회원정보가 존재하지 않습니다.");
		}
		if ("Y".equals(user.getDeleteCheck())) {
			throw new LoginErrorException("탈퇴처리된 회원아이디 입니다.");
		}
		if (!password.equals(user.getPassword())) {
			throw new LoginErrorException("비밀번호가 일치하지 않습니다.");
		}
		// 인증된 사용자정보를 반환
		return user;
	}
	

	/*	
	public void insertUser(User user) {
		userMapper.insertUser(user);
	}
	 */
	public void insertUser(User user) {
		User savedUser = userMapper.getUserById(user.getId());
		
		if (savedUser != null) {
			throw new RuntimeException("이미 가입된 아이디 입니다.");
		}
		
	}
	
	public User detailById() {
		return null;
	}
	
	public void updateUser(String id) {
		User user = userMapper.getUserById(id);
	}
	
	public void deleteUser(User user) {
		
		
	}
}