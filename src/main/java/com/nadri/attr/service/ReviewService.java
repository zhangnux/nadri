package com.nadri.attr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nadri.attr.dao.ReviewDao;

@Service
public class ReviewService {

	@Autowired
	ReviewDao reviewDao;
	
	public int getReviewCount(int attNo) {return reviewDao.reviewcount(attNo);}
}
