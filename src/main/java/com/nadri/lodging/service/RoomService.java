package com.nadri.lodging.service;

import java.io.InputStream;
import java.net.URL;
import java.util.List;
import java.util.Map;

import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nadri.lodging.mapper.RoomMapper;
import com.nadri.lodging.vo.LodInformation;

@Service
public class RoomService {
	
	@Autowired
	private RoomMapper roomMapper;
	
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
		
			LodInformation information = new LodInformation();
			information.setNo(Integer.parseInt(String.valueOf(item.get("contentid"))));
			information.setName(String.valueOf(item.get("title")));
			information.setAddress(String.valueOf(item.get("addr1")));
			information.setCheckIn("오후 3시");
			information.setCheckOut("오전 11시");
			information.setLodSales(0);
			
			roomMapper.insertRoom(null);;
		}	
	
	}
}
