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

<!-- ///////////////////////////////////////////////////////////////////////////////////////////
                           1 - NAV BAR  
///////////////////////////////////////////////////////////////////////////////////////////////-->
<nav class="shadow fixed-top mb-2 bg-white">
  <div class="container mt-2 mb-2">
    <div class="row">
      <div class="col-3 d-flex align-items-center ">
    <div class="navbar-brand back"><a href="back.do"><img src="resources/images/back.png" alt=""></a></div>
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

  <section class="container text-center p-5 pb-0 food-sec">
  <span class="m-0">원하시는 식자재를 선택해 주시면<br> 제가 추천해드릴게요!</span>

  </section>
  <section class="roBack">
  </section>

  <section class="container only-center">
    <img src="resources/images/RO.png" class="robot">
  </section>
  <!-- class="position-absolute top-0 start-100 translate-middle bg-secondary border border-light rounded-circle span-close" -->
  <section class="container">
      <div class="p-4 shadow content-size row mx-auto">
        <h1 class="mb-2 text-center">${mvo.MEM_ID}님의 식자재 보관함</h1>
        <h5 class="card-subtitle mb-2 text-muted text-center">식자재를 선택하여 chatGPT에게 요리를<br>추천받아보세요!</h5>
        <div class="m-0">
        <c:forEach var="food" items="${msb}">
        	<span class="position-relative">
          		<button class="foodbox" value="${food.FOOD_SEQ}">
					<c:if test="${food.FOOD_NAME.contains(',')}">
						<c:set var="text" value="${fn:split(food.FOOD_NAME, ',')[0].trim()}"/>
						${text}
					</c:if>
					<c:if test="${not food.FOOD_NAME.contains(',')}">
						${food.FOOD_NAME.trim()}
					</c:if>
				</button> <span class="span-close" data-bs-toggle="modal" data-bs-target="#staticBackdrop"></span>
          	</span>
        </c:forEach>
        <div class="col-12" id="gpt-btn">
          <button class="btn btn-unstyled gpt-btn mt-5 w-100 only-center">
            <img src="resources/images/GPT.png">
            <span class="m-0 ms-2 fw-bold">ChatGPT에게 추천받기</span>
          </button>
        </div>
        
        <!-- ChatGPT답변 텍스트 박스 -->
        <div class="container shadow rounded only-center" id="result-container">
        	<textarea id="gptTextarea" readonly="readonly" rows="30" cols="50"
        	class="fw-bold" style="line-height:1em"></textarea>
        </div>
        
        <div class="col-12" style="height:50px"></div>
        </div>
      </div>

  </section>
  <div class="container add-btn">
      <button class="btn btn-warning eat-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">
       <span class="add-food">식자재</span><span class="add-food">추가</span>
      </button>
  </div> 

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content border-green">
  
      <div class="modal-body mt-3 mb-3">
        <form>
          <div class="row only-center">
          <div class="col-9">
            <input type="text" class="form-control" id="recipient-name" placeholder="가지고 있는 식자재를 입력해 추가해주세요!" style="height:40px;">
          </div>
          <div id="addMSB-btn" class="col-3 p-0 only-center">
            <button type="button" class="btn btn-warning">추가</button>
          </div>
        </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- 삭제 -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content" style="border: 2px solid green;">

      <div class="modal-body">
        <div class="row">
          <div class="col-12 text-center mt-3 mb-5">
       <span class="fw-bold fs-5 food-text"></span>
      </div>
        <div class="col-6 text-center">
        <button type="button" class="btn btn-warning del-btn del-btn-check">네!</a></button>
      </div>
      <div class="col-6  text-center">
        <button type="button" class="btn btn-secondary del-btn" data-bs-dismiss="modal">아니요!</button>
      </div>
    </div>
      </div>
    </div>
  </div>
</div>






</div>
  <div style="height:70px;"></div>
  <!-- footer -->
  <footer class="container-fluid main-footer bg-white footer">
    <div class="row main-footer-a">
    <a class="col-4 m-0 only-center" id="nav-this" href="#">식자재 보관함</a>
  
    <a class="col-4 m-0 only-center" href="loginMain.do">오늘의 잇-핏</a>
  
    <a class="col-4 m-0 only-center" href="foodDiary.do">식단 기록일지</a>
  
  </div>
  </footer>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="resources/js/pro.js"></script>
</body>

</html>
