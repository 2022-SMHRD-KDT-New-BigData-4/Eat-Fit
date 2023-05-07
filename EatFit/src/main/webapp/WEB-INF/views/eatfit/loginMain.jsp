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
  <link href="./resources/css/reset.css" rel="stylesheet">
  <link href="./resources/css/style.css" rel="stylesheet">
  <!-- js 연결 -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>

<body>
<!-- ///////////////////////////////////////////////////////////////////////////////////////////
                           1 - NAV BAR  
///////////////////////////////////////////////////////////////////////////////////////////////-->
<nav class="shadow fixed-top mb-2 bg-white ht-59 scroll-hidden">
  <div class="container mt-2 mb-2">
    <div class="row">
      <div class="col-6 item-center ps-4">
    <span class="m-0 logo">Eat-Fit</span>
  </div>
      <div class="col-3 d-flex align-items-center ">
  </div>

    <div class="col-3 text-end">
      <div class="navbar-brand profile">
        <div class="dropdown">
          <img src="resources/images/profile.png" data-bs-toggle="dropdown">
          <ul class="dropdown-menu shadow profile-drop">
            <li class=" mb-1 fw-bold text-center"> ${mvo.MEM_ID} 님</li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item text-start mt-2 mb-2" href="modify.do">- 회원정보 수정</a></li>
            <li><a class="dropdown-item text-start mt-2" href="logout.do">- 로그아웃</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  </div>
</nav>


  <!-- 메인 사진 -->
  <section id="mv">
        <img src="./resources/images/mv1.png" alt="">
  </section>


  <!-- 식단 업로드 섹션 -->
  <section>
    <div class="container">
      <h1 class="col text-center main-text">오늘 드신 식단을 업로드하세요!</h1>
    </div>
    <div class="col text-center">
      <button class="col-sm-6 p-3 mb-5 bg-body main-camera main-camera2" data-bs-toggle="modal" data-bs-target="#diet-camera-modal">
        <img src="./resources/images/camera.png">
        <h6 class="mb-0">식단 촬영</h6>
      </button>
      <button class="col-sm-6 p-3 mb-5 bg-body main-camera main-pen" data-bs-toggle="modal" data-bs-target="#diet-input-modal">
        <img src="./resources/images/text.png">
        <h6 class="mb-0">식단 입력</h6>
      </button>

    </div>

  </section>
    <!-- 사용자 영양분 대시보드 -->
    <section>
    <div class="container">
        <div class="row p-3 m-1 border rounded">
          <div class="nutrient-bar-title">
            <h1>${mvo.MEM_NICK}님의 오늘의 영양분</h1>
          </div>
          <div class="col-8 p-0">
            <div class="row">
              <div class="col-3 p-0 only-center nutrient" style="display:block;">
                <span class="p-0 m-0 fw-bold mb-2">탄수화물</span>
              </div>
              <div class="col-8 p-0 mb-2">
      
                <div class="progress2 progress-moved">
                  <div class="progress-all progress-bar1" style="width:20%">
                  </div>       
                </div>
                <span class="nutrient-bar-text">${getNTSum.FOOD_CRB}/${mvo.MEM_CRB}</span>
            </div>
            <div class="col-3 p-0 only-center nutrient" style="display:block;">
              <span class="p-0 m-0 fw-bold mb-2">단백질</span>
            </div>
            <div class="col-8 p-0 mb-2">
    
              <div class="progress2 progress-moved">
                <div class="progress-all progress-bar2" style="width:50%">
                </div>       
              </div>
              <span class="nutrient-bar-text">${getNTSum.FOOD_PROTEIN}/${mvo.MEM_PROTEIN}</span>
          </div>
          <div class="col-3 p-0 only-center nutrient" style="display:block;">
            <span class="p-0 m-0 fw-bold">지방</span>
          </div>

          <div class="col-8 p-0">
  
            <div class="progress2 progress-moved">
              <div class="progress-all progress-bar3" style="width:75%">
              </div>       
            </div>
            <span class="nutrient-bar-text">${getNTSum.FOOD_FAT}/${mvo.MEM_FAT}</span>
        </div>
      </div>
      </div>
          <div class="col-4 px-0">
              <!-- 원형프로그래스-->
		  <input type="hidden" id="kcalEaten" value="${getNTSum.FOOD_CALORIE}">
              <div class="single-chart w-100 ms-2" style="width:100%!important; height:100%!important" >
       <svg viewBox="0 0 36 36">
  <defs>
    <linearGradient id="gradient" gradientTransform="rotate(90)">
      <stop offset="0%" stop-color="#4CC790"/>
      <stop offset="100%" stop-color="#318760"/>
    </linearGradient>
		  </defs>
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
		    style="stroke: url(#gradient);"
		  />
		  <text x="18" y="20.35" class="percentage" style="font-size:6px;">${mvo.MEM_CALORIE}Kcal</text>
		</svg>
              </div>
             <!-- 원형프로그래스 끝-->
          </div>
        </div>

   
  </section>

  <div class="div-section"></div>

<!-- 사용자 오늘 먹은 식단 -->
  <div class="contarier text-center main-meal">
    <h2>${mvo.MEM_NICK}님의 오늘드신 식단은?</h2>
    <h5>오늘 식단의 영양성분을 알려드릴게요!</h5>
  </div>

 <!-- 만들어져야하는 카드 -->
  <!-- jstl if문 사용하기 
      만약 DB에 해당 날짜에 데이터가 있다면 카드보여주기 / 없다면 "기록된 식단이 없습니다." 출력 -->
 <c:choose>
    <c:when test="${not empty uploadContent}">
	<c:forEach items="${uploadContent}" var="upload">
  		  <section class="container content-center">
		    <div class="card mt-3">
		      <div class="row p-2 meal-card">
		        <div class="col-3 text-start ps-3 pt-0 item-center">먹은 시간
		        </div>

		        <div class="col-5 text-start pt-0 item-center">
		        <span>${upload.REQ_DATE}</span>
		          
		        </div>
		        <div class="col-4 text-end ps-5">
		          <span id="time">${upload.MLD}</span>
		        </div>
		        <div class="content-center today-meal-img">
		          <!-- 변경시킬 이미지 -->
		          <img src="resources/images/origin/${upload.FOOD_IMG}" class="rounded-start main-image img-fluid border" onclick="mainImg('${upload.MLD}')" alt="#">
		        </div>
		      </div>
		
		      <div class="row nutrient-info item-center mt-0 mb-2">
		      
		        <div class="col-7 text-start ps-4 pe-0">
		          <span class="carbohydrate">탄</span>
		          <span class="gram-font">${upload.FOOD_CRB}</span>g
		          <span class="protein">단</span>
		          <span class="gram-font">${upload.FOOD_PROTEIN}</span>g
		          <span class="lipid">지</span>
		          <span class="gram-font">${upload.FOOD_FAT}</span>g
		      </div>
		      <div class="col-3 p-0">
		        <span class=" content-center kcal-font"><span>${upload.FOOD_CALORIE}</span>kcal</span>
		      </div>
		        <div class="col-2 ps-0 content-center">
		        <button class="btn btn-success ht35" id="modal-btn">수정</button>
		      </div>
		      </div>
		    </div>
		  </section>
  	</c:forEach>
  </c:when>
    <c:otherwise>
        <!-- 데이터가 없는 경우 메시지 출력 -->
        <div class="container text-center">
        	<p></p>
            <p class="fw-bold fs-18 mt-5">· 기록된 식단이 없습니다.</p>
        </div>
    </c:otherwise>
</c:choose>





  <!-- ///////////////////////////////////////////////////////////////////////////////////////////
                           * - MODAL  
///////////////////////////////////////////////////////////////////////////////////////////////-->
<div class="modal fade" id="diet-camera-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
        <div class="modal-body">
          <div type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="float:right" onclick="mainCameraClose()"></div>
        <div class="modal-title fs-5 text-center fw-bold mb-3 fs-18" id="staticBackdropLabel" onclick="cameraOn()">이미지를 클릭하여 사진촬영 또는 업로드</div>

        <div class="only-center modal-body-style">
          <input type="file" name="photoFile" id="photoFile" accept="image/*" capture="camera" style="display:none;">
        <img class="img-fluid w-100 ccc" id="photoImg" src="./resources/images/Eat-fit_default.png" alt="" onclick="mainCameraImg()">
        </div>
					<div class="container mc-display">
						<div class="mt-3 text-center">
							<div class="text-center MLD-title-div">
								<span id="MLD-title">식사 종류를 선택해 주세요!</span>
							</div>
							<div class="container MLD-body">
								<div class="row mx-auto">
									<div class="col-4 MLD-text">
										<input type="checkbox" class="btn-check bmd-check"
											id="morning" autocomplete="off" name="MLD" value="M">
										<label class="btn my-btn only-center M-bc" for="morning"><span
											class="activity-title">아침</span></label>
									</div>

									<div class="col-4 MLD-text">
										<input type="checkbox" class="btn-check bmd-check" id="lunch"
											autocomplete="off" name="MLD" value="L"> <label
											class="btn my-btn only-center L-bc" for="lunch"><span
											class="activity-title">점심</span></label>
									</div>

									<div class="col-4 MLD-text">
										<input type="checkbox" class="btn-check bmd-check" id="dinner"
											autocomplete="off" name="MLD" value="D"> <label
											class="btn my-btn only-center D-bc" for="dinner"><span
											class="activity-title">저녁</span></label>
									</div>
								</div>
							</div>
						<div class="fw-bold mt-4 fs-18">중량을 따로 입력하시고 싶다면 입력해주세요!</div>
						<div class="mt-2 fs-14">입력하지 않으면 일일 제공량으로 영양성분을 제공합니다</div>
						<div class="row mt-4">
							<c:forEach var="food_names" items="${food_names}">
										<div class="col-7 only-center fw-bold p-0 line-height-10" style="font-size: 18px;">${food_names} 중량 입력 : </div>
										<div class="col-4 px-0 line-height-10">
											<input type="hidden" name="food_name[]" value="${food_names}">
											<input type="number" class="w-100" placeholder="ex)200" name="gram[]" id="gram" autocomplete="off" max="5000" min="1" oninput="validity.valid||(value='');" style="border-bottom: 2px solid #aaaaaa;">
										</div>
										<div class="col-1 text-start p-0 only-center line-height-10">
											<span class="cm-kg p-0">g</span>
										</div>
									</c:forEach>
									<c:forEach var="food_weigth_arr" items="${food_weigth_arr}">
										<input type="hidden" name="food_weigth[]" value="${food_weigth_arr}">	
									</c:forEach>
						</div>


					</div>
					<div class="only-center">
       <button type="button" class="btn btn-warning mt-4"style="width: 80%" onclick="final_submit()">확인완료!</button>
      </div>
      </div>
    </div>
  </div>
</div>
</div>


<div class="modal fade" id="diet-input-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="diet-input-modal" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
        <div class="modal-body">
          <div type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="float:right" onclick="mainCameraClose()"></div>
        <div class="modal-title fs-5 text-center fw-bold mb-4" id="staticBackdropLabel" style="font-size:18px;" onclick="cameraOn()">드신 식단을 입력해주세요!</div>
          <div class="container">
     
    
          <label for="id" class="form-label mb-3" style="font-size:18px;">식단 입력</label>

  
          <input type="text" class="form-control px-0" id="id" name="id" placeholder="example" required autocomplete="off">

    
      </div>
      
        <div class="container">
        <div class="mt-3 text-center">
        <div class="fw-bold mt-4" style="font-size: 18px;">중량을 따로 입력하시고 싶다면 입력해주세요!</div>
        <div class="mt-2 fs-14">입력하지 않으면 일일 제공량으로 영양성분을 제공합니다</div>
        <div class="row mt-4">
          <div class="col-3 only-center fw-bold p-0" style="font-size:18px;">중량 입력:</div>
        <div class="col-8 px-0">
          <input type="number" class="w-100" placeholder="ex)500" name="gram" id="gram" autocomplete="off" max="5000" min="1" oninput="validity.valid||(value='');" style="border-bottom: 2px solid #aaaaaa;">
        </div>
          <div class="col-1 text-start p-0 only-center">
          <span class="cm-kg p-0">g</span>
        </div>
      </div>
      
     
</div>    
        <div class="only-center">
        <button type="button" class="btn btn-warning mt-4" style="width:80%">확인완료!</button>
      </div>
      </div>
    </div>
  </div>
</div>
</div>
  <div style="height:140px;"></div>



<!-- 업로드된 음식이미지 눌렀을 때 음식 하나하나의 상세 영양정보 확인할 수 있는 모달 -->
<div class="modal" tabindex="-1" id="mainFoodModal">
<div class="modal-dialog modal-dialog-centered">
  <div class="modal-content shadow" style="border: 3px solid green;">
    <div class="modal-body row">
    <div class="col-11 text-center fw-bold ps-5 pe-0 mb-4" style="font-size:20px;">
    분석된 음식별로 중량을 확인하세요!
    </div>

    <div class="col-1 text-end p-0 pe-2 pb-3">
    <button type="button" class="btn-close" id="food-modal-btn-close"></button>
    </div>
    <table class="table table-bordered border-primary text-center">
    <thead>
      <tr class="fs-18">

        <th scope="col">이름</th>
        <th scope="col">탄수화물</th>
        <th scope="col">단백질</th>
        <th scope="col">지방</th>
        <th scope="col">중량</th>
        <th scope="col">칼로리</th>
      </tr>
    </thead>
	<tbody>
	
    </tbody>
  </table>
    </div>
  </div>
</div>
</div>



  <!-- footer -->
  <footer class="container-fluid main-footer bg-white footer">
    <div class="row main-footer-a">
    <a class="col-4 m-0 only-center b-nav-1" href="${cpath}/food.do">식자재 보관함</a>
  
    <a class="col-4 m-0 only-center b-nav-2" id="nav-this" href="#">오늘의 잇-핏</a>
  
    <a class="col-4 m-0 only-center b-nav-3" href="${cpath}/foodDiary.do">식단 기록일지</a>
  
  </div>
  </footer>


  <div class="container rec-btn p-0 scroll-hidden">
    <a href="${cpath}/recommend.do" class="btn btn-warning rec-btn-shadow px-3">
     <div class="rec-text me-1">식단</div>
     <div class="rec-text me-1">추천</div>
    </button>
    </div> 

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="./resources/js/pro.js"></script>
  <script src="./resources/js/main.js"></script>

</body>

</html>