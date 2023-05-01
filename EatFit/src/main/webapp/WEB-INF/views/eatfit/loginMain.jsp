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
  <link href="resources/css/reset.css" rel="stylesheet">
  <link href="resources/css/style.css" rel="stylesheet">
  <!-- js 연결 -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
 <!--header-->
  <nav class="navbar shadow fixed-top bg-white p-0">
    <div class="container pe-0">
      <h1 class="m-0"><a class="navbar-bran logo m-0" href="#">Eat-Fit</a></h1>
      <div class="navbar-brand profile">
        <div class="dropdown">
          <img src="/image/profile.png" data-bs-toggle="dropdown">
          <ul class="dropdown-menu shadow profile-drop">
            <li class=" mb-1 fw-bold text-center"> 김유열 님</li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item text-start mt-2 mb-2" href="/html/modify.html">- 회원정보 수정</a></li>
            <li><a class="dropdown-item text-start mt-2" href="/html/Foodcopy.html">- 로그아웃</a></li>
          </ul>
        </div>
      </div>
    </div>
  </nav>

  <!-- 메인 사진 -->
  <section id="mv">
    <div class="container">
      <div class="row">
        <div class="col-12 only-center"><img class="img-fluid" src="/image/mv.jpg" alt=""></div>
      </div>
    </div>
  </section>

  <!-- 식단 업로드 섹션 -->
  <section>
    <div class="container">
      <h1 class="col text-center main-text">오늘 드신 식단을 업로드하세요!</h1>
    </div>
    <div class="col text-center">
      <button class="col-sm-6 shadow p-3 mb-5 bg-body main-camera main-camera2" data-bs-toggle="modal" data-bs-target="#diet-camera-modal">
        <img src="/image/camera.png">
        <h6 class="mb-0">식단 촬영</h6>
      </button>
      <button class="col-sm-6 shadow p-3 mb-5 bg-body main-camera main-pen" data-bs-toggle="modal" data-bs-target="#diet-input-modal">
        <img src="/image/text.png">
        <h6 class="mb-0">식단 입력</h6>
      </button>

    </div>

  </section>
  <!-- 사용자 영양분 대시보드 -->
  <section>
    <div class="container">
        <div class="row p-3 m-1 border rounded">
          <div class="nutrient-bar-title">
            <h1>유열님의 오늘의 영양분</h1>
          </div>
          <div class="col-8 p-0">
            <div class="row">
              <div class="col-3 p-0 only-center nutrient">
                <span class="p-0 m-0 fw-bold">탄수화물</span>
              </div>
              <div class="col-8 p-0">
                <div class="progress">
                  <span class="progress-bar nutrient-bar" role="progressbar"data-toggle="tooltip" data-placement="top"
                  style="width: 40%; background-color: #daa521;">
                </span>

                </div>
                <span class="nutrient-bar-text">50/100</span>
              </div>
            </div>
            <div class="row mt-2">
              <div class="col-3 p-0 only-center nutrient">
                <span class="p-0 m-0 fw-bold">단백질</span>
              </div>
              <div class="col-8 p-0">
                <div class="progress">
                  <span class="progress-bar bg-primary nutrient-bar" role="progressbar" data-toggle="tooltip" data-placement="top"
                  style="width: 65%; background-color: #87ceea;">
                </span>
                </div>
                <span class="nutrient-bar-text">50/100</span>

              </div>
            </div>
            <div class="row mt-2">
              <div class="col-3 p-0 only-center nutrient">
                <span class="p-0 m-0 fw-bold">지방</span>
              </div>
              <div class="col-8 p-0">
                <div class="progress">
                  <span class="progress-bar nutrient-bar" data-toggle="tooltip" data-placement="top"
                  style="width: 80%; background-color: #fe6347;">
                </span>
                </div>
                <span class="nutrient-bar-text">50/10</span> 
              </div>
            </div>
          </div>
          <div class="col-4 px-0">
              <!-- 원형프로그래스-->
              <div class="single-chart w-100 ms-2">
                <svg viewBox="0 0 36 36" class="circular-chart green">
                  <path class="circle-bg"
                    d="M18 2.0845
                      a 15.9155 15.9155 0 0 1 0 31.831
                      a 15.9155 15.9155 0 0 1 0 -31.831"
                  />
                  <path class="circle"
                    stroke-dasharray="";
                    d="M18 2.0845
                      a 15.9155 15.9155 0 0 1 0 31.831
                      a 15.9155 15.9155 0 0 1 0 -31.831"
                  />
                  <text x="18" y="20.35" class="percentage" style="font-size:6px;">3500Kcal</text>
                </svg>
              </div>
             <!-- 원형프로그래스 끝-->
          </div>
        </div>

    </div>
  </section>

  <div class="div-section"></div>

<!-- 사용자 오늘 먹은 식단 -->
  <div class="contarier text-center main-meal">
    <h2>유열님의 오늘드신 식단은?</h2>
    <h5>오늘 식단의 영양성분을 알려드릴게요!</h5>
  </div>

  <!-- 만들어져야하는 카드 -->
  <section class="container content-center">
    <div class="card mt-3">
      <div class="row p-2 meal-card">
        <div class="col-5 text-start ps-3 pt-0 item-center">
          먹은 시간<span>00:00</span>
        </div>
        <div class="col-3 text-start p-0">
          <span id="time">아침</span>
        </div>
        <div class="col-4 only-center ps-5" style="display: none !important;">
          <span class="fs20">0</span><span class="fs20">g</span>
        </div>
        <div class="content-center today-meal-img">
          <!-- 변경시킬 이미지 -->
          <img src="/image/Eat-fit_default.png" class="rounded-start main-image img-fluid border" alt="#">
        </div>
      </div>

      <div class="row nutrient-info item-center mt-0 mb-2">
        <div class="col-6 text-start ps-4 pe-0">
          <span class="carbohydrate">탄</span>
          <span class="gram-font">0</span>g
          <span class="protein">단</span>
          <span class="gram-font">0</span>g
          <span class="lipid">지</span>
          <span class="gram-font">0</span>g
      </div>
      <div class="col-3 p-0">
        <span class="content-center kcal-font"><span>0</span>kcal</span>
      </div>
        <div class="col-3 ps-0 content-center">
        <button class="btn btn-success ht35" id="modal-btn">수정</button>
      </div>
      </div>
    </div>
  </section>




  <!-- ///////////////////////////////////////////////////////////////////////////////////////////
                           * - MODAL  
///////////////////////////////////////////////////////////////////////////////////////////////-->
<div class="modal fade" id="diet-camera-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel"> 직접 촬영한 사진을 확인해주세요!</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="only-center modal-body-style">
        <img class="img-fluid w-100" src="/image/Eat-fit_default.png" alt="" >
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary w-100">Understood</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="diet-input-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="diet-input-modal" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="diet-input-modal"> 직접 촬영한 사진을 확인해주세요!</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="only-center modal-body-style">
        <img class="img-fluid w-100" src="/image/Eat-fit_default.png" alt="" >
        </div>
      </div>
      <div class="modal-footer">

        <button type="button" class="btn btn-primary w-100">Understood</button>
      </div>
    </div>
  </div>
</div>
  <div style="height:140px;"></div>

  <!-- footer -->
  <footer class="container-fluid main-footer bg-white footer">
    <div class="row main-footer-a">
    <a class="col-4 m-0 only-center b-nav-1" href="/html/Food.html">식자재 보관함</a>
  
    <a class="col-4 m-0 only-center b-nav-2" id="nav-this" href="/html/LoginMaincopy.html">오늘의 잇-핏</a>
  
    <a class="col-4 m-0 only-center b-nav-3" href="/html/dietRecord.html">식단 기록일지</a>
  
  </div>
  </footer>


  <div class="container rec-btn p-0" id="scroll-hidden">
    <a href="/html/recommand.html" class="btn btn-warning rec-btn-shadow px-3" id="scroll-hidden">
     <div class="rec-text me-1">식단</div>
     <div class="rec-text me-1">추천</div>
    </button>
    </div> 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="resources/js/pro.js"></script>
  <script src="resources/js/main.js"></script>
    function handleSubmit(event) {
  event.preventDefault(); // 폼 제출 방지
  
  const formData = new FormData(event.target); // 폼 데이터 가져오기
  console.log(Object.fromEntries(formData)); // 객체로 변환하여 콘솔에 출력
}
  </script>
</body>

</html>