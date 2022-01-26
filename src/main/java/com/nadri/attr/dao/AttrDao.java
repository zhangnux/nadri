package com.nadri.attr.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nadri.attr.vo.Attraction;

@Mapper
public interface AttrDao{

	// 전체리스트
	List<Attraction> allAttrList();
	
	// 리스트 갯수
	int attrcount();
	
	/*
	 * // 카테고리별 검색 List<Attraction> getListByCategory(String category); // 가격별 검색
	 */
	
	}
