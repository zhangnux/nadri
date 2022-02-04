package com.nadri.train.service;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.nadri.train.dto.TrainSearchDto;
import com.nadri.train.mapper.TrainMapper;
import com.nadri.train.vo.TrainReservation;
import com.nadri.train.vo.TrainRoom;
import com.nadri.train.vo.TrainSchedule;
import com.nadri.train.vo.TrainSeat;
import com.nadri.train.vo.TrainStation;
import com.nadri.train.vo.TrainTicket;
import com.nadri.train.web.model.TrainRoomInfo;
import com.nadri.train.dto.TrainCriteria;
import com.nadri.train.dto.TrainFavoriteRouteDto;

@Service
@Transactional
public class TrainService {
	static final Logger log = LogManager.getLogger(TrainService.class);
	
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
		return mapper.getSchedulesByCriteria(criteria);
	}
	
	/**
	 * 열차번호와 타입에 해당하는 기차 호차 정보 반환
	 * @param roomInfo
	 * @return
	 */
	public List<TrainRoom> getTrainRoom(TrainRoomInfo roomInfo) {
		return mapper.getTrainRoom(roomInfo);
	}
	
	/**
	 * 스케줄 번호와 기차번호에 해당하는 예약된 좌석목록 조회
	 * @param scheduleNo
	 * @param trainNo
	 * @return
	 */
	public List<TrainSeat> getTrainSeatNo(int scheduleNo, int trainNo) {
		return mapper.getTrainSeatNo(scheduleNo, trainNo);
	}
	
	/**
	 * 예약된 정보와 예약 번호에 해당하는 티켓 정보를 추가
	 * @param reservation
	 * @param ticketList
	 */
	public int addNewReservation(TrainReservation reservation, List<TrainTicket> ticketList) {
		mapper.insertReservation(reservation);
		for (TrainTicket ticket : ticketList) {
			ticket.setReservationNo(reservation.getNo());
		}
		mapper.insertTicket(ticketList);
		return reservation.getNo();
	}
	
	/**
	 * 예약 번호에 해당하는 예약 정보 반환
	 * @param reservedNo1 가는 기차 예약번호
	 * @param reservedNo2 오는 기차 예약번호
	 * @return
	 */
	public List<TrainReservation> getReservationByNo(int reservedNo1, int reservedNo2) {
		return mapper.getReservationByNo(reservedNo1, reservedNo2);
	}
	
	/**
	 * 예약 번호에 해당하는 티켓 정보 반환
	 * @param reservedNo1 가는 기차 예약번호
	 * @param reservedNo2 오는 기차 예약번호
	 * @return
	 */
	public List<TrainTicket> getTicketByReservedNo(int reservedNo1, int reservedNo2) {
		return mapper.getTicketByReservedNo(reservedNo1, reservedNo2); 
	}
	
	/**
	 * 인기 노선 반환
	 * @return
	 */
	public List<TrainFavoriteRouteDto> getFavoriteRoute() {
		return mapper.getFavoriteRoute();
	}
	
	/**
	 * 예약 목록 반환
	 * @return
	 */
	public List<TrainReservation> getReservationIsReserved() {
		return mapper.getReservationIsReserved();
	}
	
	public void deleteTicket(List<Integer> deleteList) {
		mapper.deleteTicket(deleteList);
		mapper.deleteReservation(deleteList);
	}
}
