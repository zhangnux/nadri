package com.nadri.train.web.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nadri.train.service.TrainService;
import com.nadri.train.vo.TrainSchedule;

@Controller
@RequestMapping("/train")
public class TrainController {
	
	static final Logger log = LogManager.getLogger(TrainController.class);
	
	@Autowired
	TrainService service;
	
	@GetMapping
	public String search() {
		return "train/trainSearch";
	}
	
	@GetMapping("/list.do")
	public String list() {
		return "train/trainList";
	}
	
	@GetMapping("/insert.do")
	public void insertSchedule() {
		
		List<TrainSchedule> schedules = service.getAllSchedules();
		List<TrainSchedule> newSchedules = new ArrayList<>();
		for (int i=1; i<5; i++) {
//			for(TrainSchedule schedule : schedules) {
			TrainSchedule schedule = schedules.get(0);
			TrainSchedule nwschedule = new TrainSchedule(); 
				
				log.info("전: " + schedule.getDepartureTime());
				Calendar cal = Calendar.getInstance();
					
				cal.setTime(schedule.getDepartureTime());
				cal.add(Calendar.DATE, i);
				log.info("후: " + cal.getTime());
				nwschedule.setDepartureTime(cal.getTime());
				
				cal.setTime(schedule.getArrivalTime()); 
				cal.add(Calendar.DATE, i); 
				nwschedule.setArrivalTime(cal.getTime());
				nwschedule.setTrainNo(schedule.getTrainNo());
				nwschedule.setRouteNo(schedule.getRouteNo());
				newSchedules.add(nwschedule);
//			}
		}
		service.addNewSchedule(newSchedules);
		
		for(TrainSchedule schedule : newSchedules) {
			System.out.println("출발 : " + schedule.getDepartureTime());
		}
		
//		for (int i=0; i<3; i++) {
//			Calendar cal = Calendar.getInstance();
//				
//			cal.setTime(schedules.get(i).getDepartureTime());
//			cal.add(Calendar.DATE, i);
//			log.info("출: " + schedules.get(i).getDepartureTime());
//			log.info("출: " + cal.getTime());
//			
//			cal.setTime(schedules.get(i).getArrivalTime()); 
//			cal.add(Calendar.DATE, i); 
//			log.info("후: " + schedules.get(i).getArrivalTime());
//			log.info("후: " + cal.getTime());
//		}
	}
}
