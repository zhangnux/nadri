package com.nadri.attr.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nadri.attr.vo.Attraction;

@Controller
@RequestMapping("/attr")
public class AttrRegiController {
	
	@GetMapping("/regiform.nadri")
	public String form(Model model) {

		return "/attr/attrform";	// prefix="/WEB-INF-views/" viewName="home" suffix=".jsp"
	}
}
