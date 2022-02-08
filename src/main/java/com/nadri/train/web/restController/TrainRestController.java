package com.nadri.train.web.restController;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.nadri.train.dto.TrainCriteria;
import com.nadri.train.dto.TrainModifyDto;
import com.nadri.train.dto.TrainSearchDto;
import com.nadri.train.exception.LoginException;
import com.nadri.train.service.TrainService;
import com.nadri.train.util.SessionUtils;
import com.nadri.train.vo.TrainReservation;
import com.nadri.train.vo.TrainRoom;
import com.nadri.train.vo.TrainSeat;
import com.nadri.train.vo.TrainStation;
import com.nadri.train.vo.TrainTicket;
import com.nadri.train.web.model.ResponseDto;
import com.nadri.train.web.model.TrainPaymentDto;
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
		log.info("파라 확인 : " + dto.toString());
		
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
		log.info(jsonData);
		ResponseDto<?> response = new ResponseDto<>();
		Gson gson = new Gson(); 
		Type ticketListType = new TypeToken<ArrayList<TrainModifyDto>>(){}.getType();
		ArrayList<TrainModifyDto> ticketList = gson.fromJson(jsonData, ticketListType);
		log.info("수정확인 : " + ticketList.toString());
		List<Integer> ticketNo = new ArrayList<>();
		long totalPrice = 0;
		TrainReservation reservation = service.getReservationOne(user.getNo(), reservationNo);
		
		int count = reservation.getTotalCount();
		
		for (TrainModifyDto ticket : ticketList) {
			if ("선택안함".equals(ticket.getType())) {
				--count;
				ticketNo.add(ticket.getNo());
				log.info("수정확인 : " + "선택안함");
			} else if ("어른".equals(ticket.getType())) {
				TrainTicket target = service.getTicketByNo(ticket.getNo());
				target.setType(ticket.getType());
				service.updateTicket(target);
				totalPrice += target.getPrice();
				log.info("수정확인 : " + "어른");
			} else if ("어린이".equals(ticket.getType())) {
				TrainTicket target = service.getTicketByNo(ticket.getNo());
				target.setType(ticket.getType());
				service.updateTicket(target);
				totalPrice += target.getPrice();
				log.info("수정확인 : " + "어린이");
			}
		}
		log.info("수정확인 : " + totalPrice);
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
		response.setStatus("OK");
		return response;
	}
	
	@DeleteMapping("/reservation/{reservationNo}")
	public ResponseDto<?> delete(@LoginedUser User user, @PathVariable(name="reservationNo") int reservationNo) {
		service.deleteReservationByNo(user.getNo(), reservationNo);
		ResponseDto<?> response = new ResponseDto<>();
		response.setStatus("OK");
		
		
		return response;
	}
	
	/**
	 * 결제 창 요청
	 * @param user
	 * @param dto
	 * @return
	 * @throws IOException
	 */
	@GetMapping("/kakaoPay")
	public String kakaoPay(@LoginedUser User user, TrainPaymentDto dto) throws IOException {
		SessionUtils.addAttribute("reservationNo", dto.getReservationNo());
		StringBuffer outPutData = new StringBuffer();
		outPutData.append("cid=TC0ONETIME")
				.append("&partner_order_id=").append(dto.getReservationNo())
				.append("&partner_user_id=").append(user.getId())
				.append("&item_name=trainTicket")
				.append("&quantity=").append(String.valueOf(dto.getTotalCount()))
				.append("&total_amount=").append(String.valueOf(dto.getTotalPrice()))
				.append("&tax_free_amount=0")
				.append("&approval_url=http://localhost/train/kakaoPayment.nadri")
				.append("&cancel_url=http://localhost/train/reservationList.nadri")
				.append("&fail_url=http://localhost/train/failPayment.nadri");
		
		URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
		HttpURLConnection conn = (HttpURLConnection) address.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "KakaoAK 5fa0f0222e9a68676ec86330e233e3e7");
		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		conn.setDoOutput(true);
		
		OutputStream outPut = conn.getOutputStream();
		DataOutputStream data = new DataOutputStream(outPut);
		data.writeBytes(outPutData.toString());
		data.flush();
		data.close();
		
		BufferedReader rd;
		if(conn.getResponseCode() == 200) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		return rd.readLine();
	}
	
	/**
	 * tid저장하기
	 * @param tid
	 * @return
	 */
	@GetMapping("/progress")
	public String progress(String tid) {
		SessionUtils.addAttribute("tid", tid);
		return "";
	}
	
	// parameter받을 때 List<Integer> 로 받을 수 없나???
//	/**
//	 * 환불
//	 * @param user
//	 * @return
//	 * @throws IOException
//	 */
//	@GetMapping("/cancel")
//	public String refundKakao(@LoginedUser User user) throws IOException {
//		// 티켓 번호로 티켓 목록을 호출하기
//		// 지금은 가상의 값
//		int ticketNo = 123;
//		TrainTicket ticketss = service.getTicketByNo(ticketNo);
//		List<TrainTicket> ticketList = new ArrayList<>();
//		TrainReservation reservation = service.getReservationOne(user.getNo(), ticketss.getReservationNo());
//		int totalPrice = 0;
//		for (TrainTicket ticket: ticketList) {
//			totalPrice += ticket.getPrice();
//		}
//		
//		StringBuffer outPutData = new StringBuffer();
//		outPutData.append("cid=TC0ONETIME")
//				.append("&tid=").append(reservation.getTid())
//				.append("&cancel_amount=").append(String.valueOf(ticketList.size()))
//				.append("&cancel_tax_free_amount=").append(String.valueOf(totalPrice));
//		
//		URL address = new URL("https://kapi.kakao.com/v1/payment/cancel");
//		HttpURLConnection conn = (HttpURLConnection) address.openConnection();
//		conn.setRequestMethod("POST");
//		conn.setRequestProperty("Authorization", "KakaoAK 5fa0f0222e9a68676ec86330e233e3e7");
//		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
//		conn.setDoOutput(true);
//		
//		OutputStream outPut = conn.getOutputStream();
//		DataOutputStream data = new DataOutputStream(outPut);
//		data.writeBytes(outPutData.toString());
//		data.flush();
//		data.close();
//		
//		BufferedReader rd;
//		if(conn.getResponseCode() == 200) {
//			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//		} else {
//			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
//		}
//		return rd.readLine();
//	}
	
}
