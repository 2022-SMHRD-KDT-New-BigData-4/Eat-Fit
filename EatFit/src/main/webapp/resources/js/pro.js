

//////////////////////////////////////////////////////////////////////////////////////////
//              식자재보관함 각 재료 식별 함수 - 0425                                         
/////////////////////////////////////////////////////////////////////////////////////////

let food = [];
$(document).ready(function() {

  $('.foodbox').click(function() {
    console.log($(this).text());
    console.log(food);
    // food안에 값이 있다면 if 안으로 들어가지 않음
    if(food.indexOf($(this).text())==-1){
      $(this).closest('.position-relative').find('span').css('display', 'block');
      food.push($(this).text());
     $(this).css('background-color', '#1f8648');
     $(this).css('color', 'white');
      console.log(food);
    }
    else{
      $(this).css('background-color', 'white')
      $(this).css('color', 'black')
      $(this).closest('.position-relative').find('span').css('display', 'none');
      food = food.filter(item => item !== $(this).text());
      console.log(food);
    }
    //gpt버튼 생성
    if(food.length>0){
      $('#gpt-btn').css('display','block')
      $('.add-btn').css('display','none')
    }else if(food.length==0){
      $('#gpt-btn').css('display','none')
      $('.add-btn').css('display','block')
    }
  });

});


//////////////////////////////////////////////////////////////////////////////////////////
//              ChatGPT - 0501                                         
/////////////////////////////////////////////////////////////////////////////////////////


$('#gpt-btn').click(function() {
	let gpt_food = food.toString();
	let gpt_query = gpt_food + " 사용하는 음식레시피 추천해줘"

	$.ajax({
		url:"http://localhost:5002/gpt",
		method:"POST",
		data:{'query':gpt_query},
		success: function(response) {
			// GPT답변 보여주기
			$('#gptTextarea').val(response);
			document.getElementById("gptTextarea").style.display = "block";
        },
		// 통신전에 로딩화면 보여주기
        beforeSend: function () {
			var width = 0;
			var height = 0;
			var left = 0;
			var top = 0;
				width = 50;
				height = 50;
              	top = ( $(window).height() - height ) / 2 + $(window).scrollTop();
              	left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();
			if($("#div_ajax_load_image").length != 0) {
				$("#div_ajax_load_image").css({
					"top": top+"px",
					"left": left+"px"
                });
				$("#div_ajax_load_image").show();
			}else {
				$('body').append('<div id="div_ajax_load_image" style="position:absolute; top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999; background:#f0f0f0; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="resources/images/loading.gif" style="width:50px; height:50px;"></div>');
            }
       	},
		// 통신이 끝나면 로딩화면 숨김
       complete: function () {
			$("#div_ajax_load_image").hide();
       }
	})
});


//////////////////////////////////////////////////////////////////////////////////////////
//                          식자재보관함 식자재 추가 함수 - 0502                                                      
/////////////////////////////////////////////////////////////////////////////////////////
$('#addMSB-btn').click(function() {
	let add_food = $('#recipient-name').val();
	
	$.ajax({
		url:"addMSB.do",
		method:"POST",
		data:{'add_food':add_food},
		datatype:"number",
		success: function(resposne){
			location.reload();
			/*$('#exampleModal').modal('hide');  // 원래의 모달 창 닫기
			$('#successModal').modal('show');  // 성공 모달 창 보여주기
			$('#successModal').on('hidden.bs.modal', function() {
				location.reload();  // 확인 버튼을 누르면 새로고침하기	
			});*/
		},
		error: function(response){
			location.reload();
			/*$('#exampleModal').modal('hide');  // 원래의 모달 창 닫기
			$('#successModal').modal('show');  // 성공 모달 창 보여주기
			$('#successModal').on('hidden.bs.modal', function() {
				location.reload();  // 확인 버튼을 누르면 새로고침하기	
			});*/
		}
	})
})


//////////////////////////////////////////////////////////////////////////////////////////
//                          식자재보관함 삭제 함수 - 0425 -> 0503 김준혁 수정                                                   
/////////////////////////////////////////////////////////////////////////////////////////

  let text="";
  let seq=0;
  // const foodText =`${text}`;

  $('.span-close').click(function() {
    console.log("닫기클릭");
    text=$(this).closest('.position-relative').find('button').text()
	seq=$(this).closest('.position-relative').find('button').val()
    $(".food-text").text(text+"를(을) 보관함에서 삭제할까요?");
    console.log(text);
	console.log(seq);
  });

  $('.del-btn-check').click(function() {
    console.log("모달삭제버튼클릭");
    console.log(text)
	console.log(seq);
	
	// 이후에 디비 갔다와서 삭제하는 코드 작성 0425 미완 -> 0503 김준혁 수정
	$.ajax({
		url:"deleteMSB.do",
		method:"POST",
		data:{'delete_seq':seq},
		datatype:"number",
		success: function(resposne){
			console.log("통신성공")
			location.reload();
		},
		error: function(response){
			console.log("통신에라")
			location.reload();
		}
	})	
  });




//////////////////////////////////////////////////////////////////////////////////////////
//          회원가입란 체크박스 하나씩 선택가능하게하는 함수 - 0425        
/////////////////////////////////////////////////////////////////////////////////////////

 $('.activity-level').on('click', function() {
        console.log($(this).val()); // 클릭한 버튼의 value 값을 콘솔에 출력
        $('.activity-level').not(this).prop('checked', false);
      });

      // 체크박스가 클릭됐을 때 실행되는 함수
$('.bmd-check').on('click', function() {
    // 클릭된 체크박스의 상태를 저장
    var isChecked = $(this).prop('checked');
    console.log($(this).val()); // 클릭한 버튼의 value 값을 콘솔에 출력
    // 모든 체크박스의 상태를 초기화
    $('.bmd-check').prop('checked', false);
    
    // 클릭된 체크박스의 상태를 변경
    $(this).prop('checked', isChecked);
  });

  $('.gender-check').on('click', function() {
    // 클릭된 체크박스의 상태를 저장
    var isChecked = $(this).prop('checked');
    console.log($(this).val()); // 클릭한 버튼의 value 값을 콘솔에 출력
    // 모든 체크박스의 상태를 초기화
    $('.gender-check').prop('checked', false);
    
    // 클릭된 체크박스의 상태를 변경
    $(this).prop('checked', isChecked);
  });






//////////////////////////////////////////////////////////////////////////////////////////
//          임시 회원가입 value 확인 - 0425        
/////////////////////////////////////////////////////////////////////////////////////////

//   // join3.html에서 실행될 함수
// function displayInfo() {
//   // URL에서 GET parameter 값들을 추출
//   const params = new URLSearchParams(window.location.search);

//   // 추출한 값들을 변수에 저장
//   const male = params.get("male");
//   const female = params.get("female");
//   const age = params.get("age");
//   const height = params.get("height");
//   const weight = params.get("weight");

//   // 변수들의 값을 출력
//   console.log(`성별: ${male ? "남" : ""} ${female ? "여" : ""}`);
//   console.log(`나이: ${age}`);
//   console.log(`키: ${height}`);
//   console.log(`몸무게: ${weight}`);
// }

// // join3.html이 로드될 때 displayInfo 함수를 실행
// window.addEventListener("load", displayInfo);





//////////////////////////////////////////////////////////////////////////////////////////
//              회원가입 하단 이동함수 - 0425                
/////////////////////////////////////////////////////////////////////////////////////////

$(document).ready(function() {
  $('.join-a a').click(function() {
    $(this).css('background-color', '#1b703d');
    $(this).css('color', 'dddddd');
    $('.join-a a').not(this).css('background-color', '#1f8648');
    $('.join-a a').not(this).css('color', 'ffffff');
  });
});

$(document).ready(function() {
  $('#next-1').click(function() {
    $('#next-1-1').css('background-color', '#1b703d');
    $('#next-1-1').css('color', '#dddddd');
    $('#next-1-1').siblings().css('background-color', '#1f8648');
    $('#next-1-1').siblings().css('color', '#ffffff');
  });
});

$(document).ready(function() {
  $('#next-2').click(function() {
    $('#next-2-2').css('background-color', '#1b703d');
    $('#next-2-2').css('color', '#dddddd');
    $('#next-2-2').siblings().css('background-color', '#1f8648');
    $('#next-2-2').siblings().css('color', '#ffffff');
  });
});




//////////////////////////////////////////////////////////////////////////////////////////
//                      전체 하단 footer 관련 함수 - 0425               
/////////////////////////////////////////////////////////////////////////////////////////

$(document).ready(function() {
  $('.main-footer-a a').click(function() {
    $(this).css('background-color', '#1b703d');
    $(this).css('color', 'ffffff');
    $('.main-footer-a a').not(this).css('background-color', 'ffffff');
    $('main-footer-a a').not(this).css('color', '#1b703d');
  });
});

// 로그인메인화면 스크롤시 식단추천 버튼 숨기는 함수 0426
var scrollTimeout;
$(window).scroll(function() {
  clearTimeout(scrollTimeout);
  // $('#scroll-hidden').fadeOut();
  $("#scroll-hidden").css("display", "none");
  scrollTimeout = setTimeout(function() {
    // $('#scroll-hidden').fadeIn();
    $("#scroll-hidden").css("display", "block")
  }, 300);
});


