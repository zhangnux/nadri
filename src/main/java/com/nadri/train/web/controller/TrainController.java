package com.nadri.train.web.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nadri.train.dto.TrainCriteria;
import com.nadri.train.dto.TrainSearchDto;
import com.nadri.train.service.TrainService;
import com.nadri.train.vo.TrainReservation;
import com.nadri.train.vo.TrainTicket;
import com.nadri.train.web.model.TrainSearchForm;
import com.nadri.user.annotation.LoginedUser;
import com.nadri.user.vo.User;

@Controller
@RequestMapping("/train")
public class TrainController {
	
	static final Logger log = LogManager.getLogger(TrainController.class);
	
	@Autowired
	TrainService service;
	
	/**
	 * 기차 스케줄 검색 창
	 * @return
	 */
	@GetMapping
	public String search(Model model) {
		// 인기 열차 루트
		// 9개,,, 출발지 도착지, 운임 (일반실), 출발일은 당일, 승객1, 편도 버튼 클릭시 form값 제출
		// 티켓팅된 티켓의 스케줄의 rootNo에 따라서 순위를 지정한다.
		// 사진은 어떻게 배분하지? 루트마다 다 정해져 잇는 건가?
		model.addAttribute("favoriteList", service.getFavoriteRoute());
		
		return "train/trainSearch";
	}
	
	/**
	 * 검색 정보를 바탕으로 기차 스케줄(편도면 1개, 왕복면 2개) 불러오기
	 * @param searchForm 검색 정보
	 * @return
	 * @throws ParseException 
	 */
	@PostMapping
	public String list(TrainSearchForm searchForm, Model model) {
		TrainCriteria criteria = new TrainCriteria();
		criteria.setDepartureStation(searchForm.getDepartureStation());
		criteria.setArrivalStation(searchForm.getArrivalStation());
		criteria.setDepartureDate(searchForm.getDpDate1(), searchForm.getDpTime1());
		criteria.setRowNo(searchForm.getRowNo1());
		
		List<TrainSearchDto> schedules1 = service.getSchedulesByCriteria(criteria);
		model.addAttribute("schedules1", schedules1);
		
		if ("왕복".equals(searchForm.getWay())) {
			criteria = new TrainCriteria();
			criteria.setDepartureStation(searchForm.getArrivalStation());
			criteria.setArrivalStation(searchForm.getDepartureStation());
			criteria.setDepartureDate(searchForm.getDpDate2(), searchForm.getDpTime2());
			criteria.setRowNo(searchForm.getRowNo2());
			
			List<TrainSearchDto> schedules2 = service.getSchedulesByCriteria(criteria);
			model.addAttribute("schedules2", schedules2);
		}
		
		model.addAttribute("searchForm", searchForm); 
		return "train/trainList";
	}
	
	/**
	 * 예약 확인 페이지
	 * @return
	 */
	@GetMapping("/confirmReservation.nadri")
	public String reservedTrain(@LoginedUser User user, int reservedNo1, @RequestParam(name="reservedNo2", required=false, defaultValue= "0") int reservedNo2, Model model) {
		List<TrainReservation> reservationList = service.getReservationByNo(user.getNo() ,reservedNo1, reservedNo2);
		List<TrainTicket> ticketList = service.getTicketByReservedNo(reservedNo1, reservedNo2);
		model.addAttribute("reservation1", reservationList.get(0));
		List<TrainTicket> ticket1 = new ArrayList<>();
		List<TrainTicket> ticket2 = new ArrayList<>();
		for (TrainTicket ticket : ticketList) {
			if (ticket.getReservationNo() == reservationList.get(0).getNo()) {
				ticket1.add(ticket);
			} else {
				ticket2.add(ticket);
			}
		}
		model.addAttribute("ticket1", ticket1);
		
		if (reservedNo2 != 0) {
			model.addAttribute("reservation2", reservationList.get(1));
			model.addAttribute("ticket2", ticket2);
		}
		return "train/confirmReservation";
	}
	
	/**
	 * 사용자 승차권 목록 페이지
	 * @param user
	 * @param model
	 * @return
	 */
	@GetMapping("/reservationList.nadri")
	public String reservatioinList(@LoginedUser User user, Model model) {
		List<TrainReservation> reservationList = service.getReservationByUserNo(user.getNo());
		model.addAttribute("reservationList", reservationList);
		return "train/reservationList";
	}
	
	/**
	 * 사용자 승차권 이용목록 페이지
	 * @return
	 */
	@GetMapping("/usedList.nadri")
	public String usedList() {
		// 과거에 결제하고 사용한 것들
		
		
		return "train/usedList";
	}
	
	/**
	 * 수정 페이지 
	 * @param reservationNo
	 * @return
	 */
	@GetMapping("/modify.nadri")
	public String modify(@LoginedUser User user, int reservationNo, Model model) {
		List<TrainReservation> reservation = service.getReservationByNo(user.getNo(), reservationNo, 0);
		model.addAttribute("reservation" ,reservation.get(0));
		List<TrainTicket> ticketList = service.getTicketByReservedNo(reservationNo, 0);
		model.addAttribute("ticketList", ticketList);
		
		return "train/modifyReservation";
	}
//  스케줄 값 늘리는 메소드
//	@GetMapping("/insert.do")
//	public void insertSchedule() {
//		
//		List<TrainSchedule> schedules = service.getAllSchedules();
//		List<TrainSchedule> newSchedules = new ArrayList<>();
//		// 부터 시작!
//		for (int i=31; i<41; i++) {
//			for(TrainSchedule schedule : schedules) {
//				TrainSchedule nwschedule = new TrainSchedule(); 
//				Calendar cal = Calendar.getInstance();
//					
//				cal.setTime(schedule.getDepartureTime());
//				cal.add(Calendar.DATE, i);
//				nwschedule.setDepartureTime(cal.getTime());
//				
//				cal.setTime(schedule.getArrivalTime()); 
//				cal.add(Calendar.DATE, i); 
//				nwschedule.setArrivalTime(cal.getTime());
//				
//				nwschedule.setTrainNo(schedule.getTrainNo());
//				nwschedule.setRouteNo(schedule.getRouteNo());
//				newSchedules.add(nwschedule);
//			}
//		}
//		service.addNewSchedule(newSchedules);
//	}
}
