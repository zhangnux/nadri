package com.nadri.manager.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.nadri.manager.vo.Manager;

@Mapper
public interface ManagerMapper {
	
	Manager getManager(String id);
}
