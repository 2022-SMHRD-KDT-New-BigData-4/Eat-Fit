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
	
	@GetMapping("/join.do")
	public String join() {
		return "join";
	}
	
	@PostMapping("/join.do")
	public String join(Member vo) {
		
		// 회원가입 정보중 회원의 대사량 파악에 필요한 정보 불러오기
		double age = vo.getMEM_AGE();
		double height = vo.getMEM_HEIGHT();
		double weigth = vo.getMEM_WEIGTH();
		String goal = vo.getMEM_GOAL();
		String activity = vo.getMEM_ACTIVITY();
		String gender = vo.getMEM_GENDER();
		
		// 성별, 키, 몸무게, 나이에 따른 기초대사량
		double cal = 0;
		if(gender.equals("남")) {
			cal = (10*weigth)+(6.25*height)-(5*age)+5;
		}else{
			cal = (10*weigth)+(6.25*height)-(5*age)-161;
		}
		
		// 활동량에 따른 에너지 대사량
		if(goal.equals("SED")) {
			cal = cal*1.2;
		}else if(goal.equals("LPA")) {
			cal = cal*1.375;
		}else if(goal.equals("MPA")) {
			cal = cal*1.55;
		}else if(goal.equals("HPA")) {
			cal = cal*1.725;
		}else {
			cal = cal*1.9;
		}
		
		// 식단목적에 따른 에너지 대사량
		if(activity.equals("D")) {
			cal = cal*0.8;
		}else if(activity.equals("B")) {
			cal = cal*1.2;
		}else {
			cal = cal;
		}
		
		// 구해진 에너지 대사량 회원정보 저장
		vo.setMEM_CALORIE(cal);
		vo.setMEM_CRB(cal*11/20/4);
		vo.setMEM_PROTEIN(cal/5/4);
		vo.setMEM_FAT(cal/4/9);
		
		int cnt = 0;
		cnt = mapper.join(vo);
		if (cnt >= 1) {
			return "joinSuccess";
		}else {
			return "join";
		}
	}
	
	@GetMapping("/login.do")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login.do")
	public String login(Member vo, HttpSession session) {
		Member mvo = mapper.login(vo);
		if(mvo != null) { // 로그인 성공 체크
			session.setAttribute("mvo", mvo);
			return "loginMain"; // 메인화면
		}else {
			return "login";
		}
		
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 무효화
		return "login";
	}
	
	@GetMapping("loginMain.do")
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
	@GetMapping("/recommend.do")
	public String recommand() {
		return "recommend";
	}
	
	// 식단기록일지 페이지
	@GetMapping("/foodDiary.do")
	public String foodDiary() {
		return "foodDiary";
	}
	
}
