package com.nadri.lodging.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nadri.lodging.mapper.LodgingMapper;
import com.nadri.lodging.vo.LodInformation;


@Service
public class LodgingService {

	@Autowired
	private LodgingMapper lodgingMapper;

	// 모든 정보 가져오기
	public List<LodInformation> getAllLodgings(){
		
		return lodgingMapper.getLodgings();
	}
	
	// 번호로 정보 가져오기
	public int getLodgingByNo(int no){
		
		return lodgingMapper.getLodgingByNo(no);
	}
	
	// 등록하기
	public void insertLodging(LodInformation lodinformation) {
		
		lodgingMapper.insertLodging(lodinformation);
	}
	
	// 숙소 정보 수정
	public void updateLodging(LodInformation lodInformation) {
		
		lodgingMapper.updateLodging(lodInformation);
	}
	
	// 숙소 정보 삭제
	public void deleteLodging(int no) {
		
		lodgingMapper.deleteLodging(no);
	}
	
	
}
