package com.nadri.attr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nadri.attr.dao.AttrDao;
import com.nadri.attr.dto.AttOptionDetail;
import com.nadri.attr.vo.AttrReview;
import com.nadri.attr.vo.Attraction;
import com.nadri.attr.vo.Search;

@Service
@Transactional
public class AttrService {

	@Autowired
	private AttrDao attrDao;
	
	public List<Attraction> getAllAttrList(){return attrDao.allAttrList();}
	public int getListCount() {return attrDao.attrcount();}
	public List<Attraction> getSearchResult(Search search){return attrDao.searchAttraction(search);}
	public int getSearchedRowCount(Search search){ return attrDao.getSearchedRow(search); }
	public Attraction getDetailPage(int no) { return attrDao.getDetailByNo(no); }
	public List<Attraction> getOptionInfo(int no) { return attrDao.getOptionByNo(no); }
	public int getReviewCount(int attNo) { return attrDao.reviewCount(attNo); }
	public double getStarCount(int attNo) { return attrDao.star(attNo); }
	public List<Attraction> getRandom(int attNo, String place) { return attrDao.random(attNo, place); }
	
}
