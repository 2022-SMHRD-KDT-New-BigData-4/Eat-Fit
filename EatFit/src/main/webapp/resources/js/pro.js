

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
//                          식자재보관함 삭제 함수 - 0425                                                      
/////////////////////////////////////////////////////////////////////////////////////////

  let text="";
  // const foodText =`${text}`;

  $('.span-close').click(function() {
    console.log("닫기클릭");
    text=$(this).closest('.position-relative').find('button').text()
    $(".food-text").text(text+"를(을) 보관함에서 삭제할까요?");
    console.log(text)
  });

  $('.del-btn-check').click(function() {
    console.log("모달삭제버튼클릭");
    console.log(text)
    // 이후에 디비 갔다와서 삭제하는 코드 작성 0425 미완
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
    $('.mc-display').css('display', 'block');
    
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
          url: 'http://172.30.1.84:5000/upload-image',
          data: formData,
          dataType: "json",
          contentType: false,
          processData: false,
          success: function(response) {
              console.log('이미지 업로드 성공');
              // 분석된 사진이미지
              console.log(response.analyze_image)
              // 원본사진 이미지
              console.log(response.origin_image)
              // 음식객체이름, json형태 
              console.log(response.cNames)
          },
          error: function(xhr, status, error) {
              console.error('이미지 업로드 실패: ' + error);
          }
      });
    });

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
