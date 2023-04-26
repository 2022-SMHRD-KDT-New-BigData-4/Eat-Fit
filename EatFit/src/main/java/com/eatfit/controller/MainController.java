package com.eatfit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.eatfit.mapper.BoardMapper;

@Controller
public class MainController {

	@Autowired
	private BoardMapper mapper;
	
	
	@GetMapping("/test1.do")
	public String test() {
		return "test1";
	}
	
	@GetMapping("/test2.do")
	public String test2() {
		return "test2";
	}
}
