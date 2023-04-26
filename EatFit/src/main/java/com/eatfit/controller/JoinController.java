package com.eatfit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eatfit.entity.Member;
import com.eatfit.mapper.EatFitMapper;

@Controller
public class JoinController {

	@Autowired
	private EatFitMapper mapper;

	// 회원가입
	@GetMapping("/join.do")
	public String join() {
		return "join";
	}
	
	@PostMapping("/join.do")
	public String join(Member vo) {
		return "join";
	}
	

	
	// 회원가입 성공
	@GetMapping("/joinSuccess.do")
	public String joinSuccess() {
		return "joinSuccess";
	}
	@PostMapping("/joinSuccess.do")
	public String joinSuccess(Member vo) {
		return "joinSuccess";
	}
	
	// 로그인
	@RequestMapping("/login.do")
	public String login() {
		return "login";
	}
	
	// 로그인 후 메인
	@GetMapping("/loginMain.do")
	public String loginMain() {
		return "loginMain";
	}
	
	// 식자재 보관함
	@GetMapping("/food.do")
	public String food() {
		return "food";
	}
	
	// 회원정보수정
	@GetMapping("/modify.do")
	public String modify() {
		return "modify";
	}
	
	// 식단추천 페이지
	@GetMapping("/recommand.do")
	public String recommand() {
		return "recommand";
	}
	
}
