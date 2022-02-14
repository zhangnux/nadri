package com.nadri.attr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nadri.attr.dao.AttrDao;
import com.nadri.attr.dao.AttrReviewDao;
import com.nadri.attr.vo.AttrReview;
import com.nadri.attr.vo.AttrReviewPic;

@Service
public class ReviewService {

	@Autowired
	AttrReviewDao reviewDao;
	@Autowired
	AttrDao attrDao;
	
	public List<AttrReview> getReviewList(int attNo, int beginIndex, int endIndex) { 
		return reviewDao.getListByNo(attNo, beginIndex, endIndex); 
	}

	public void addReview(AttrReview attrReview) throws Exception{ 
		reviewDao.insertReview(attrReview);
	}

	public void modifyReview(int reviewNo, String content) throws Exception{ 
		reviewDao.updateReview(reviewNo, content);
	}
		
	public void removeReview(int reviewNo) { reviewDao.deleteReview(reviewNo); }
	
}
