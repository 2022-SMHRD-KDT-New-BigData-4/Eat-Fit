package com.eatfit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eatfit.entity.Member;
import com.eatfit.mapper.EatFitMapper;

@Controller
public class JoinController {

	@Autowired
	private EatFitMapper mapper;

	@GetMapping("/join.do")
	public String join() {
		return "join";
	}
	
	int cnt = 0;
	@RequestMapping("/join.do")
	public String join(Member vo) {

		cnt = mapper.join(vo);
		if (cnt > 1) {
			return "test2";
			
		}
		return "join";
	}

	
}
