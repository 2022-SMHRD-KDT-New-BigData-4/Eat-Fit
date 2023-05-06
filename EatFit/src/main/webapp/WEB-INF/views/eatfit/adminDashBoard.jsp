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
                <li style="background-color: #1f8648;"><a href="#" style="color: #fff;">대시보드</a></li>
                <li><a href="#">데이터 관리</a></li>
                <li><a href="adminUserManagement.do">사용자 관리</a></li>
            </ul>
        </div>

        <!--통계-->
        <div class="all-dash-board">
            <div class="board-con">
                <div class="board-wrap">
                    <div class="shadow">
                        <span>· 가장 많이 업로드된 음식</span>
                        <canvas id="uploadFood" width="430" height="280"></canvas>
                    </div>
                    <div class="shadow">
                        <span>· 가장 많이 추천된 음식</span>
                        <canvas id="recoFood" width="430" height="280"></canvas>
                    </div>
                    <div class="shadow">
                        <span>· 가장 많이 입력된 식자재</span>
                        <canvas id="inputFood" width="430" height="280"></canvas>
                    </div>
                    <div class="shadow">
                        <span>· 남녀별 일일 평균 영양성분</span>
                        <canvas id="genderAvg" width="430" height="280"></canvas>
                    </div>
                    <div class="shadow">
                        <span>· 식단목적별 일일 평균 영양
                            <canvas id="goalAvg" width="430" height="280"></canvas>
                    </div>
                    <div class="shadow">
                        <span>· 활동량별 일일 평균 영양성분</span>
                        <canvas id="activityAvg" width="430" height="280"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="./resources/js/main.js"></script>
    <script>
        // 가장 많이 업로드된 음식
        var context = document.getElementById('uploadFood').getContext('2d');
        var uploadFood = new Chart(context, {
            type: 'bar', // 차트의 형태
            data: { // 차트에 들어갈 데이터
                labels: [
                    //x 축
                    '1', '2', '3', '4', '5'
                ],
                datasets: [
                    { //데이터
                        //fill: false,  //line 형태일 때, 선 안쪽을 채우는지 안채우는지
                        data: [
                            21, 50, 25, 20, 60 //x축 label에 대응되는 데이터 값
                        ],
                        backgroundColor: [
                            //색상
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)'
                        ],
                    }
                ]
            },
            options: {
                responsive: false,
                scales: {
                    yAxes: [
                        {
                            ticks: {
                                beginAtZero: true
                            }
                        }
                    ]
                }
            }
        });

        // 가장 많이 추천된 음식
        var context = document.getElementById('recoFood').getContext('2d');
        var recoFood = new Chart(context, {
            type: 'bar', // 차트의 형태
            data: { // 차트에 들어갈 데이터
                labels: [
                    //x 축
                    '1', '2', '3', '4', '5'
                ],
                datasets: [
                    { //데이터
                        //fill: false,  //line 형태일 때, 선 안쪽을 채우는지 안채우는지
                        label: 'test1',
                        data: [
                            21, 50, 25, 20, 60 //x축 label에 대응되는 데이터 값
                        ],
                        backgroundColor: [
                            //색상
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)'
                        ],
                    }
                ]
            },
            options: {
                responsive: false,
                scales: {
                    yAxes: [
                        {
                            ticks: {
                                beginAtZero: true
                            }
                        }
                    ]
                }
            }
        });

        // 가장 많이 입력된 식자재 
        var context = document.getElementById('inputFood').getContext('2d');
        var inputFood = new Chart(context, {
            type: 'bar', // 차트의 형태
            data: { // 차트에 들어갈 데이터
                label: 'test1',
                labels: [
                    //x 축
                    '1', '2', '3', '4', '5'
                ],
                datasets: [
                    { //데이터
                        //fill: false,  //line 형태일 때, 선 안쪽을 채우는지 안채우는지
                        data: [
                            21, 50, 25, 20, 60 //x축 label에 대응되는 데이터 값
                        ],
                        backgroundColor: [
                            //색상
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)'
                        ],
                    }
                ]
            },
            options: {
                responsive: false,
                scales: {
                    yAxes: [
                        {
                            ticks: {
                                beginAtZero: true
                            }
                        }
                    ]
                }
            }
        });

        // 남녀별 일일 평균 영양성분
        var context = document.getElementById('genderAvg').getContext('2d');
        var genderAvg = new Chart(context, {
            type: 'doughnut', // 차트의 형태
            data: { // 차트에 들어갈 데이터
                label: 'test1',
                labels: [
                    //x 축
                    '여', '남'
                ],
                datasets: [
                    { //데이터
                        //fill: false,  //line 형태일 때, 선 안쪽을 채우는지 안채우는지
                        data: [
                            21, 50 //x축 label에 대응되는 데이터 값
                        ],
                        backgroundColor: [
                            //색상
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)'
                        ],
                    }
                ]
            },
            options: {
                responsive: false,
                scales: {
                    yAxes: [
                        {
                            ticks: {
                                beginAtZero: true
                            }
                        }
                    ]
                }
            }
        });
        // 식단목적별 일일 평균 영양성분
        var context = document.getElementById('goalAvg').getContext('2d');
        var goalAvg = new Chart(context, {
            type: 'pie', // 차트의 형태
            data: { // 차트에 들어갈 데이터
                label: 'test1',
                labels: [
                    //x 축
                    '벌크업', '유지어터', '다이어트'
                ],
                datasets: [
                    { //데이터
                        //fill: false,  //line 형태일 때, 선 안쪽을 채우는지 안채우는지
                        data: [
                            21, 50, 70 //x축 label에 대응되는 데이터 값
                        ],
                        backgroundColor: [
                            //색상
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(75, 192, 192, 0.2)'
                        ],
                    }
                ]
            },
            options: {
                responsive: false,
                scales: {
                    yAxes: [
                        {
                            ticks: {
                                beginAtZero: true
                            }
                        }
                    ]
                }
            }
        });
        // 활동량별 일일 평균 영양성분
        var context = document.getElementById('activityAvg').getContext('2d');
        var activityAvg = new Chart(context, {
            type: 'pie', // 차트의 형태
            data: { // 차트에 들어갈 데이터
                label: 'test1',
                labels: [
                    //x 축
                    '아주 가벼움', '가벼움', '중간', '높음', '아주 높음'
                ],
                datasets: [
                    { //데이터
                        //fill: false,  //line 형태일 때, 선 안쪽을 채우는지 안채우는지
                        data: [
                            21, 50, 70, 50, 30 //x축 label에 대응되는 데이터 값
                        ],
                        backgroundColor: [
                            //색상
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)'
                        ],
                    }
                ]
            },
            options: {
                responsive: false,
                scales: {
                    yAxes: [
                        {
                            ticks: {
                                beginAtZero: true
                            }
                        }
                    ]
                }
            }
        });
    </script>

</body>

</html>