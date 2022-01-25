package com.nadri.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nadri.user.vo.User;

@Mapper
public interface UserMapper {

	void insertUser(User user);
	void updateUser(User user);
	void deleteUser(int no);
	User getUserById(String id);
	User getUserByNo(int no);
	
}
