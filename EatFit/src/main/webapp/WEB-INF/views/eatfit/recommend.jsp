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
      <div class="col-3 d-flex align-items-center ">
    <div class="navbar-brand back"><a href="loginMain.do"><img src="resources/images/back3.png" alt=""></a></div>
  </div>
  <div class="col-6 d-flex justify-content-center align-items-center">
    <span class="m-0 logo">Eat-Fit</span>
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
  
  <section class="container text-center p-2 pb-0 mb-5 recommand-text">
    <span class="m-0 fw-bold">Eat-Fit 추천 식단</span>
    <p class="mt-4">추천된 식단에 기반한 음식의 영양성분들을 확인하세요!</p>
  </section>

  <section class="container d-flex justify-content-center">
    <div class="row shadow border recommand-con">
    <div class="col-12 p-1 d-flex justify-content-center mb-3">

    </div>
    
    <c:forEach var="reco" items="${reco_food}">
    <div class="col-1"></div>
    <div class="col-6 p-0 text-start bg-check">
            <span class="reco-food-name">${reco.FOOD_NAME} (${reco.FOOD_WEIGTH}g)</span></div>
    <div class="col-4 mb-1"> <span id="b4">${reco.FOOD_CALORIE}kcal</span></div>

    <div class="col-12 m-2"></div>

    <div class="col-1"></div>
    <div class="col-4 tandanji" style="margin-right:-10px"><span>탄 :</span><span id="b1">${reco.FOOD_CRB}g</span></div>
    <div class="col-3 tandanji"><span>단 :</span><span id="b2">${reco.FOOD_PROTEIN}g</span></div>
    <div class="col-4 tandanji" style="margin-left:5px"><span>지 :</span><span id="b3">${reco.FOOD_FAT}g</span></div>
    
    <div class="col-12 m-2"></div>
    <div class="col-12 m-2"></div>
    </c:forEach>




<div class="container">
<div class="col-12 grayline mb-3"></div>
</div>

<c:forEach var="food_url" items="${reco_food}">
<div class="col-12 m-2"></div>
<div class="col-12 mt-2 mb-2">
  <span class="rec-youtube-titte">· ${food_url.FOOD_NAME} 요리법</span>
</div>
<div class="col-12 m-2"></div>
<div class="col-12 mb-3 only-center">
  <iframe width="100%" height="315" src="${food_url.FOOD_RECIPE}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
</div>
</c:forEach>
  </section>


  <div style="height:70px;"></div>
  <!-- footer -->
  <footer class="container-fluid main-footer bg-white footer">
    <div class="row main-footer-a">
    <a class="col-4 m-0 only-center b-nav-1" href="${cpath}/food.do">식자재 보관함</a>
  
    <a class="col-4 m-0 only-center b-nav-2" href="${cpath}/loginMain.do">오늘의 잇-핏</a>
  
    <a class="col-4 m-0 only-center b-nav-3" href="${cpath}/foodDiary.do">식단 기록일지</a>
  
  </div>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="./resources/js/pro.js"></script>

</body>

</html>