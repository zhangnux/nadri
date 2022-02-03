package com.nadri.attr.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.nadri.attr.vo.AttrReview;

@Mapper
public interface AttrReviewDao {

	// 후기 리스트 출력
	List<AttrReview> getListByNo(@Param("no") int attNo, 
			@Param("beginIndex") int beginIndex, 
			@Param("endIndex") int endIndex);
	
	// 후기 사진
}
