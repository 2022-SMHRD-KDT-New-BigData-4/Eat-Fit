<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Eat-Fit</title>
  <!-- 부트스트랩 연결 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- style.css 연결 -->
  <link href="resources/css/style.css" rel="stylesheet">
  <link href="resources/css/style.css" rel="stylesheet">
  <!-- js 연결 -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
<!-- ///////////////////////////////////////////////////////////////////////////////////////////
                           1 - NAV BAR  
///////////////////////////////////////////////////////////////////////////////////////////////-->
<nav class="shadow fixed-top mb-2 bg-white">
  <div class="container mt-2 mb-2">
    <div class="row">
      <div class="col-3 item-center">
    <div class="navbar-brand back"><a href="/html/LoginMain.html"><img src="resources/images/back.png" alt=""></a></div>
  </div>
  <div class="col-6 only-center">
    <span class="m-0 logo">Eat-Fit</span>
  </div>
    <div class="col-3 text-end">
      <div class="navbar-brand profile">
        <div class="dropdown">
          <img src="resources/images/profile.png" data-bs-toggle="dropdown">
          <ul class="dropdown-menu shadow profile-drop">
            <li class=" mb-1 fw-bold text-center"> 김유열 님</li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item text-start mt-2 mb-2" href="#">- 회원정보 수정</a></li>
            <li><a class="dropdown-item text-start mt-2" href="#">- 로그아웃</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  </div>
</nav>

  <section class="container mt9">
    <div class="row ht37">
    <div class="sec_cal p-0 cal-content">
      <div class="cal_nav mb-2">
        <a href="javascript:;" class="nav-btn go-prev">prev</a>
        <div class="year-month ym-font"></div>
        <a href="javascript:;" class="nav-btn go-next">next</a>
      </div>
      <div class="cal_wrap">
        <div class="days">
          <div class="day day-text">월</div>
          <div class="day day-text">화</div>
          <div class="day day-text">수</div>
          <div class="day day-text">목</div>
          <div class="day day-text">금</div>
          <div class="day day-text">토</div>
          <div class="day day-text">일</div>
          
        </div>
        <div class="dates"></div>
      </div>
    </div> 
  </div>

  <div class="con-12 text-center fw-bold fs-5 mt-2">날짜를 클릭하여 식단을 확인하세요!</div>
</section>

<div class="div-section"></div>


	<section class="container">
		<div class="row">
			<div class="col-12">
				<div class="fw-bold ms-3 click-day mb-4" style="font-size: 25px;">
				</div>
			</div>
		</div>
	</section>
	
	<section class="container">
    <div class="row">
      <div class="col-1">
        <div class=" grayline3 p-1 mt-3"></div>
      </div>
      <div class="col 11">
        <div class="card mt-3">
          <div class="row p-2 meal-card mt-2">
            <div class="col-6 text-start">
              <span>먹은 시간 07:30</span>
            </div>
            <span class="col-6 text-end">
              <span id="time">아침</span>
            </span>
          </div>
          <div class="row">
            <div class="d-flex justify-content-center today-meal-img">
              <img src="resources/images/meal-ex.png" class="img-fluid rounded-start" alt="#">
            </div>
          </div>
    
          <div class="row nutrient-info d-flex align-items-center mt-0 mb-2">
            <div class="col-6">
            <p class="text-center">탄 50g 단 20g 지 10g</p>
          </div>
          <div class="col-3 p-0">
            <span class="text-center">1500kcal</span>
          </div>
            <div class="col-3">
            <button class="btn btn-success ms-3" style="height:35px;">수정</button>
          </div>
          </div>
        </div>
		
        <div class="card mt-3">
          <div class="row p-2 meal-card mt-2">
            <div class="col-6 text-start">
              <span>먹은 시간 07:30</span>
            </div>
            <span class="col-6 text-end">
              <span id="time">아침</span>
            </span>
          </div>
          <div class="row">
            <div class="d-flex justify-content-center today-meal-img">
              <img src="resources/images/meal-ex.png" class="img-fluid rounded-start" alt="#">
            </div>
          </div>
    
          <div class="row nutrient-info d-flex align-items-center mt-0 mb-2">
            <div class="col-6">
            <p class="text-center">탄 50g 단 20g 지 10g</p>
          </div>
          <div class="col-3 p-0">
            <span class="text-center">1500kcal</span>
          </div>
            <div class="col-3">
            <button class="btn btn-success ms-3" style="height:35px;">수정</button>
          </div>
          </div>
        </div>

        <div class="card mt-3">
          <div class="row p-2 meal-card mt-2">
            <div class="col-6 text-start">
              <span>먹은 시간 07:30</span>
            </div>
            <span class="col-6 text-end">
              <span id="time">아침</span>
            </span>
          </div>
          <div class="row">
            <div class="d-flex justify-content-center today-meal-img">
              <img src="resources/images/meal-ex.png" class="img-fluid rounded-start" alt="#">
            </div>
          </div>
    
          <div class="row nutrient-info d-flex align-items-center mt-0 mb-2">
            <div class="col-6">
            <p class="text-center">탄 50g 단 20g 지 10g</p>
          </div>
          <div class="col-3 p-0">
            <span class="text-center">1500kcal</span>
          </div>
            <div class="col-3">
            <button class="btn btn-success ms-3" style="height:35px;">수정</button>
          </div>
          </div>
        </div>

      </div>
    </div>
  </section>
















  <div style="height:70px;"></div>
  <!-- footer -->
  <footer class="container-fluid main-footer bg-white footer">
    <div class="row main-footer-a">
    <a class="col-4 m-0 only-center" href="food.do">식자재 보관함</a>
  
    <a class="col-4 m-0 only-center" href="loginMain.do">오늘의 잇-핏</a>
  
    <a class="col-4 m-0 only-center" id="nav-this" href="#">식단 기록일지</a>
  
  </div>
  </footer>













  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="resources/js/pro.js"></script>
  <script src="resources/js/calender.js"></script>
  <script>
    function handleSubmit(event) {
  event.preventDefault(); // 폼 제출 방지
  
  const formData = new FormData(event.target); // 폼 데이터 가져오기
  console.log(Object.fromEntries(formData)); // 객체로 변환하여 콘솔에 출력
}
  </script>
</body>

</html>