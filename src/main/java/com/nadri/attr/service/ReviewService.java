package com.nadri.attr.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.nadri.attr.dao.AttrDao;
import com.nadri.attr.dao.AttrReviewDao;
import com.nadri.attr.vo.AttrReview;
import com.nadri.attr.vo.AttrReviewPic;
import com.nadri.attr.vo.Attraction;

@Service
public class ReviewService {

	@Autowired
	AttrReviewDao reviewDao;
	@Autowired
	AttrDao attrDao;
	
	public List<AttrReview> getReviewList(int attNo, int beginIndex, int endIndex) { 
		return reviewDao.getListByNo(attNo, beginIndex, endIndex); 
	}
	
	public void addReview(AttrReview attrReview, List<AttrReviewPic> attrReviewPic) throws Exception{ 
		reviewDao.insertReview(attrReview);
		for(AttrReviewPic pic:attrReviewPic) {
			pic.setNo(attrReview.getNo());
			reviewDao.insertReviewPic(pic);
		}
	}
	
	public void removeReview(int reviewNo) { reviewDao.deleteReview(reviewNo); }
	
}
