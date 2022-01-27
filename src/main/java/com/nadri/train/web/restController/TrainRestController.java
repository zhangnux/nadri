package com.nadri.train.web.restController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.nadri.train.dto.TrainCriteria;
import com.nadri.train.dto.TrainSearchDto;
import com.nadri.train.service.TrainService;
import com.nadri.train.vo.TrainRoom;
import com.nadri.train.vo.TrainStation;
import com.nadri.train.web.model.ResponseDto;
import com.nadri.train.web.model.TrainRoomInfo;
import com.nadri.train.web.model.TrainSearchForm;

@RestController
@RequestMapping("/api/train")
public class TrainRestController {
	
	static final Logger log = LogManager.getLogger(TrainRestController.class);
	
	@Autowired
	TrainService service;
	
	@GetMapping("/station/{firstWord}")
	public ResponseDto<TrainStation> getStation(@PathVariable(name="firstWord") int word) {
	
		ResponseDto<TrainStation> response = new ResponseDto<>();
		response.setItems(service.getStationByWord(word));
		response.setStatus("OK");
		
		return response;
	}

	@GetMapping("/schedule")
	public ResponseDto<?> getSchedule(TrainSearchForm search) {
		TrainCriteria criteria = new TrainCriteria();
		criteria.setDepartureStation(search.getDepartureStation());
		criteria.setArrivalStation(search.getArrivalStation());
		criteria.setRowNo(search.getRowNo1());
		criteria.setDepartureDate(search.getDpDate1(), search.getDpTime1());
		
		List<TrainSearchDto> dtos = service.getSchedulesByCriteria(criteria);
		ResponseDto<TrainSearchDto> response = new ResponseDto<TrainSearchDto>();
		if (dtos.size() != 0) {
			response.setStatus("OK");
			response.setItems(dtos);
		} else {
			response.setStatus("FAIL");
		}
		return response;
	}
	
	@GetMapping("/trainInfo") 
	public Map<String, Object> getTrainInfo(TrainRoomInfo roomInfo) {
		List<TrainRoom> rooms = service.getTrainRoom(roomInfo);
		List<Integer> seatList = null;
		for (TrainRoom room : rooms) {
			log.info("확인" + room.getBookedSeatNum());
			if (room.getSeatNum() != room.getBookedSeatNum()) {
				seatList = service.getTrainSeatNo(roomInfo.getSchduleNo(), room.getNo());
				break;
			}
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rooms", rooms);
		map.put("seatList", seatList);
		
		return map;
	}
		
}
