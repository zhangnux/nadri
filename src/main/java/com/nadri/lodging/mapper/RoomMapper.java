package com.nadri.lodging.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.nadri.lodging.vo.LodRoom;
@Mapper
public interface RoomMapper {

	// 룸 정보등록
	void insertRoom(LodRoom lodRoom); 
	
	// 룸 사진정보 등록
}
