package com.nadri.attr.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nadri.attr.vo.AttrReview;

@Mapper
public interface ReviewDao {

	// 후기 리스트 출력
	List<AttrReview> getListByNo(int attNo);
	
	// 후기 갯수
	int reviewcount(int attNo);
	
}
