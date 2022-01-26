package com.nadri.lodging.service;

import java.io.InputStream;
import java.net.URL;
import java.util.List;
import java.util.Map;

import org.apache.tomcat.util.json.JSONParser;
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
		
		return lodgingMapper.getAllLodgings();
	}
	
	// 번호로 정보 가져오기
	public int getLodgingByNo(int no){
		
		return lodgingMapper.getLodgingByNo(no);
	}
	
	
	// 숙소 정보 수정
	public void updateLodging(LodInformation lodInformation) {
		
		lodgingMapper.updateLodging(lodInformation);
	}
	
	// 숙소 정보 삭제
	public void deleteLodging(int no) {
		
		lodgingMapper.deleteLodging(no);
	}
	// 등록하기
	@SuppressWarnings("unchecked")
	public void insertLodging() throws Exception {

		String url ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?ServiceKey=tSqBlkiohsPm5ZiRD2nuDuBN20x3yzu4jAsPG404aCUwJw9VWrGXICq%2FO3idoWPNwSz1vNC6YuOKtmacJmqADw%3D%3D&areaCode=2&sigunguCode=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=D&numOfRows=12&pageNo=1&_type=json";
		InputStream in = new URL(url).openStream();
		
		JSONParser parser = new JSONParser(in);
		Map<String, Object> object = parser.parseObject();
		Map<String, Object> response = (Map<String, Object>)object.get("response");
		Map<String, Object> body = (Map<String, Object>)response.get("body");
		Map<String, Object> items = (Map<String, Object>)body.get("items");
		List<Map<String, Object>> itemList = (List<Map<String, Object>>)items.get("item");
		
		for (Map<String, Object> item : itemList) {
		
			LodInformation information = new LodInformation();
			information.setNo(Integer.parseInt(String.valueOf(item.get("contentid"))));
			information.setName(String.valueOf(item.get("title")));
			information.setAddress(String.valueOf(item.get("addr1")));
			information.setCheckIn("오후 3시");
			information.setCheckOut("오전 11시");
			information.setLodSales(0);
			
			lodgingMapper.insertLodging(information);
		}	
	
		
		
	}
	
	
	
	
}
