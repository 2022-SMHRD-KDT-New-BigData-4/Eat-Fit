//////////////////////////////////////////////////////////////////////////////////////////
//                      캘린더 생성 JS - 0429           
/////////////////////////////////////////////////////////////////////////////////////////

$(document).ready(function() {
  calendarInit();
});
/*
  달력 렌더링 할 때 필요한 정보 목록 

  현재 월(초기값 : 현재 시간)
  금월 마지막일 날짜와 요일
  전월 마지막일 날짜와 요일
*/

function calendarInit() {

  // 날짜 정보 가져오기
  var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
  var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
  var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
  var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)

  var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
  // 달력에서 표기하는 날짜 객체

  
  var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
  var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
  var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

  // kst 기준 현재시간
  // console.log(thisMonth);

  // 캘린더 렌더링
  renderCalender(thisMonth);

  function renderCalender(thisMonth) {

      // 렌더링을 위한 데이터 정리
      currentYear = thisMonth.getFullYear();
      currentMonth = thisMonth.getMonth();
      currentDate = thisMonth.getDate();

      // 이전 달의 마지막 날 날짜와 요일 구하기
      var startDay = new Date(currentYear, currentMonth, 0);
      var prevDate = startDay.getDate();
      var prevDay = startDay.getDay();

      // 이번 달의 마지막날 날짜와 요일 구하기
      var endDay = new Date(currentYear, currentMonth + 1, 0);
      var nextDate = endDay.getDate();
      var nextDay = endDay.getDay();


      // 현재 월 표기
      let a=""
      if(currentMonth < 9){
        a="0"
      }else{
        a=""
      }
  
      $('.year-month').text(currentYear +"년"+" "+a + (currentMonth + 1)+"월");


      // 렌더링 html 요소 생성
      calendar = document.querySelector('.dates')
      calendar.innerHTML = '';
      
      // 지난달
      for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
          calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
      }
      // 이번달
      for (var i = 1; i <= nextDate; i++) {
          calendar.innerHTML = calendar.innerHTML + '<div class="day current" onclick="dayInfo(event)">' + i + '</div>'
      }
      // 다음달
      for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
          calendar.innerHTML = calendar.innerHTML + '<div class="day next disable" onclick="">' + i + '</div>'
      }

      // 오늘 날짜 표기
      if (today.getMonth() == currentMonth) {
          todayDate = today.getDate();
          var currentMonthDate = document.querySelectorAll('.dates .current');
          currentMonthDate[todayDate -1].classList.add('today');
      }
  }

  // 이전달로 이동
  $('.go-prev').on('click', function() {
      thisMonth = new Date(currentYear, currentMonth - 1, 1);
      renderCalender(thisMonth);
  });

  // 다음달로 이동
  $('.go-next').on('click', function() {
      thisMonth = new Date(currentYear, currentMonth + 1, 1);
      renderCalender(thisMonth); 
  });
}


//////////////////////////////////////////////////////////////////////////////////////////
//                      식단 기록일지 페이지 - 0428              
/////////////////////////////////////////////////////////////////////////////////////////

let currentDate = new Date();
let currentYear = currentDate.getFullYear(); // 년도(4자리)
let currentMonth = currentDate.getMonth() + 1; // 월(0부터 시작하므로 1을 더해줌)
let currentDay = currentDate.getDate(); // 일


if(currentMonth<10){
    currentMonth="0"+currentMonth
}
if(currentDay<10){
    currentDay="0"+currentDay
}
let defaultContent =currentYear+"-"+currentMonth+"-"+currentDay
//처음부터 보여주는 오늘날짜 정보
// 식단보관일지 페이지에 들어왔을때 2023-04-29 값을 넘겨줘서 디비에서 가져오게할 생각
// 값을 넘겨줄때 2023-04-29 형식으로 넘기려고 생각중
console.log(defaultContent)

    let date1 = new Date()
    let defaultWeekDays = ["일", "월", "화", "수", "목", "금", "토"];
    let defaultDayOfWeek = defaultWeekDays[date1.getDay()];
    $('.click-day').text(date1.getDate()+". "+defaultDayOfWeek);


    let ymd;
    let clickContent;
    let thisDay;
    let thisDayAddZero;
    let clickContentRemove;
   //clickContentRemove 에 찍힌 날짜정보 저장 yyyy-mm-dd형식

   // 날짜 클릭시 함수 실행 => 왜 처음엔 안찍히고 두번째부터 찍히는지, 여러번씩 찍히는지
   function dayInfo(event){
        // 찍힌날짜 텍스트 가져오기
        thisDay=$(event.target).text()
        // 10 이하라면 앞에 0추가 
        if(thisDay<10){
            thisDayAddZero= "0"+thisDay
            // 아니라면 텍스트 그대로
        }else{
            thisDayAddZero=thisDay;
        }
        // 찍힌 날짜 저장
        const clickedElement = $(event.target);
        // 만약 클릭된 요소의 클래스에 'current'가 포함되어 있다면
        if (clickedElement.hasClass("current")) {
          // 해당 요소에 클래스 추가
          $(event.target).addClass("current-change");
          // 안찍힌 나머지는 클래스 제거
          $(".current").not(clickedElement).removeClass("current-change");
        }
        // 년,월 텍스트 가져오기
        let yearMonth=$('.year-month').text();
        // 가져온 텍스트에서 월 -> ""으로 변경시켜서 전처리
        let yearMonthRemove= yearMonth.replace("월","");
        // ymd 변수에 전처리된 월 - 전처리된 일 
        ymd=yearMonthRemove+"-"+thisDayAddZero
        // ymd2 변수에 2023년 04-29 replace로 2023 -04-29 형식으로 변경
        ymd2 = ymd.replace("년", "-")
        // date객체에 넣어서 요일 가져오기(yyyy-mm-dd 형식이여야 넣을 수 있음)
        var date = new Date(ymd2);
        var weekdays = ["일", "월", "화", "수", "목", "금", "토"];
        var dayOfWeek = weekdays[date.getDay()];
        // 하단 일 . 요일 보여주기
        $('.click-day').text(thisDayAddZero+". "+dayOfWeek);
        clickContentRemove=ymd2.replace(" ","")
        console.log(clickContentRemove)
      }