package com.nadri.train.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.nadri.train.dto.TrainSearchDto;
import com.nadri.train.vo.TrainRoom;
import com.nadri.train.vo.TrainSchedule;
import com.nadri.train.vo.TrainStation;
import com.nadri.train.web.model.TrainRoomInfo;
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
	
	/**
	 * 열차번호와 타입에 해당하는 열차의 모든 호차정보를 반환
	 * @param roomInfo
	 * @return
	 */
	List<TrainRoom> getTrainRoom(TrainRoomInfo roomInfo);
	
	/**
	 * 스케줄 번호와 호차 기차객차 번호에 해당하는 예약된자석 목록 반환
	 * @param scheduleNo 스케줄 번호
	 * @param roomNo scheduleNo
	 * @return
	 */
	List<Integer> getTrainSeatNo(@Param("scheduleNo") int scheduleNo, @Param("roomNo") int roomNo);
}
