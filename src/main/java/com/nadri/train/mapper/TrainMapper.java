package com.nadri.train.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nadri.train.vo.TrainSchedule;
import com.nadri.train.vo.TrainStation;

@Mapper
public interface TrainMapper {
	
	List<TrainStation> getStationByWord(int word);
	List<TrainSchedule> getAllTrainSchedules();
	void insertNewSchedule(List<TrainSchedule> schedules);
}
