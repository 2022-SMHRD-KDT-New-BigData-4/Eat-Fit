
// $('.foodbox').click(function() {
//   console.log("클릭 실행");
//   $(this).css('background-color', '#1f8648');
//   $(this).css('color', 'white');
//   food.push($(this).text());

//   console.log($(this).text());
//   for(var i=0; i<food.length; i++){
//     console.log(food[i]);
//   }
// });
   
    // join3 버튼하나만 선택하기

    // const activityLevels = document.querySelectorAll('.activity-level');
    // activityLevels.forEach(level => {
    //     level.addEventListener('click', () => {
    //         activityLevels.forEach(otherLevel => {
    //             if (otherLevel !== level) {
    //                 otherLevel.checked = false;
    //             }
    //         });
    //     });
    // });


// $('.foodbox').click(function() {

//     console.log($(this).text());
//     console.log(food);
//     if(food.length>0){
//       $('#gpt-btn').css('display','block')
//     }else if(food.length==0){
//       $('#gpt-btn').css('display','none')
//     }
//    // food안에 값이 있다면 if 안으로 들어가지 않음
//     if(food.indexOf($(this).text())==-1){
//       $(this).closest('.position-relative').find('span').css('display', 'block');
//       food.push($(this).text());
//      $(this).css('background-color', '#1f8648');
//      $(this).css('color', 'white');
//       console.log(food);
//     }
//     else{
//       $(this).css('background-color', 'white')
//       $(this).css('color', 'black')
//       $(this).closest('.position-relative').find('span').css('display', 'none');
//       food = food.filter(item => item !== $(this).text());
//       console.log(food);
//   }
//  });








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

  let text=""
  const foodText =`${text}`;

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
//          임시 회원가입 value 확인 - 0425        
/////////////////////////////////////////////////////////////////////////////////////////

  // join3.html에서 실행될 함수
function displayInfo() {
  // URL에서 GET parameter 값들을 추출
  const params = new URLSearchParams(window.location.search);

  // 추출한 값들을 변수에 저장
  const male = params.get("male");
  const female = params.get("female");
  const age = params.get("age");
  const height = params.get("height");
  const weight = params.get("weight");

  // 변수들의 값을 출력
  console.log(`성별: ${male ? "남" : ""} ${female ? "여" : ""}`);
  console.log(`나이: ${age}`);
  console.log(`키: ${height}`);
  console.log(`몸무게: ${weight}`);
}

// join3.html이 로드될 때 displayInfo 함수를 실행
window.addEventListener("load", displayInfo);





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

