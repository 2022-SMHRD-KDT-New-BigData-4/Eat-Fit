package com.eatfit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.eatfit.mapper.BoardMapper;

@Controller
public class MainController {

	@Autowired
	private BoardMapper mapper;
	
	
	@GetMapping("/test.do")
	public String test() {
		return "test";
	}
}
