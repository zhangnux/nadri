package com.nadri.train.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nadri.train.dto.TrainSearchDto;
import com.nadri.train.exception.TrainException;
import com.nadri.train.mapper.TrainMapper;
import com.nadri.train.vo.TrainSchedule;
import com.nadri.train.vo.TrainStation;
import com.nadri.train.dto.TrainCriteria;

@Service
@Transactional
public class TrainService {
	Logger log = LogManager.getLogger(TrainService.class);
	
	@Autowired
	TrainMapper mapper;
	
	/**
	 * 첫번째 한글 단어 유니코드로 기차역 목록 조회
	 * @param word 한글 첫 글자 유니코드
	 * @return
	 */
	public List<TrainStation> getStationByWord(int word) {
		return mapper.getStationByWord(word);
	}
	
	/**
	 * 스케줄 더미데이터를 넣기 위한 class
	 * @return
	 */
	public List<TrainSchedule> getAllSchedules() {
		return mapper.getAllTrainSchedules();
	}
	public void addNewSchedule(List<TrainSchedule> schedules) {
		mapper.insertNewSchedule(schedules);
	}
	
	/**
	 * 검색 정보로 기차 스케줄 정보 반환
	 * @param criteria
	 * @return
	 * @throws  
	 */
	public List<TrainSearchDto> getSchedulesByCriteria(TrainCriteria criteria) {
		// 시간 차이를 어디서 계산하는게 좋을까???
		List<TrainSearchDto> dtos = mapper.getSchedulesByCriteria(criteria);
		
		for (TrainSearchDto dto : dtos) {
			long diff = dto.getArrivalTime().getTime() - dto.getDepartureTime().getTime();
			long hours = (diff / 1000) / 60 / 60 % 24;
			long minutes = (diff / 1000) / 60 % 60;
			long seconds = (diff / 1000) % 60;
			
			String time = String.format("%02d:%02d:%02d", hours, minutes, seconds);
			dto.setDiffTime(time);
		}
		return dtos;
	}
}
