package com.nadri.manager.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.nadri.manager.dto.AgePaymentDto;
import com.nadri.manager.dto.CategoryStatus;
import com.nadri.manager.dto.DayRateDto;
import com.nadri.manager.dto.FavoriteCategoryDto;
import com.nadri.manager.dto.GenderPaymentDto;
import com.nadri.manager.dto.UserAgeRate;
import com.nadri.manager.dto.UserCountDate;
import com.nadri.manager.dto.UserCriteria;
import com.nadri.manager.vo.Manager;
import com.nadri.user.vo.User;

@Mapper
public interface ManagerMapper {
	
	Manager getManager(String id);
	
	List<User> getAllUser();
	
	List<User> getUserByCriteria(UserCriteria criteria);
	
	List<Integer> getGenderRateOfUser();
	
	List<UserAgeRate> getAgeRateOfUser();
	
	/**
	 * 검색어로 검색된 결과 개수 조회
	 * @return
	 */
	int getCountUserByCriteria(UserCriteria criteria);
	
	/**
	 * 인기 기차 노선 4개
	 * @return
	 */
	List<FavoriteCategoryDto> getFavoriteTrain();
	
	/**
	 * 인기 음식점 4개
	 * @return
	 */
	List<FavoriteCategoryDto> getFavoirteRestuarnt();
	
	/**
	 * 인기 음식점 4개
	 * @return
	 */
	List<FavoriteCategoryDto> getFavoirteAttraction();
	
	/**
	 * 지금달과 지난 달의 회원가입수
	 * @param now
	 * @param before
	 * @return
	 */
	List<UserCountDate> getUserCountByMonth(@Param("now") int now, @Param("before") int before);
	
	/**
	 * 나이별 누적 금액
	 * @return
	 */
	List<AgePaymentDto> getAgePayment();
	
	/**
	 * 성별 누적 금액
	 * @return
	 */
	List<GenderPaymentDto> getGenderPayment();
	
	/**
	 * 금일 금액과, 유저 가입, 탈퇴 수
	 * @return
	 */
	DayRateDto getDayRate();
	
	CategoryStatus getTrainStatus();
	CategoryStatus getRestaurantStatus();
	CategoryStatus getAttractionStatus();
}
