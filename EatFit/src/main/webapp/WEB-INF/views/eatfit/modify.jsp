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
<nav class="shadow fixed-top mb-2 bg-white ht-59">
  <div class="container mt-2 mb-2">
    <div class="row">
      <div class="col-3 only-center ">
    <div class="navbar-brand back"><a href="${cpath}/loginMain.do"><img src="resources/images/back3.png" alt=""></a></div>
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
            <li><a class="dropdown-item text-start mt-2" href="logout.do">- 로그아웃</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  </div>
</nav>


<section class="container">
  <div class="row d-flex text-center">
<h1 class="col-12 login-text" style="margin-top:150px; margin-bottom: 50px;">회원정보 수정</h1>

<!-- ///////////////////////////////////////////////////////////////////////////////////////////
                           3 - FORM 1
///////////////////////////////////////////////////////////////////////////////////////////////-->

  <!-- post로변경 나중에 회원가입 성공 controller로 변경 -->
  <form action="joinsuccess.do" method="get" class="row m-0 p-0" onsubmit="handleSubmit(event)">
    <section class="container row p-0 m-0" id="form1">
    <div class="col-1"></div>
  <div class="mb-3 col-10 mb-3">
    <label for="pw" class="form-label mb-3">아이디</label>
    <input type="text" class="form-control" id="id" name="id" placeholder="example" required autocomplete="off">
  </div>
  <div class="col-1"></div>
 
  <div class="col-1"></div>
  <div class="mb-3 col-10 mt-4">
    <label for="pw" class="form-label mb-3">비밀번호</label>
    <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호(8~20자 영문,숫자 특수문자 조합)" required autocomplete="off">
  </div>
  <div class="col-1"></div>
  
  <div class="col-1"></div>
  <div class="mb-3 col-10 mt-4">
    <label for="pw-check" class="form-label mb-3">비밀번호 확인</label>
    <input type="password" class="form-control" id="pw-check" name="pw-check" placeholder="비밀번호 재입력" required autocomplete="off">
  </div>
  <div class="col-1"></div>
  
  <div class="col-1"></div>
  <div class="mb-3 col-10 mt-4">
    <label for="nickname" class="form-label mb-3">닉네임</label>
    <input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임 입력" required autocomplete="off">
  </div>
  <div class="col-1"></div>
  
  <div class="col-1"></div>
    <a href="#form2" class="btn btn-secondary col-10 mt-3 next-btn" id="next-1">다음</a>
  <div class="col-1"></div>
</section>
<!-- ///////////////////////////////////////////////////////////////////////////////////////////
                           FORM 2 (성별)  
///////////////////////////////////////////////////////////////////////////////////////////////-->
<!-- <div style="height:100px"></div> -->
<section class="container row p-0 m-0 scroll-60" id="form2">
<div class="col-1"></div>
<div class="mb-3 col-10 mt-4">
  <label class="form-label mb-4">성별</label>
  <div class="row">
  <div class="col-6 purpose-text">
  <input type="checkbox" class="btn-check gender-check" id="male" name="gender" value="male" autocomplete="off">
<label class="btn my-btn only-center male-bc male-female" for="male"><span class="activity-title">남</span></label>
</div>
<div class="col-6 purpose-text">
<input type="checkbox" class="btn-check gender-check" id="female" name="gender" value="female" autocomplete="off">
<label class="btn my-btn only-center female-bc male-female" for="female"><span class="activity-title">여</span></label>
</div>
</div>
</div>
<div class="col-1"></div>

<div class="col-1"></div>
<div class="mb-3 col-10 mt-5">
<label for="age" class="form-label mb-4">나이</label>
<div class="input-group">
  <input type="text" class="form-control" placeholder="ex)20" name="age" id="age" autocomplete="off">
  <div>
    <span class="input-group-text bg-white border-0 pe-1"><span class="cm-kg">Age</span>
  </div>
</div>
</div>
<div class="col-1"></div>


<div class="col-1"></div>
<div class="mb-3 col-10 mt-5">
<label for="height" class="form-label mb-4">키</label>
<div class="input-group">
  <input type="text" class="form-control" placeholder="ex)160" name="height" id="height" autocomplete="off">
  <div>
    <span class="input-group-text bg-white border-0"><span class="cm-kg">Cm</span>
  </div>
</div>


</div>
<div class="col-1"></div>

<div class="col-1"></div>
<div class="mb-3 col-10 mt-5">
<label for="weight" class="form-label mb-4">몸무게</label>
<div class="input-group mb-3">
  <input type="text" class="form-control" placeholder="ex)50" name="weight" id="weight" autocomplete="off">
  <div>
    <span class="input-group-text bg-white border-0"><span class="cm-kg">Kg</span>
  </div>
</div>
</div>
<div class="col-1"></div>

<div class="col-1"></div>
<a href="#form3" class="btn btn-secondary col-10 mt-3 next-btn" id="next-2">다음</a>
<div class="col-1"></div>
</section>
 <!-- ///////////////////////////////////////////////////////////////////////////////////////////
                           FORM 3 식단목적,활동량
///////////////////////////////////////////////////////////////////////////////////////////////-->
<div style="height:200px"></div>
<section class="container row p-0 m-0 scroll-60" id="form3">
<div class="col-12">
  <div><label class="form-label m-0">- 식단목적</label></div>
</div>
  <div class="col-12">
  <div class="grayline2"></div>
</div>
<div class="col-12 mt-3"></div>


<div class="col-4 purpose-text">
  <input type="checkbox" class="btn-check bmd-check" id="bulk-up" autocomplete="off" name="purpose" value="bulkup">
  <label class="btn my-btn only-center purpose bulk-bc" for="bulk-up"><span class="activity-title">벌크업</span></label>
</div>

<div class="col-4 purpose-text">
  <input type="checkbox" class="btn-check bmd-check" id="maintain" autocomplete="off" name="purpose" value="maintain">
  <label class="btn my-btn only-center purpose maintain-bc" for="maintain"><span class="activity-title">유지어터</span></label>
</div>

<div class="col-4 purpose-text">
  <input type="checkbox" class="btn-check bmd-check" id="diet" autocomplete="off" name="purpose" value="diet">
  <label class="btn my-btn only-center purpose diet-bc" for="diet"><span class="activity-title">다이어트</span></label>
</div>
  <div class="col-12 mt-4"></div>


<!-- ///////////////////////////////////////////////////////////////////////////////////////////
                           FROM 4 활동량
///////////////////////////////////////////////////////////////////////////////////////////////-->
<div class="col-12">
  <div><label class="form-label m-0">- 활동량</label></div>
</div>
<div class="col-12">
  <div class="grayline2"></div>
</div>

<div class="col-12 mt-2 mb-3 mymy">
  <input type="checkbox" class="btn-check activity-level" id="activity-level-1" autocomplete="off" name="activity" value="1">
  <label class="btn pt-2 pb-2 my-btn w-100" for="activity-level-1"><span class="activity-title">아주 가벼운 활동</span><br><span class="activity-sub">ex) 대부분의 시간을 앉아서 보내는 활동수준</span></label>
</div>

<div class="col-12 mb-3 mymy">
  <input type="checkbox" class="btn-check activity-level" id="activity-level-2" autocomplete="off" name="activity" value="2">
  <label class="btn my-btn w-100" for="activity-level-2"><span class="activity-title">가벼운 활동</span><br><span class="activity-sub">ex) 걷거나 가벼운 운동을 하는 활동수준</span></label>
</div>

<div class="col-12 mb-3 mymy">
  <input type="checkbox" class="btn-check activity-level" id="activity-level-3" autocomplete="off" name="activity" value="3">
  <label class="btn my-btn w-100" for="activity-level-3"><span class="activity-title">중간 정도의 활동</span><br><span class="activity-sub">ex) 운동을 하지않거나 가벼운 유산소 운동을 하는 활동수준</span></label>
</div>

<div class="col-12 mb-3 mymy">
  <input type="checkbox" class="btn-check activity-level" id="activity-level-4" autocomplete="off" name="activity" value="4">
  <label class="btn my-btn w-100" for="activity-level-4"><span class="activity-title">높은 수준의 활동</span><br><span class="activity-sub"> ex) 중간 강도의 유산소 운동이나 근력운동을 하는 활동수준</span></label>
</div>

<div class="col-12 mb-3 mymy">
  <input type="checkbox" class="btn-check activity-level" id="activity-level-5" autocomplete="off" name="activity" value="5">
  <label class="btn my-btn w-100" for="activity-level-5"><span class="activity-title">아주 높은 수준의 활동</span><br><span class="activity-sub"> ex) 높은 강도의 유산소 운동이나 근력운동을 하는 활동수준</span></label>
</div>

<div class="col-1"></div>
<button type="submit" class="btn btn-warning col-10 mt-2 next-btn">완료</button>
<div class="col-1"></div>

</section>
</form>
<div style="height:100px"></div>

<footer class="container-fluid join123">
  <div class="row join-a">

  <a class="col-4 m-0 only-center" id="next-default" href="#">1</a>

  <a class="col-4 m-0 only-center" id="next-1-1" href="#form2">2</a>

  <a class="col-4 m-0 only-center"id="next-2-2" href="#form3">3</a>

</div>
</footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="./resources/js/pro.js"></script>

</body>

</html>