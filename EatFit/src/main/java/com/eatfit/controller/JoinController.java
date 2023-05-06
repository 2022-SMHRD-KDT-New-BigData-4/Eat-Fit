package com.eatfit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eatfit.entity.Food;
import com.eatfit.entity.MSB;
import com.eatfit.entity.Member;
import com.eatfit.mapper.EatFitMapper;

@Controller
public class JoinController {

	@Autowired
	private EatFitMapper mapper;
	
	// 회원가입 페이지로 이동
	@GetMapping("/join.do")
	public String join() {
		return "join";
	}
	
	// 회원가입페이지에서 회원가입 성공여부에 따라 페이지 이동
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
	
	// 로그인 페이지로 이동
	@GetMapping("/login.do")
	public String login() {
		return "login";
	}
	

	// 로그인페이지에서 로그인 성공여부에 따라 페이지 이동
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
	
	// logout시 세션무효화 후 로그인 페이지로이동 -> 추후 메인페이지로 이동 시켜줘야함
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 무효화
		return "redirect:/login.do";
	}
	
	
	// 뒤로가기 버튼시 loginMain페이지로 이동
	// -> url에 back.do로 나옴 수정필요
	@RequestMapping("/back.do")
	public String back(HttpServletRequest request, Model model) {
	    HttpSession session = request.getSession();
	    Member mvo = (Member) session.getAttribute("mvo");
	    model.addAttribute("mvo", mvo);
	    return "loginMain";
	}
	

	// 로그인메인 페이지로 이동
	@RequestMapping("/loginMain.do")
	public String loginMain(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
	    Member mvo = (Member) session.getAttribute("mvo");
	    model.addAttribute("mvo", mvo);
		return "loginMain";
	}
	
	
	// 식자재 보관함
	// 회원정보 세션을 가져오면서 식자재 보관함 이동
	@RequestMapping("/food.do")
	public String food(HttpServletRequest request, Model model) {
	    HttpSession session = request.getSession();
	    Member mvo = (Member) session.getAttribute("mvo");
	    model.addAttribute("mvo", mvo);
	    List<Food> food = mapper.foodMSB(mvo);
	    model.addAttribute("msb",food);
	    return "food";
	}
	
	
	// 식자재 추가하기
	@RequestMapping("/addMSB.do")
	public int addMSB(HttpServletRequest request, String add_food) {
		// 회원 아이디 가져오기
		HttpSession session = request.getSession();
	    Member mvo = (Member) session.getAttribute("mvo");
	    String MEM_ID = mvo.getMEM_ID();
	    
	    // 사용자가 입력한 음식이름이 포함된 식재료중 가장 낮은 food_seq값 가져오기
		int FOOD_SEQ = mapper.addFoodSearch(add_food);
		
		// MEM_ID와 FOOD_SEQ로 MSB객체 만들어 식단보관함 테이블에 데이터 추가하기
		MSB msb = new MSB(MEM_ID, FOOD_SEQ);
		int cnt = mapper.addMSB(msb);

		return cnt;
	}
	
	
	// 식자재 삭제하기
	@RequestMapping("/deleteMSB.do")
	public int deleteMSB(HttpServletRequest request, int delete_seq) {
		// 회원 아이디 가져오기
		HttpSession session = request.getSession();
	    Member mvo = (Member) session.getAttribute("mvo");
	    String MEM_ID = mvo.getMEM_ID();
	    
	    MSB msb = new MSB(MEM_ID, delete_seq);
	    
	    int cnt = mapper.deleteMSB(msb);
	    
	    return cnt;
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
	
	// 홈화면
	@GetMapping("/eatfit.do")
	public String eatfit() {
		return "Home";
	}
	
	
	
}
