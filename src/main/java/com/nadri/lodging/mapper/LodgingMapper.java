package com.nadri.lodging.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nadri.lodging.vo.LodInformation;
import com.nadri.lodging.vo.LodPictures;

@Mapper
public interface LodgingMapper {
	
	// 
	List<LodInformation> getBestLodgings();
	
	// 숙소 정보 등록
	void insertLodging(LodInformation lodinformation);
	// 숙소 사진 등록
	//void isertLodgingPicture(LodPictures lodPictures);
	// 숙소 정보 수정
	void updateLodging(LodInformation lodinformation);	
	// 숙소 정보 삭제 
	void deleteLodging(int no);
	
	// 숙소 전체 정보
	List<LodInformation> getAllLodgings();
	
	// 숙소 번호로 조히
	int getLodgingByNo(int no);
	
	
}
