package com.nadri.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.nadri.manager.dto.FavoriteTrainDto;
import com.nadri.manager.dto.UserAgeRate;
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
	
	List<FavoriteTrainDto> getFavoriteTrain();
		
}
