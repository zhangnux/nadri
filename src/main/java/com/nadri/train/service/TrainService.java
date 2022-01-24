package com.nadri.train.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nadri.train.mapper.TrainMapper;
import com.nadri.train.vo.TrainSchedule;
import com.nadri.train.vo.TrainStation;

@Service
public class TrainService {
	@Autowired
	TrainMapper mapper;
	
	public List<TrainStation> getStationByWord(int word) {
		return mapper.getStationByWord(word);
	}
	
	public List<TrainSchedule> getAllSchedules() {
		return mapper.getAllTrainSchedules();
	}
	
	public void addNewSchedule(List<TrainSchedule> schedules) {
		mapper.insertNewSchedule(schedules);
	}
}
