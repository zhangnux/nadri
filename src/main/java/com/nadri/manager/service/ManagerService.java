package com.nadri.manager.service;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nadri.manager.dto.UserAgeRate;
import com.nadri.manager.dto.UserCriteria;
import com.nadri.manager.exception.LoginErrorException;
import com.nadri.manager.mapper.ManagerMapper;
import com.nadri.manager.util.CountRate;
import com.nadri.manager.vo.Manager;
import com.nadri.manager.web.restController.ManagerRestController;
import com.nadri.user.vo.User;

@Service
public class ManagerService {
	static final Logger log = LogManager.getLogger(ManagerRestController.class);
	@Autowired
	ManagerMapper mapper;
	
	public Manager login(String id, String password) {
		Manager manager = mapper.getManager(id);
		if (manager == null) {
			throw new LoginErrorException("존재하지 않는 정보입니다");
		} else if (!password.equals(manager.getPassword())) {
			throw new LoginErrorException("존재하지 않는 정보입니다");
		}
		return manager;
	}
	
	/**
	 * 모든 유저 정보 반환
	 * @return
	 */
	public List<User> getAllUser() {
		return mapper.getAllUser();
	}
	
	/**
	 * 검색어에 해당하는 유저 정보 반환
	 * @param option
	 * @param keyword
	 * @return
	 */
	public List<User> getUserByCriteria(UserCriteria criteria) {
		return mapper.getUserByCriteria(criteria);
	}
	
	public List<Integer> getGenderRateOfUser(int total) {
		return CountRate.rate(total, mapper.getGenderRateOfUser());
	}
	
	public List<UserAgeRate> getAgeRateOfUser(int total) {
		List<UserAgeRate> rates = mapper.getAgeRateOfUser();
		for (UserAgeRate rate: rates) {
			rate.setCount(CountRate.rate(total, rate.getCount()));
		}
		return rates;
	}
	
	public int getCountUserByCriteria(UserCriteria criteria) {
		return mapper.getCountUserByCriteria(criteria);
	}
}
