package com.nadri.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nadri.user.exception.DeleteErrorException;
import com.nadri.user.exception.JoinErrorException;
import com.nadri.user.exception.LoginErrorException;
import com.nadri.user.mapper.UserMapper;
import com.nadri.user.util.SessionUtils;
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
		User savedUser = userMapper.getUserById(id);		
		if (savedUser == null) {
			throw new LoginErrorException("회원정보가 존재하지 않습니다.");
		}
		if ("1".equals(savedUser.getDeleteCheck())) {
			throw new LoginErrorException("탈퇴한 회원입니다.");
		}
		if (!password.equals(savedUser.getPassword())) {
			throw new LoginErrorException("비밀번호가 일치하지 않습니다.");
		}
		if (!"normal".equals(savedUser.getType())) {
			throw new LoginErrorException("사이트에 가입된 사용자가 아닙니다.");
		}
		// 인증된 사용자정보를 반환
		return savedUser;
	}
	
	// 카카오 로그인
	public User loginWithKakao(User user) {
		User savedUser = userMapper.getUserById(user.getId());
		if (savedUser == null) {
			// 로그인하면 DB에 값 저장
			userMapper.insertUser(user);
		}
		return savedUser;
	}
	
	// 회원가입
	public void insertUser(User user) {
		User savedUser = userMapper.getUserById(user.getId());
		if (savedUser != null) {
			throw new JoinErrorException("이미 가입된 아이디입니다.");
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
	
	
	// 유저 삭제(deleteCheck 컬럼값을 1로 바꿔서 회원탈퇴 아이디로 표시)
	public void deleteUser(String password) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		if (user == null) {
			throw new DeleteErrorException("회원정보를 입력해주세요.");
		}
		
		if (!password.equals(user.getPassword())) {
			throw new DeleteErrorException("비밀번호가 일치하지 않습니다.");
		}
		
		userMapper.deleteUser(user);
	}
}