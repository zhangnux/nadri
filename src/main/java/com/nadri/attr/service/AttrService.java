package com.nadri.attr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nadri.attr.dao.AttrDao;
import com.nadri.attr.vo.Attraction;

@Service
@Transactional
public class AttrService {

	@Autowired
	private AttrDao attrDao;
	
	public List<Attraction> getAllAttrList(){return attrDao.allAttrList();}
	public int getListCount() {return attrDao.attrcount();}
	
}
