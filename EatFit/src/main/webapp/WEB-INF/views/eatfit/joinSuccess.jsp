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

 <nav class="navbar navbar-expand-lg navbar-dark shadow fixed-top p-0 d-flex">
    <div class="container mt-1 mb-1">
        <div class="text-center mx-auto">
          <h1 class="joinsc-logo mt-2 mb-2 mx-auto">Eat-Fit</h1>
        </div>
      </div>
  </nav>
  <div style="height:200px"></div>

  <section class="container">
    <div class="row">
      <div class="col-12">
      <div class="only-center" style="height:150px;">
        <!-- 로그인성공 애니메이션 -->
        <div class="success-checkmark">
          <div class="check-icon">
            <span class="icon-line line-tip"></span>
            <span class="icon-line line-long"></span>
            <div class="icon-circle"></div>
            <div class="icon-fix"></div>
          </div>
        </div>

      </div>
    <div class="text-center fw-bold mb-3" style="font-size: 25px;">가입완료</div>
    <div class="text-center text-muted">님 Eat-Fit 회원이 되신것을 환영합니다!</div>
    <div class="grayline mt-5 mb-5"></div>
  </div>

  <div class="col-6">
  <a href="#" class="btn btn-secondary fw-bold only-center" style="height:60px; width:100%"><span>처음으로</span></a>
</div>
<div class="col-6">
  <a href="login.do" class="btn btn-warning fw-bold only-center" style="height:60px; width:100%"><span>로그인</span></a>
</div>
</section>


  </div>
  </div>
</section>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="resources/js/pro.js"></script>
</body>

</html>