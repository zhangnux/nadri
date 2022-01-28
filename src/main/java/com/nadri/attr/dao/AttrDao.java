package com.nadri.attr.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nadri.attr.vo.Attraction;
import com.nadri.attr.vo.Search;

@Mapper
public interface AttrDao{

	// 전체리스트
	List<Attraction> allAttrList();
	
	// 리스트 갯수
	int attrcount();
	
	// 카테고리별 검색
	List<Attraction> searchAttraction(Search search);
	
	// 검색을 완료한 전체 갯수
	int getSearchedRow(Search search);
	
	// 번호로 디테일 불러오기
	Attraction getDetailByNo(int no);
}
