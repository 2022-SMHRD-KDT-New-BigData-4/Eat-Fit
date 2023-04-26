package com.eatfit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.eatfit.mapper.EatFitMapper;

@Controller
public class MainController {

	@Autowired
	private EatFitMapper mapper;
	
	@GetMapping("/loginMain.do")
	public String loginMain() {
		return "loginMain";
	}
	
	@GetMapping("/joinSeccess.do")
	public String joinSeccess() {
		return "joinSeccess";
	}
	
}
