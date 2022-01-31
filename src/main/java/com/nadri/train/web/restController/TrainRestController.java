package com.nadri.train.web.restController;

import java.util.ArrayList;
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
import com.nadri.train.vo.TrainReservation;
import com.nadri.train.vo.TrainRoom;
import com.nadri.train.vo.TrainSeat;
import com.nadri.train.vo.TrainStation;
import com.nadri.train.vo.TrainTickect;
import com.nadri.train.web.model.ResponseDto;
import com.nadri.train.web.model.TrainReservationDto;
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
	
	/**
	 * 스케줄 목록 불러오는 restcontroller
	 * @param search
	 * @return
	 */
	@GetMapping("/schedule")
	public ResponseDto<?> getSchedule(TrainSearchForm search) {
		log.info("확인date: " + search.getDpDate1());
		log.info("확인time: " + search.getDpTime1());
		log.info("확인ar: " + search.getArrivalStation());
		log.info("확인dp: " + search.getDepartureStation());
		log.info("확인row: " + search.getRowNo1());
		
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
	
	/**
	 * 열차에 해당하는 좌석 정보를 가져오는 restController
	 * @param roomInfo
	 * @return
	 */
	@GetMapping("/trainInfo") 
	public Map<String, Object> getTrainInfo(TrainRoomInfo roomInfo) {
		List<TrainRoom> rooms = service.getTrainRoom(roomInfo);
		List<TrainSeat> seatList = service.getTrainSeatNo(roomInfo.getSchduleNo(), roomInfo.getTrainNo());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rooms", rooms);
		map.put("seatList", seatList);
		
		return map;
	}
	
	
	@GetMapping("/reservation")
	public ResponseDto<?> insertReservation(TrainReservationDto dto) {
		int totalCount = dto.getCount1()+dto.getCount2();
		for (int i=0; i<totalCount; i++) {
			TrainTickect tickect = new TrainTickect();
			
		}
		
		List<TrainReservation> reservationList = new ArrayList<TrainReservation>();
		if ("왕복".equals(dto.getWay() )) {
			TrainReservation reservation = new TrainReservation();
		}
		
		// 예약 번호 가져오기 // Controller에서 예약 번호로 티켓 정보도 가져올 수 있다.
		ResponseDto<?> response = new ResponseDto<>();
		response.setStatus("OK");
		return response;
	}
}
