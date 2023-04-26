<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<% pageContext.setAttribute("newLineChar", "\n"); %>
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
  <script type="text/javascript">
    $(document).ready(function(){
       // 버튼이 클릭되었을때 처리
       $("button").on("click", function(e){
    	    var btn=$(this).data("btn"); // data-btn
    	    var formData = $("#frm");
    	    if(btn=="list"){
    	    	//location.href="${cpath}/list.do";
    	    	formData.find("#num").remove();
    	    	formData.attr("action", "${cpath}/list.do");
    	    }else if(btn=="remove"){
    	    	//location.href="${cpath}/remove.do?num="+${vo.num};
    	    	formData.attr("action", "${cpath}/remove.do");
    	    }else if(btn=="modify"){
    	    	formData.attr("action", "${cpath}/modify.do");
    	    }else if(btn=="reply"){
    	    	formData.attr("action", "${cpath}/reply.do");
    	    }
    	    formData.submit();
       });
    	
    });
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
            <jsp:include page="left.jsp"/>
         </div>
          <div class="col-lg-7">
             <div class="card">
              <div class="card-body">
                 <h5 class="card-title">BOARD</h5>
                 <p class="card-text">(num=${vo.num})상세보기</p>
                  <table class="table table-bordered">
                    <tr>
                      <td style="width: 100px">제목</td>
                      <td>${vo.title}</td>                      
                    </tr>
                    <tr>
                      <td>내용</td>
                      <%-- <td><textarea class="form-control" rows="5" readonly="readonly">${vo.content}</textarea></td> --%>
                      <td>${fn:replace(vo.content, newLineChar, "<br/>")}</td>
                    </tr>
                    <tr>
                      <td>작성자</td>
                      <td>${vo.writer}</td>
                    </tr>
                    <tr>
                      <td>작성일</td>
                      <td><fmt:formatDate value="${vo.indate}" pattern="yyyy-MM-dd"/></td>
                    </tr>                    
                  </table>
                  <div class="btn-group btn-group-sm">
	                  <button data-btn="list" class="btn btn-primary">목록</button>
	                  <c:if test="${empty mvo}"> <!-- 로그인 안 한 경우에 버튼 안 눌리게 -->
		                  <button disabled="disabled" data-btn="reply" class="btn btn-primary">답글</button>
		                  <button disabled="disabled" data-btn="modify" class="btn btn-primary">수정</button>
		                  <button disabled="disabled" data-btn="remove" class="btn btn-warning">삭제</button>
	                  </c:if>
	                  <c:if test="${!empty mvo}"> <!-- 로그인 한 경우에만 수정, 답글, 삭제 눌리게 -->
		                  <button data-btn="reply" class="btn btn-primary">답글</button>
		                  <c:if test="${mvo.memId eq vo.memId}"> <!-- 자기 글일 경우에만 수정 삭제 가능하게 -->
			                  <button data-btn="modify" class="btn btn-primary">수정</button>
			                  <button data-btn="remove" class="btn btn-warning">삭제</button>
		                  </c:if>
		                   <c:if test="${mvo.memId ne vo.memId}"> <!-- 자기 글일 경우에만 수정 삭제 가능하게 -->
			                  <button disabled="disabled" data-btn="modify" class="btn btn-primary">수정</button>
			                  <button disabled="disabled" data-btn="remove" class="btn btn-warning">삭제</button>
		                  </c:if>
	                  </c:if>
                  </div>
                  
                  <!-- 버튼 클릭 시 num 넘길 수 있게 만든 form 태그 -->
                  <form id="frm" method="get">
                  	<input type="hidden" id="num" name="num" value="${vo.num}">
                  	<input type="hidden" id="page" name="page" value="${cri.page}">
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