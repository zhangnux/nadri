package com.nadri.train.web.restController;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.nadri.train.dto.TrainCriteria;
import com.nadri.train.dto.TrainModifyDto;
import com.nadri.train.dto.TrainSearchDto;
import com.nadri.train.service.TrainService;
import com.nadri.train.vo.TrainReservation;
import com.nadri.train.vo.TrainRoom;
import com.nadri.train.vo.TrainSeat;
import com.nadri.train.vo.TrainStation;
import com.nadri.train.vo.TrainTicket;
import com.nadri.train.web.model.ResponseDto;
import com.nadri.train.web.model.TrainReservationDto;
import com.nadri.train.web.model.TrainRoomInfo;
import com.nadri.train.web.model.TrainSearchForm;
import com.nadri.user.annotation.LoginedUser;
import com.nadri.user.vo.User;

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
	public Map<String, Object> getTrainInfo(@LoginedUser User user, TrainRoomInfo roomInfo) {
		List<TrainRoom> rooms = service.getTrainRoom(roomInfo);
		List<TrainSeat> seatList = service.getTrainSeatNo(roomInfo.getSchduleNo(), roomInfo.getTrainNo());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rooms", rooms);
		map.put("seatList", seatList);
		
		return map;
	}
	
	@GetMapping("/reservation")
	public ResponseDto<?> insertReservation(@LoginedUser User user, TrainReservationDto dto) {
		log.info("파라 확인 : " + user.getNo());
		
		List<Integer> reservedNo = new ArrayList<>();
		TrainReservation reservation1 = new TrainReservation();
		List<TrainTicket> ticketList1 = new ArrayList<>();
		int ad = dto.getAdNo1();
		int ch = dto.getCdNo1();
		reservation1.setTotalPrice(ad*dto.getPriceschedule1() + ch*(dto.getPriceschedule1()/2));
		reservation1.setTotalCount(dto.getCount1());
		reservation1.setUserNo(user.getNo());
		log.info("티켓 확인 : " + reservation1.toString());
		for (int i=0; i<dto.getCount1(); i++) {

			TrainTicket ticket = new TrainTicket();
			ticket.setScheduleNo(dto.getSchduleNo1());
			ticket.setTrainNo(dto.getTrainNo1());
			ticket.setRoomNo(dto.getRoomNo1());
			ticket.setPriceId(dto.getPriceIdschedule1());
			if (ad > 0) {
				ticket.setType("어른");
				ticket.setSeatNo(dto.getSeatNo1().get(i));
				--ad;
			} else if (ch > 0) {
				ticket.setType("어린이");
				ticket.setSeatNo(dto.getSeatNo1().get(i));
				--ch;
			}
			log.info("티켓 확인 : " + ticket.toString());
			ticketList1.add(ticket);
		}
		reservedNo.add(service.addNewReservation(reservation1, ticketList1));
		if ("왕복".equals(dto.getWay() )) {
			List<TrainTicket> ticketList2 = new ArrayList<>();
			TrainReservation reservation2 = new TrainReservation();
			ad = dto.getAdNo2();
			ch = dto.getCdNo2();
			reservation2.setTotalPrice(ad*dto.getPriceschedule2() + ch*(dto.getPriceschedule2()/2));
			reservation2.setTotalCount(dto.getCount2());
			reservation2.setUserNo(user.getNo());
			log.info("티켓 확인 : " + reservation2.toString());
			for (int i=0; i<dto.getCount2(); i++) {
				TrainTicket ticket = new TrainTicket();
				ticket.setScheduleNo(dto.getSchduleNo2());
				ticket.setTrainNo(dto.getTrainNo2());
				ticket.setRoomNo(dto.getRoomNo2());
				ticket.setPriceId(dto.getPriceIdschedule2());
				if (ad > 0) {
					ticket.setType("어른");
					ticket.setSeatNo(dto.getSeatNo2().get(i));
					--ad;
				} else if (ch > 0) {
					ticket.setType("어린이");
					ticket.setSeatNo(dto.getSeatNo2().get(i));
					--ch;
				}
				log.info("티켓 확인 : " + ticket.toString());
				ticketList2.add(ticket);
			}
			reservedNo.add(service.addNewReservation(reservation2, ticketList2));
		}
		// 예약 번호 가져오기 // Controller에서 예약 번호로 티켓 정보도 가져올 수 있다.
		ResponseDto<Integer> response = new ResponseDto<>();
		response.setStatus("OK");
		response.setItems(reservedNo);
		return response;
	}
	
	@PutMapping("/reservation/{reservationNo}")
	public ResponseDto<?> update(@LoginedUser User user, @RequestParam String jsonData, @PathVariable(name="reservationNo") int reservationNo) {
		// json 배열값을 java객체로 옮기는 방법
		Gson gson = new Gson(); 
		Type ticketListType = new TypeToken<ArrayList<TrainModifyDto>>(){}.getType();
		ArrayList<TrainModifyDto> ticketList = gson.fromJson(jsonData, ticketListType);
		
		List<TrainReservation> reservationList = service.getReservationByNo(user.getNo(), reservationNo, 0);
		TrainReservation reservation = reservationList.get(0);
		List<Integer> ticketNo = new ArrayList<>();
		int count = reservation.getTotalCount();
		long totalPrice = 0;
		
		for (TrainModifyDto ticket : ticketList) {
			if ("선택안함".equals(ticket.getType())) {
				--count;
				ticketNo.add(ticket.getNo());
			} else if ("어른".equals(ticket.getType())) {
				TrainTicket target = service.getTicketByNo(ticket.getNo());
				target.setType(ticket.getType());
				service.updateTicket(target);

				totalPrice += target.getPrice();
			} else if ("어린이".equals(ticket.getType())) {
				TrainTicket target = service.getTicketByNo(ticket.getNo());
				target.setType(ticket.getType());
				service.updateTicket(target);
				
				totalPrice += target.getPrice();
			}
			// 티켓 번호로 티켓 불러오고 수정한다음 list로 받아 업데이트?
		}
		
		// 삭제하기
		if (ticketNo.size() != 0) {
			service.deleteTicketByNo(ticketNo);
		}
		if (count == 0) {
			service.deleteReservationByNo(user.getNo(), reservationNo);
		} else {
			reservation.setTotalPrice(totalPrice);
			reservation.setTotalCount(count);
			service.updateReservation(reservation);
		}
		
		// 예약 번호, 티켓 번호, type값, 만약의 type값중에 사용안함의 개수를 세어 그중에 count수를 뺀다. 뺀값이 0이면 삭제 0이 아니면 count수만 조정
		// 그만큼 가격도 빼야돼네, 티켓 가격도 가져오고, 예약 총 가격도 가져오고
		ResponseDto<?> response = new ResponseDto<>();
		response.setStatus("OK");
		return response;
	}
}
