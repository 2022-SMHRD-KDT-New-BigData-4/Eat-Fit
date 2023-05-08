

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
				width = 100;
				height = 100;
              	top = ( $(window).height() - height ) / 2 + $(window).scrollTop();
              	left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();
			if($("#div_ajax_load_image").length != 0) {
				$("#div_ajax_load_image").css({
					"top": top+"px",
					"left": left+"px"
                });
				$("#div_ajax_load_image").show();
			}else {
				$('body').append('<div id="div_ajax_load_image" style="position:absolute; top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999; background:none; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="resources/images/loading4.gif" style="width:100px; height:100px;"></div>');
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


//////////////////////////////////////////////////////////////////////////////////////////
//                로그인메인화면 스크롤시 식단추천 버튼 숨기는 함수 0426             
/////////////////////////////////////////////////////////////////////////////////////////


var scrollTimeout;
$(window).scroll(function() {
  clearTimeout(scrollTimeout);
  // $('.scroll-hidden').fadeOut();
  $(".scroll-hidden").css("display", "none");
  scrollTimeout = setTimeout(function() {
    // $('.scroll-hidden').fadeIn();
    $(".scroll-hidden").css("display", "block")
  }, 300);
});



//////////////////////////////////////////////////////////////////////////////////////////
//                메인 사진 처리              
/////////////////////////////////////////////////////////////////////////////////////////

window.onload = function() {
  console.log("로드완료")
 }
function mainCameraImg(){
  console.log("클릭123")
  $('#photoFile').click();
}
    // 사진 선택 후
    $("#photoFile").on('change', function() {

    
      // 파일명만 추출
      if(window.FileReader){  // modern browser
        var filename1 = $(this)[0].files[0];
        filename1.stream();
        var filename = $(this)[0].files[0].name;
      } else {  // old IE
        var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
      }
      // var fileSize = document.getElementById("photoFile").files[0].size;
      // console.log( "파일사이즈 : " + $("#photoFile")[0].files[0].size );
      console.log( "풀네임 : " + $(this));
      console.log( "파일사이즈 : " + $(this)[0].files[0].size );
      console.log( "파일명 : " + filename );

      LoadImg($("#photoFile")[0]);
      
    let fileFlask=$(this)[0].files[0]
      // 플라스크 전송 ajax
      var formData = new FormData();
      formData.append('image', fileFlask);
      console.log(formData[0])
      $.ajax({
          type: 'POST',
          url: 'http://172.30.1.28:5000/upload-image',
          data: formData,
          dataType: "json",
          contentType: false,
          processData: false,
		  // 통신전에 로딩화면 보여주기
		  beforeSend: function() {
			  var width = 0;
			  var height = 0;
			  var left = 0;
			  var top = 0;
			  width = 100;
			  height = 100;
			  top = ($(window).height() - height) / 2 + $(window).scrollTop();
			  left = ($(window).width() - width) / 2 + $(window).scrollLeft();
			  if ($("#div_ajax_load_image").length != 0) {
				  $("#div_ajax_load_image").css({
					  "top": top + "px",
					  "left": left + "px"
				  });
				  $("#div_ajax_load_image").show();
			  } else {
				  $('body').append('<div id="div_ajax_load_image" style="position:absolute; top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999; background:none; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="resources/images/loading4.gif" style="width:100px; height:100px;"></div>');
			  }
		  },
			// 통신이 끝나면 로딩화면 숨김
			  complete: function () {
				$("#div_ajax_load_image").hide();
			  },
          success: function(response) {
			$('.mc-display').css('display', 'block');
              console.log('이미지 업로드 성공');
              // 분석된 사진이미지
              console.log(response.analyze_image)
              // 원본사진 이미지
              console.log(response.origin_image)
              // 음식객체이름, json형태 
              console.log(response.cNames)
              console.log(response.upload_time)

			  $.ajax({
	               type: 'POST',
	               url: 'getFoodData.do',
	               data: {
					    analyze_image: response.analyze_image,
					    origin_image: response.origin_image,
						upload_time: response.upload_time,
					    cNames: JSON.stringify(response.cNames)
					},
					dataType: "json",
	               success: function(response1) {
	               console.log('데이터 전송 성공');
	               },
	               error: function(xhr, status, error) {
	                   console.error('데이터 전송 실패: ' + error);
	               }
	           });

          },
          error: function(xhr, status, error) {
              console.error('이미지 업로드 실패: ' + error);
          },
		
      });
    });

/////////////////////////////////////////////////////////////////////////////////////////
//                중량, MLD 입력받아서 데이터 보내자             
/////////////////////////////////////////////////////////////////////////////////////////
// gram 값 배열에 저장
function final_submit(){
	
	// MLD 데이터 가져오기
	const MLDchecked = document.querySelector('input[type="checkbox"]:checked');
	const MLDValue = MLDchecked.value;
	console.log(MLDValue)
	
	// foreach문 속 입력된 food_name들 리스트에 저장하기
	let foodName_arr = [];
	let food_names = document.getElementsByName("food_name[]");
		
	for (let i = 0; i < food_names.length; i++) {
	    foodName_arr.push(food_names[i].value);
	  	console.log(foodName_arr[i]);
	}
	// foreach문 속 입력된 gram들 리스트에 저장하기
	let foodGram_arr = [];
	let food_grams = document.getElementsByName("gram[]");
	for (let i = 0; i < food_grams.length; i++) {
		
		// foreach문 속 입력되지 않으면 쓸 디폴트 gram들 리스트에 저장하기
		let food_Dgram_arr = [];
		let food_Dgrams = document.getElementsByName("food_weigth[]");
		
		if(food_grams[i].value === ''){
			foodGram_arr.push(food_Dgrams[i].value);
		}else{
			foodGram_arr.push(food_grams[i].value);
			
		}
	  	console.log(foodGram_arr[i]);
		
    }
    

	$.ajax({
	        type:'POST',
	        url: 'getFoodData2.do',
	        data: {
				 	MLDValue: MLDValue,
					foodGram_arr: foodGram_arr.join(','),
    				foodName_arr: foodName_arr.join(','),
	        	},
	        success: function(response) {
				console.log('데이터 전송 성공');
				location.reload();
	        	},
	        error: function(xhr, status, error) {
	            console.error('데이터 전송 실패: ' + error);
				location.reload();
	        	}
			});
}	

//************************************************* */
// 선택이미지 미리보기-- flask에서 분석완료된 사진을 넘겨받은후 집어넣기
function LoadImg(value) {
    if(value.files && value.files[0]) {

      var reader = new FileReader();

      reader.onload = function (e) {
        $('#photoImg').attr('src', e.target.result);
        $('#photoImg').show();
      }

      reader.readAsDataURL(value.files[0]);
    }
}

//////////////////////////////////////////////////////////////////////////////////////////
//                메인 텍스트 js - 0504              
/////////////////////////////////////////////////////////////////////////////////////////


// DISCLAIMER: This function does require jQuery. I've used it here because the project I'm building this for already uses jQuery, so I thought why not. It can be modified quite simply to be done in raw JavaScript.  Just thought I'd let you know.
// This is the funtion you need to copy
// Copy from line 9 to 34

function autoType(elementClass, typingSpeed){
  var thhis = $(elementClass);
  thhis.css({
    "position": "relative",
    "display": "inline-block"
  });
  thhis.prepend('<div class="cursor" style="right: initial; left:0;"></div>');
  thhis = thhis.find(".text-js");
  var text = thhis.text().trim().split('');
  var amntOfChars = text.length;
  var newString = "";
  thhis.text("|");
  setTimeout(function(){
    thhis.css("opacity",1);
    thhis.prev().removeAttr("style");
    thhis.text("");
    for(var i = 0; i < amntOfChars; i++){
      (function(i,char){
        setTimeout(function() {        
          newString += char;
          thhis.text(newString);
        },i*typingSpeed);
      })(i+1,text[i]);
    }
  },100);
}

$(document).ready(function(){
  // Now to start autoTyping just call the autoType function with the 
  // class of outer div
  // The second paramter is the speed between each letter is typed.   
  autoType(".type-js",100);
});


//////////////////////////////////////////////////////////////////////////////////////////
//                메인 음식별 탄단지+중량 - 0506              
/////////////////////////////////////////////////////////////////////////////////////////
// 모달을 열기 위한 이벤트 핸들러

function mainImg(MLD) {
	//console.log("클릭");
	$('#mainFoodModal').modal('show');

	if (MLD === "아침") {
		MLD = "M";
	} else if (MLD === "점심") {
		MLD = "L";
	} else if (MLD === "저녁") {
		MLD = "D";
	}

	// AJAX 요청을 통해 데이터 가져오기
	$.ajax({
		url: 'getFoodDetailData.do',
		method: 'POST',
		data: { 'MLD': MLD },
		success: function(response) {

			let tableRows = '';

			// 데이터를 기반으로 동적으로 테이블 행 생성
			for (let i = 0; i < response.length; i++) {
				var food = response[i];
				tableRows += '<tr style="font-size:16px;">'
				tableRows += '<td class="fw-bold">' + food.food_NAME + '</td>'
				tableRows += '<td class="text-warning">' + food.food_CRB + '</td>'
				tableRows += '<td class="text-primary">' + food.food_PROTEIN + '</td>'
				tableRows += '<td class="text-danger">' + food.food_FAT + '</td>'
				tableRows += '<td class="text-info">' + food.food_WEIGTH + '</td>'
				tableRows += '<td class="text-success">' + food.food_CALORIE + '</td>'
				tableRows += '</tr>'
			};
			$("tbody").empty();
			$("tbody").append(tableRows);
		},
		error: function() {
			// 에러 처리
			console.log('데이터를 가져오는 중에 오류가 발생했습니다.');
		}
	});
}

// 모달 닫기 버튼 클릭 시
let mainFoodModalClose = $("#food-modal-btn-close");
mainFoodModalClose.on("click", function() {
	console.log("메인음식모달닫기클릭");
	$('#mainFoodModal').modal('hide');
});


