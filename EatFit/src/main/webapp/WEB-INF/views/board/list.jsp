<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${cpath}/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8d45de088d1bc1cafb574e9dcceb8fb"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
    	// 페이지 번호 클릭 시 이동하기
    	var pageFrm = $("#pageFrm");
    	$(".page-item a").on("click", function(e){
    		e.preventDefault(); // a 태그의 기능을 막을 때 사용
    		var page = $(this).attr("href");
    		pageFrm.find("#page").val(page);
    		pageFrm.submit(); // ${cpath}/list.do?page=2
    	});
    	
    	// 상세보기
    	$(".move").on("click",function(e){
            e.preventDefault(); // a tag의 기능을 막을때 사용
            var num= $(this).attr("href");
            var tag= "<input Type='hidden' name='num' value='"+num+"'>";
            pageFrm.append(tag);
            pageFrm.attr("action","${cpath}/get.do");
            //get 방식으로 보낼때
            //pageFrm.attr("method","get");
            pageFrm.submit(); //${cPath}/get.do?num=2&page=3
         });
    	
    	// 책 검색 버튼이 클릭되었을 때 처리
    	$("#search").click(function(){
    		var bookname = $("#bookname").val();
    		if(bookname===''){
    			alert("책 제목을 입력하세요")
    			return false;
    		}
    		// kakao 책 검색 openAPI 연동하기(Daum API)
    		$.ajax({
    			url : "${cpath}/booksearch.do", // ?query=bookname
    			type : "post",
    			data : {query : bookname},
    			dataType : "json",
    			success : booklist,
    			error : function(){alert("error")}
 				   			
    		});
    		// 로딩중 표시
    		$(document).ajaxStart(function(){ $(".loading-progress").show(); });
            $(document).ajaxStop(function(){ $(".loading-progress").hide(); });
    	});
    	
    	// 지도 mapBtn 클릭 시 지도가 보이도록 하기
    	$("#mapBtn").click(function(){
    		var address = $("#address").val();
    		if(address == ""){
    			alert("주소를 입력하세요");
    			return false;
    		}
    		
    		$.ajax({
    			url : "https://dapi.kakao.com/v2/local/search/address.json", // flask - python : 5000
    			headers : {"Authorization" : "KakaoAK 3b9b7243ad17e0b42a183d9dbea50e02"},
    			type : "get",
    			data : {query:address},
    			dataType : "json",
    			success : mapView,
    			error : function(){alert("error");}
    			
    		});
    		
    	});

    	var result='${cnt}';    	
    	console.log(result);
    	if(result==''){
    		return;
    	}
    	if(parseInt(result)>0){
    		$(".modal-body").html("<font color='red'>성공적으로 삭제되었습니다.</font>");
    	}
    	$("#myModal").modal("show");    
    		
    });
    function goMsg(){
    	$(".modal-body").html("<font color='red'>삭제된 게시물입니다.</font>");
    	$("#myModal").modal("show");    
    }
    
    // ajax통신 성공 시
    function booklist(data){
    	var bList="<table class='table table-hover'>";
        bList+="<thead>";
        bList+="<tr>";
        bList+="<th>책이미지</th>";
        bList+="<th>책이름</th>";
        bList+="<th>책가격</th>";
        bList+="</tr>";
        bList+="</thead>";
        bList+="<tbody>";
        $.each(data.documents,function(index, obj){
           var image=obj.thumbnail;
           var price=obj.price;
           var url=obj.url;
           var title=obj.title;
           bList+="<tr>";
            bList+="<td><a href='"+url+"'><img src='"+image+"' width='50px' height='60px'/></a></td>";
            bList+="<td>"+title+"</td>";
            bList+="<td>"+price+"</td>";
            bList+="</tr>";
        }); 
        bList+="</tbody>";
        bList+="</table>";
        $("#bookList").html(bList);
    }
    
    // 카카오지도 가져오기 성공 시
    function mapView(data){
    	//alert(data); // 위도, 경도 ..
    	var x = data.documents[0].x;
    	var y = data.documents[0].y;
    	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = { 
            center: new kakao.maps.LatLng(y, x), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 표시할 div와  지도 옵션으로  지도를 생성
    var map = new kakao.maps.Map(mapContainer, mapOption); 
    
 	// 마커가 표시될 위치 
    var markerPosition  = new kakao.maps.LatLng(y, x); 

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    
 	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
    var iwContent = '<div style="padding:5px;">${mvo.memName}</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
          // 마커 위에 인포윈도우를 표시합니다
          infowindow.open(map, marker);  
    });
    }
  </script>
</head>
<body>

	<div class="card">

		<div class="card-header">
			<div class="jumbotron jumbotron-fluid">
				<div class="container">
					<h1>Spring Framework~~</h1>
					<p>Bootstrap is the most popular HTML, CSS...</p>
				</div>
			</div>
		</div>

		<div class="card-body">
			<div class="row">
				<div class="col-lg-2">
					<jsp:include page="left.jsp" />
				</div>
				<div class="col-lg-7">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">BOARD</h5>
							<p class="card-text">리스트보기</p>
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="vo" items="${list}">
										<tr>
											<td>${vo.num}</td>

											<!-- 들여쓰기 기능 할거야! -->
											<td><c:if test="${vo.boardLevel>0}">
													<c:forEach begin="1" end="${vo.boardLevel}">
														<span style="padding-left: 10px"></span>
													</c:forEach>
													<!-- 아이콘 -->
													<i class="bi bi-arrow-return-right"></i>
												</c:if> 
												<c:if test="${vo.boardLevel>0}">
												  <c:if test="${vo.boardDel==1}">
													<a class="move" href="${vo.num}">[RE]${vo.title}</a></td>
											      </c:if>
											
									 			<c:if test="${vo.boardDel==0}">
												  <a href="javascript:goMsg()">[RE]삭제된 게시물입니다.</a></td>
												</c:if>
											</c:if>

											<c:if test="${vo.boardLevel==0}">

												<c:if test="${vo.boardDel==1}">
													<a class="move" href="${vo.num}">${vo.title}</a>
													</td>
												</c:if>
												<c:if test="${vo.boardDel==0}">
													<a href="javascript:goMsg()">[RE]삭제된 게시물입니다.</a>
													</td>
												</c:if>

											</c:if>



											<td>${vo.writer}</td>
											<td><fmt:formatDate value="${vo.indate}"
													pattern="yyyy-MM-dd" /></td>
											<td>${vo.count}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<c:if test="${!empty mvo}">
								<!-- 로그인을 한 경우에만 글쓰기 버튼 나오게 -->
								<button class="btn btn-secondary btn-sm pull-right"
									onclick="location.href='${cpath}/register.do'">글쓰기</button>
							</c:if>
							<!-- 페이지 디자인 -->
							<ul class="pagination justify-content-center" style="margin: 20px 0">
								<c:if test="${pm.prev}">
									<li class="page-item">
									  <a class="page-link" href="${pm.startPage-1}">Previous</a>
									</li>
								</c:if>
								<c:forEach var="pageNum" begin="${pm.startPage}" end="${pm.endPage}">
									<li class="page-item ${pm.cri.page == pageNum ? 'active' : ''}"><a class="page-link" href="${pageNum}">${pageNum}</a></li>
								</c:forEach>
								<c:if test="${pm.next}">
									<li class="page-item">
									  <a class="page-link" href="${pm.endPage+1}">Next</a>
									</li>
								</c:if>
							</ul>
							<form id="pageFrm" action="${cpath}/list.do" method="post">
								<input type="hidden" id="page" name="page" value="${pm.cri.page}">
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<jsp:include page="right.jsp" />
				</div>
			</div>
		</div>
		<div class="card-footer">지능형 빅데이터 분석서비스 개발자과정(박매일)</div>
	</div>

	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Message</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">Modal body..</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>

</body>
</html>