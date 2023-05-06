package com.eatfit.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eatfit.entity.Diary;
import com.eatfit.entity.Food;
import com.eatfit.entity.MSB;
import com.eatfit.entity.Member;
import com.eatfit.entity.SearchDiary;
import com.eatfit.entity.Upload;
import com.eatfit.mapper.EatFitMapper;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

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
		if (gender.equals("남")) {
			cal = (10 * weigth) + (6.25 * height) - (5 * age) + 5;
		} else {
			cal = (10 * weigth) + (6.25 * height) - (5 * age) - 161;
		}

		// 활동량에 따른 에너지 대사량
		if (goal.equals("SED")) {
			cal = cal * 1.2;
		} else if (goal.equals("LPA")) {
			cal = cal * 1.375;
		} else if (goal.equals("MPA")) {
			cal = cal * 1.55;
		} else if (goal.equals("HPA")) {
			cal = cal * 1.725;
		} else {
			cal = cal * 1.9;
		}

		// 식단목적에 따른 에너지 대사량
		if (activity.equals("D")) {
			cal = cal * 0.8;
		} else if (activity.equals("B")) {
			cal = cal * 1.2;
		} else {
			cal = cal;
		}

		// 구해진 에너지 대사량 회원정보 저장
		vo.setMEM_CALORIE(cal);
		vo.setMEM_CRB(cal * 11 / 20 / 4);
		vo.setMEM_PROTEIN(cal / 5 / 4);
		vo.setMEM_FAT(cal / 4 / 9);

		int cnt = 0;
		cnt = mapper.join(vo);
		if (cnt >= 1) {
			return "joinSuccess";
		} else {
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
		if (mvo != null) { // 로그인 성공 체크
			session.setAttribute("mvo", mvo);
			return "redirect:/loginMain.do"; // 메인화면
		} else {
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
		String mem_id = mvo.getMEM_ID();
		System.out.println(mem_id);

		// 로그인 메인페이지 사용자 대시보드 섭취하고 난 뒤 영양정보 가져오기
		// 사용자 대시보드에 보여줄 섭취한 칼로리 가져오기

		// 업로드 정보 select
		List<Upload> uploadContent = mapper.upload(mem_id);
		Upload getNTSum = mapper.getNTSum(mem_id);

		// 시간만 빼내기
		String moveURL = null;

		if (uploadContent.isEmpty()) {
			// 섭취 칼로리 0
			session.setAttribute("getNTSum", "0");
			moveURL = "loginMain";
		} else {
			// System.out.println(uploadContent);

			for (int i = 0; i < uploadContent.size(); i++) {
				// 아침, 점심, 저녁으로 바꾸기
				if (uploadContent.get(i).getMLD().equals("M")) {
					uploadContent.get(i).setMLD("아침");
				} else if (uploadContent.get(i).getMLD().equals("L")) {
					uploadContent.get(i).setMLD("점심");
				} else if (uploadContent.get(i).getMLD().equals("D")) {
					uploadContent.get(i).setMLD("저녁");
				}
			}
			model.addAttribute("uploadContent", uploadContent);
			model.addAttribute("getNTSum", getNTSum);
			// System.out.println(uploadContent);

			moveURL = "loginMain";
		}
		return moveURL;
	}

	// 플라스크에서 ajax 통해 받아온 음식 이미지, 이름 정보
	@RequestMapping("/getFoodData.do")
	public void getFoodData(HttpServletRequest request, Model model) {

		// id, req_date, food_seq, food_weigth, food_img, analogy_food_img -> DB에 보내야 함

		HttpSession session = request.getSession();
		Member mvo = (Member) session.getAttribute("mvo");
		// 세션에 있는 id 가져오기
		String MEM_ID = mvo.getMEM_ID();

		// 플라스크에서 받아온 food_img, analogy_food_img, food_name 가져오기
		String analyze_image = request.getParameter("analyze_image");
		String origin_image = request.getParameter("origin_image");
		String[] cNames = request.getParameterValues("cNames");
		// String mem_id = request.getParameter("mem_id");

		System.out.println(MEM_ID);

		// 플라스크에서 받아온 food_name 앞뒤로 [] 자르고 큰따옴표 자르기
		String[] food_names = cNames[0].substring(1, cNames[0].length() - 1).replace("\"", "").split(",");
		System.out.println(food_names[0]); // 닭갈비
		// food_names[0] -> 닭갈비 // food_weigth_arr[0] -> 400.0

		for (int i = 0; i < food_names.length; i++) {
			String food_name = food_names[i];
			// 음식 이름 -> food_seq로 바꾸기 위한 select
			int food_seq = mapper.uploadFoodSearch(food_name);

			// insert 할 객체 만들기
			Upload uvo = new Upload();
			uvo.setMEM_ID(MEM_ID);
			String day = null;
			uvo.setFOOD_SEQ(food_seq);
			uvo.setFOOD_IMG(origin_image);
			uvo.setANALOGY_FOOD_IMG(analyze_image);

			// 중량, MLD 제외하고 insert 하기
			int cnt = mapper.insertUploadData(uvo);
		}

		// 해당 음식의 중량을 select(음식 중량 디폴트값 가져오려고)
		List<Food> foodData_arr = mapper.getFoodWeigth(MEM_ID);
		System.out.println(foodData_arr.get(0).getFOOD_NAME()); // 닭갈비

		ArrayList<Double> food_weigth_arr = new ArrayList<Double>();

		for (int i = 0; i < food_names.length; i++) {
			double food_weigth = foodData_arr.get(i).getFOOD_WEIGTH();
			food_weigth_arr.add(food_weigth);
		}
		// 음식 개수만큼 중량 입력할 수 있는 칸 만들기 위해 세션에 저장
		session.setAttribute("food_names", food_names);
		session.setAttribute("food_weigth_arr", food_weigth_arr);
		System.out.println(food_weigth_arr);
	}

	@PostMapping("/getFoodData2.do")
	public void getFoodData2(HttpServletRequest request, Model model) {

		// MLD, 중량 입력받아서 계산하는 식
		// update문으로 MLD, 중량 입력
		// 모든 음식 탄단지, 칼로리 더하는 식 필요

		HttpSession session = request.getSession();
		Member mvo = (Member) session.getAttribute("mvo");
		// 세션에 있는 id 가져오기
		String MEM_ID = mvo.getMEM_ID();

		String MLD = request.getParameter("MLDValue");
		// String[] foodGN_arr = request.getParameterValues("foodGN_arr");
		// System.out.println(MLD);

		String[] foodGram_arr = request.getParameter("foodGram_arr").split(",");
		String[] foodName_arr = request.getParameter("foodName_arr").split(",");
		// System.out.println(Arrays.toString(foodGram_arr));
		// System.out.println(Arrays.toString(foodName_arr));

		// foodGram_arr[1] : 100 // foodName_arr[1] : 돼지고기볶음

		// 음식 이름 -> food_seq로 바꾸기 위한 select
		for (int i = 0; i < foodName_arr.length; i++) {
			String food_name = foodName_arr[i];
			int food_seq = mapper.uploadFoodSearch(food_name);
			// System.out.println(food_seq);

			Double food_gram = Double.parseDouble(foodGram_arr[i]);
			// System.out.println(food_gram);

			// update 할 객체 만들기
			Upload uvo = new Upload();
			uvo.setMEM_ID(MEM_ID);
			uvo.setFOOD_SEQ(food_seq);
			uvo.setMLD(MLD);
			uvo.setFOOD_WEIGTH(food_gram);

			// System.out.println(uvo.getMEM_ID());
			// System.out.println(uvo.getFOOD_SEQ());
			// System.out.println(uvo.getMLD());
			// System.out.println(uvo.getFOOD_WEIGTH());

			int cnt = mapper.updateWeigth(uvo);
		}

	}

	// 식자재 보관함
	// 회원정보 세션을 가져오면서 식자재 보관함 이동
	@RequestMapping("/food.do")
	public String food(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Member mvo = (Member) session.getAttribute("mvo");
		model.addAttribute("mvo", mvo);
		List<Food> food = mapper.foodMSB(mvo);
		model.addAttribute("msb", food);
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
	@RequestMapping("/foodDiary.do")
	public String foodDiary(HttpServletRequest request, Model model) {
		// 회원 아이디 가져오기
		HttpSession session = request.getSession();
		Member mvo = (Member) session.getAttribute("mvo");

		// 식단기록장 기록 날짜 조회하기
		List<Integer> diary = mapper.foodDiary(mvo.getMEM_ID());

		model.addAttribute("mvo", mvo);
		model.addAttribute("diary", diary);

		return "foodDiary";
	}

	// 식단기록일지 선택날짜 정보가져오기
	@RequestMapping(value = "/searchDiary.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public String searchDiary(HttpServletRequest request, String req_date) {
		HttpSession session = request.getSession();
		Member mvo = (Member) session.getAttribute("mvo");

		// 객체 생성
		Diary diary = new Diary(mvo.getMEM_ID(), req_date);

		// 특정 날짜의 식단기록 조회
		List<SearchDiary> diary_list = mapper.searchDiary(diary);

		// model.addAttribute("diary_list", diary_list);
		// List<SearchDiary>를 JSON 문자열로 변환
		ObjectMapper mapper = new ObjectMapper();
		String json = null;
		try {
			json = mapper.writeValueAsString(diary_list);
		} catch (JsonProcessingException e) {
			// 예외 처리
			e.printStackTrace();
		}

		// JSON 응답
		return json;
	}

	// 홈화면
	@GetMapping("/eatfit.do")
	public String eatfit() {
		return "Home";
	}

}
