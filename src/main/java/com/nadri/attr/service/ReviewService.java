package com.nadri.attr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nadri.attr.dao.AttrReviewDao;
import com.nadri.attr.vo.AttrReview;

@Service
public class ReviewService {

	@Autowired
	AttrReviewDao reviewDao;
	
	public List<AttrReview> getReviewList(int attNo, int beginIndex, int endIndex) { 
		return reviewDao.getListByNo(attNo, beginIndex, endIndex); 
	}
	
}
