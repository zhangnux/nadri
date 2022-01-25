package com.nadri.train.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nadri.train.dto.TrainSearchDto;
import com.nadri.train.vo.TrainSchedule;
import com.nadri.train.vo.TrainStation;
import com.nadri.train.dto.TrainCriteria;

@Mapper
public interface TrainMapper {
	
	/**
	 * 한글자 유니코드를 입력하여 기차역 목록 반환
	 * @param word
	 * @return
	 */
	List<TrainStation> getStationByWord(int word);
	
	/**
	 * 스케줄 더미데이터를 넣기 위한 class
	 * @return
	 */
	List<TrainSchedule> getAllTrainSchedules();
	void insertNewSchedule(List<TrainSchedule> schedules);
	
	/**
	 * 검색 정보를 입력하여 기차 스케줄 목록 반환
	 * @param criteria
	 * @return
	 */
	List<TrainSearchDto> getSchedulesByCriteria(TrainCriteria criteria);
}
