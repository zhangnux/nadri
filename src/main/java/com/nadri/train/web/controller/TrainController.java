package com.nadri.train.web.controller;

import java.text.ParseException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nadri.train.dto.TrainCriteria;
import com.nadri.train.dto.TrainSearchDto;
import com.nadri.train.service.TrainService;
import com.nadri.train.web.model.TrainSearchForm;

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
	public String search() {
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
