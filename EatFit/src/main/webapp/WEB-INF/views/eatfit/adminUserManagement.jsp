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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!--chart js-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <script src="./resources/js/main.js"></script>

</head>

<body>
    <!--header-->
    <div class="admin-header shadow">
        <span>Eat-Fit</span>
        <a href="#"><img src="resources/images/profile.png"></a>
        <span>관리자</span>
    </div>

    <div class="con-wrap">
        <!--왼쪽 nav-->
        <div class="left-nav shadow">
            <ul>
                <li><a href="adminDashBoard.do">대시보드</a></li>
                <li><a href="#">데이터 관리</a></li>
                <li style="background-color: #1f8648;"><a href="#" style="color: #fff;">사용자 관리</a></li>
            </ul>
        </div>

        <!-- 회원 목록 -->
        <section class="all-user-box">
            <div class="all-white-box">
                <div class="user-list-text">
                    <span>· 회원 목록</span>
                </div>
                <div class="search-box">
                    <form action="#" method="post">
                        <div>
                            <span>회원 ID 검색</span>
                            <input type="text" name="id">
                            <input type="submit" value="검색"></input>
                        </div>
                    </form>
                </div>

                <div class="table-parent">
                    <table class="user-table">
                        <tr class="user-table-title bold">
                            <td>아이디</td>
                            <td>닉네임</td>
                            <td>성별</td>
                            <td>나이</td>
                            <td>키(cm)</td>
                            <td>몸무게(kg)</td>
                            <td>식단목적</td>
                            <td>활동량</td>
                            <td>기초대사량(kcal)</td>
                        </tr>
                        <tr>
                            <td>test1</td>
                            <td>테스트1</td>
                            <td>남</td>
                            <td>20</td>
                            <td>176</td>
                            <td>72</td>
                            <td>유지어터</td>
                            <td>높은 수준의 활동</td>
                            <td>1680</td>
                        </tr>
                        <tr>
                            <td>test2</td>
                            <td>테스트2</td>
                            <td>여</td>
                            <td>25</td>
                            <td>165</td>
                            <td>65</td>
                            <td>다이어트</td>
                            <td>가벼운 수준의 활동</td>
                            <td>1500</td>
                        </tr>
                        <tr>
                            <td>test3</td>
                            <td>테스트3</td>
                            <td>남</td>
                            <td>18</td>
                            <td>178</td>
                            <td>68</td>
                            <td>벌크업</td>
                            <td>아주 가벼운 수준의 활동</td>
                            <td>1600</td>
                        </tr>
                    </table>
                </div>
            </div>
        </section>
    </div>
</body>

</html>