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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${cpath}/resources/css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
            <jsp:include page="left.jsp"/>
         </div>
         <div class="col-lg-7">
              <div class="card">
              <div class="card-body">
                 <h5 class="card-title">BOARD</h5>
                 <p class="card-text">글쓰기</p>
					<form action="${cpath}/register.do" method="post">
					  <input type="hidden" name="memId" value="${mvo.memId}">
					  <div class="form-group">
					    <label for="title">제목:</label>
					    <input type="text" class="form-control" placeholder="Enter title" id="title" name="title">
					  </div>
					  <div class="form-group">
					    <label for="content">내용:</label>
					    <textarea class="form-control" rows="10" id="content" name="content"></textarea>
					  </div>					  
					  <div class="form-group">
					    <label for="writer">작성자:</label>
					    <input type="text" class="form-control" value="${mvo.memName}" readonly id="writer" name="writer">
					  </div>					  
					  <button type="submit" class="btn btn-secondary btn-sm">등록</button>
					  <button type="reset" class="btn btn-info btn-sm">취소</button>
					  <button type="button" class="btn btn-success btn-sm" onclick="location.href='${cpath}/list.do'">목록</button>
					</form>
              </div>
              </div>  
         </div>
          <div class="col-lg-3">
            <jsp:include page="right.jsp"/>
         </div>
      </div>
    </div> 
    
    <div class="card-footer">지능형 빅데이터 분석서비스 개발자과정(박매일)</div>
  </div>

</body>
</html>