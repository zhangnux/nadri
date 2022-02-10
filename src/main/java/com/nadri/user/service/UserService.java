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
	
	// 로그인
	public User login(String id, String password) {
		// 회원정보
		User user = userMapper.getUserById(id);		
		if (user == null) {
			throw new LoginErrorException("회원정보가 존재하지 않습니다.");
		}
		if ("1".equals(user.getDeleteCheck())) {
			throw new LoginErrorException("탈퇴처리된 회원아이디 입니다.");
		}
		if (!password.equals(user.getPassword())) {
			throw new LoginErrorException("비밀번호가 일치하지 않습니다.");
		}
		// 인증된 사용자정보를 반환
		return user;
	}
	
	// 회원가입
	public void insertUser(User user) {
		User savedUser = userMapper.getUserById(user.getId());
		
		if (savedUser != null) {
			throw new RuntimeException("이미 가입된 아이디 입니다.");
		} else {
			userMapper.insertUser(user);
		}
	}
	
	// id로 유저 정보 받아오기
	public User getUserDetail(String id) {
		return userMapper.getUserById(id);
	}
	
	// 유저 객체 전달받아 프로필 업데이트
	public User updateUser(User user) {
		User savedUser = userMapper.getUserById(user.getId());
		savedUser.setPassword(user.getPassword());
		savedUser.setEmail(user.getEmail());
		savedUser.setTel(user.getTel());
		
		userMapper.updateUser(savedUser);
		
		return savedUser;
	}
	
	
	
	public void deleteUser(User user) {
		User loginedUser = userMapper.getUserById(user.getId());
		
		userMapper.deleteUser(user);
	}
}