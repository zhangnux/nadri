package com.nadri.user.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.nadri.user.vo.User;

@Mapper
public interface UserMapper {

	// 유저 생성
	void insertUser(User user);
	// 유저 정보 번경
	void updateUser(User user);
	// 유저 삭제
	void deleteUser(int no);
	// 유저 id로 조회
	User getUserById(String id);
	// 유저 번호로 조회
	User getUserByNo(int no);
	
	void register(User user) throws Exception;
	
	void idCnt(User user) throws Exception;
}
