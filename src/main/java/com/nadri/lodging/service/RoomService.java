package com.nadri.lodging.service;

import java.io.InputStream;
import java.net.URL;
import java.util.List;
import java.util.Map;

import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nadri.lodging.mapper.LodgingMapper;
import com.nadri.lodging.mapper.RoomMapper;
import com.nadri.lodging.vo.LodInformation;
import com.nadri.lodging.vo.LodRoom;

@Service
public class RoomService {
	
	@Autowired
	private RoomMapper roomMapper;				
	@Autowired
	private LodgingMapper lodgingMapper;
	
	@SuppressWarnings("unchecked")
	public void insertRoom() throws Exception {
		
		List<LodInformation> list = lodgingMapper.getAllLodgings();		// 숙소전체정보
		for (LodInformation lodging : list) {		// for문을 이용해서 차례로 lod_no 가져오기
			
			String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey=tSqBlkiohsPm5ZiRD2nuDuBN20x3yzu4jAsPG404aCUwJw9VWrGXICq%2FO3idoWPNwSz1vNC6YuOKtmacJmqADw%3D%3D&contentTypeId=32& "
					+ "contentId="
					+ "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y&_type=json ";
			
			InputStream in = new URL(url).openStream();
			JSONParser parser = new JSONParser(in);
			Map<String, Object> object = parser.parseObject();
			Map<String, Object> response = (Map<String, Object>)object.get("response");
			Map<String, Object> body = (Map<String, Object>)response.get("body");
			Map<String, Object> items = (Map<String, Object>)body.get("items");
			List<Map<String, Object>> itemList = (List<Map<String, Object>>)items.get("item");
			
			for (Map<String, Object> item : itemList) {
				
				LodRoom lodRoom = new LodRoom();
				lodRoom.setLodInformationNo(Integer.parseInt(String.valueOf(item.get("contentid"))));
				lodRoom.setName(String.valueOf(item.get("roomtitle")));
				lodRoom.setRoomPerPerson(Integer.parseInt(String.valueOf(item.get("roombasecount"))));
				lodRoom.setRoomMaxPerson(Integer.parseInt(String.valueOf(item.get("roommaxcount"))));
				lodRoom.setPrice(Integer.parseInt(String.valueOf(item.get("roomoffseasonminfee1"))));
				
				roomMapper.insertRoom(lodRoom);
			}
			
				
		}
	 
		/*
		@SuppressWarnings("unchecked")
		public void insertRoom() throws Exception {
			
				String url = "";
				InputStream in = new URL(url).openStream();
				
				JSONParser parser = new JSONParser(in);
				Map<String, Object> object = parser.parseObject();
				Map<String, Object> response = (Map<String, Object>)object.get("response");
				Map<String, Object> body = (Map<String, Object>)response.get("body");
				Map<String, Object> items = (Map<String, Object>)body.get("items");
				List<Map<String, Object>> itemList = (List<Map<String, Object>>)items.get("item");
				
				for (Map<String, Object> item : itemList) {
					
					LodRoom lodRoom = new LodRoom();
					lodRoom.setLodInformationNo(Integer.parseInt(String.valueOf(item.get("contentid"))));
					lodRoom.setName(String.valueOf(item.get("roomtitle")));
					lodRoom.setRoomPerPerson(Integer.parseInt(String.valueOf(item.get("roombasecount"))));
					lodRoom.setRoomMaxPerson(Integer.parseInt(String.valueOf(item.get("roommaxcount"))));
					lodRoom.setPrice(Integer.parseInt(String.valueOf(item.get("roomoffseasonminfee1"))));
					
					roomMapper.insertRoom(lodRoom);
					
				}	
		 * */
	}
		
	
	
}
