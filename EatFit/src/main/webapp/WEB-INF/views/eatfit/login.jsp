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
        <div class="col-3 ">
          <div class="navbar-brand back"><a href="/html/LoginMain.html"><img src="resources/images/back3.png" alt=""></a></div>
        </div>
        <div class="col-6 only-center">
          <span class="login-text">로그인</span>
        </div>
        <div class="col-3 text-end"></div>
      </div>
    </div>
  </nav>


  </div>
  </nav>
  <section class="container only-center mt-5 mb-5">
    <h1 class="login-logo">Eat-Fit</h1>
  </section>


  <section class="container">
    <div class="row">
      <form action="login.do" method="post">
        <div class="yu1">
          <input class="yu2" type="text" autocomplete="off" id="id" name="MEM_ID" required>
          <label for="id" class="yu4">아이디</label>
          <span class="yu3"></span>
        </div>
        <div class="yu1 mt-5">
          <input class="yu2" type="password" id="pw" name="MEM_PW" required>
          <label for="pw" class="yu4">비밀번호</label>
          <span class="yu3"></span>
        </div>
        <div>
          <button type="submit" class="btn btn-secondary login-btn"><span>로그인</span></button>
        </div>
      </form>
      <div>
        <button type="submit" class="btn p-0 kakao-btn"><span
            class="only-center"><img src="resources/images/kakao.png">카카오계정으로
            로그인</span></button>
      </div>
    </div>
    <div class="row mt-4">
      <span class="col-8 text-center text-muted mt-1">아직 잇-핏 회원이 아니신가요?</span>
      <a href="join.do" class="col-4 text-center join-text">회원가입</a>
    </div>
  </section>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="resources/js/pro.js"></script>
</body>

</html>