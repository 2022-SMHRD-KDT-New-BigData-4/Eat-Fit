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
 <!--header-->
  <nav class="navbar fixed-top bg-white p-0 shadow ht-59">
    <div class="container pe-0">
        <div class="row">
      <h1 class="navbar-bran logo m-0 color-green">Eat-Fit</h1>
    </div>
    <a href="/html/join.html" class="me-4 join-btn">회원가입</a>
</div>
  </nav>
  <div id="video_area">
    <video id="bgvid" autoplay muted loop >
      <source src="/image/video.mov" type="video/mp4">
    </video>
  </div>

  <div class="container position-relative">
      <div class="row only-center home-img">
        <!-- <video id="bgvid" autoplay muted loop style="z-index:-999;">
            <source src="/image/video.mov" type="video/mp4">
        
        </video> -->
    <div class="text-center mv-wrap">
        <!-- <div class="home-logo ffffff" style="color:white;"> -->
          <!-- <p class="home-logo home-logo-text ffffff" style="color:white;">" Eat, Live, Well "</p> -->
          <div class="type-js headline home-logo">
            <h1 class="text-js">" Eat, live, well "</h1>
          </div>

        <div class="fw-bold home-sub-title">YOLOv7과 ChatGPT를 활용한 1인가구<br>건강식단 추천 서비스</div>
        <div class="only-center">
        <a class="join-btn1 only-center shadow d-block w-70"><span class="logo-home-text me-3">잇-핏</span>로그인</a>
    </div>
    <div class="only-center">
        <a href="/html/HomeKaKao.html" class="join-btn2 only-center shadow d-block w-70 mt-2"><img class="me-2 wh-30" src="/image/kakao.png">카카오 계정으로 로그인</a>
    </div>
    </div>
</div>
<div class="container only-center position-relative b-70">
<div class="container123">
  <a href="#scrool-down" class="text-decoration-none">
  <div class="chevron"></div>
  <div class="chevron"></div>
  <div class="chevron"></div>
  <span class="text123">Scroll down</span>
  </a>

</div>
  
</div>

</div>

<div class="only-center main-center-text">
  <p class="fw-bold fs-5 scroll-60" id="scrool-down">잇- 핏의 기능을 확인하세요!</p>
</div>
   <div class="container h-fit-content"id="carousel-top" style="margin-bottom: 100px;">
     <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1" style="position: relative; top:50px;"></button>
          <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2" style="position: relative; top:50px;"></button>
          <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3" style="position: relative; top:50px;"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active" data-bs-interval="10000">
            <img src="/image/0116.png" class="d-block w-100 h-fit-content" alt="...">
            <div class="carousel-caption d-md-block pt-0">
              <p class="fw-bold carousel-text mb-4">식단분석</p>
              <p class="carousel-sub-text">이미지를 클릭하여 사진촬영 또는 업로드시  잇-핏AI가 사진을 분석하여 영영정보를 제공합니다</p>
            </div>
          </div>
          <div class="carousel-item" data-bs-interval="2000">
            <img src="/image/0113.png" class="d-block w-100 h-fit-content" alt="...">
            <div class="carousel-caption d-md-block pt-0">
              <p class="fw-bold carousel-text mb-4">chatGPT's 레시피</p>
                <p class="carousel-sub-text">식자재를 보관함에 추가하여 관리하고, 선택된 식자재를 기반으로 chatGPT에게 추천레시피를 제공받을 수 있습니다</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="/image/0112.png" class="d-block w-100 h-fit-content" alt="...">
            <div class="carousel-caption d-md-block pt-0">
              <p class="fw-bold carousel-text mb-4">맞춤 식단 추천</p>
                <p class="carousel-sub-text">남은 하루섭취 영양을 계산하여 한끼식사의 영양을 맞추어 최적의 식단을 추천해드립니다! </p>
            </div>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
    </div> 


  <div class="container-fluid bg-black" style="position: relative;">
    <div class="row text-center">
        <div class="col-12 ps-0 pb-4 pt-4 text-muted">
          <a style="text-decoration: none; color:white" href="https://smhrd.or.kr/" target="_blank">스마트 인재 개발원</a> | Created by <span class="text-white">식단히어로</span><br><br>
          지능형 빅데이터 분석서비스 개발자과정 
        </div>
      </div>
    </div>
  
  </div>



  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="resources/js/pro.js"></script>

</body>

</html>