package com.nadri.attr.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nadri.attr.mapper.AttrMapper;
import com.nadri.attr.mapper.AttrReviewMapper;
import com.nadri.attr.vo.AttrReview;
import com.nadri.attr.vo.AttrReviewPic;

@Service
public class ReviewService {

	@Autowired
	AttrReviewMapper reviewMapper;
	@Autowired
	AttrMapper attrMapper;
	
	public List<AttrReview> getReviewList(int attNo, int beginIndex, int endIndex) {
		List<AttrReview> reviewContent = reviewMapper.getListByNo(attNo, beginIndex, endIndex);
		for(AttrReview pic:reviewContent) {
			int reviewNo = pic.getNo();
			List<String> pics = reviewMapper.getReviewPic(reviewNo);
			if(pics != null) {
				pic.setPic(pics);
			}
		}
		return reviewContent;
	}
	
	/*
	public List<AttrReview> getReviewList(int attNo, int beginIndex, int endIndex) { 
		return reviewMapper.getListByNo(attNo, beginIndex, endIndex); 
	}
	*/

	public void addReview(AttrReview attrReview, List<AttrReviewPic> attrReviewPic) throws Exception{ 
		reviewMapper.insertReview(attrReview);
		for(AttrReviewPic pic:attrReviewPic) {
			pic.setNo(attrReview.getNo());
			reviewMapper.insertReviewPic(pic);
		}
	}

	public void modifyReview(int reviewNo, String content) throws Exception{ 
		reviewMapper.updateReview(reviewNo, content);
	}
		
	public void removeReview(int reviewNo) { reviewMapper.deleteReview(reviewNo); }
	
}
