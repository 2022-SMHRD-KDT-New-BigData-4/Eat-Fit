// //////////////////////////////////////////////////////////////////////////////////////////
// //                      로그인메인 게시물 수정모달(js로한번해봄) - 0429  이거도 따로 만들어서 옮기자       
// /////////////////////////////////////////////////////////////////////////////////////////
const modalMarkup1 = `
<div class="modal" tabindex="-1" id="modal123">
<div class="modal-dialog modal-dialog-centered">
  <div class="modal-content shadow" style="border: 3px solid green;">
    <div class="modal-body row">
    <div class="col-11 text-center fw-bold ps-5 pe-0" style="font-size:20px;">
    드신 시간과 중량을 수정하세요!
    </div>

    <div class="col-1 text-end p-0 pe-2 pb-3">
    <button type="button" class="btn-close" id="btn-close"></button>
    </div>
    <div class="col-12 fw-bold">
    <label for="current-time" class="col-form-label">먹은시간</label>
    <div class="input-group row">
    <div class="col-5 pe-0">
    <input type="number" class="form-control" placeholder="ex)20" name="hour" id="hour" autocomplete="off" max="24" min="0" oninput="validity.valid||(value='');">
    </div>
    <div class="col-1 text-start p-0 only-center">
    <span class="cm-kg p-0">시</span>
    </div>
    <div class="col-5 pe-0">
    <input type="number" class="form-control" placeholder="ex)50" name="min" id="min" autocomplete="off" max="59" min="1" oninput="validity.valid||(value='');">
    </div>
    <div class="col-1 text-start p-0 only-center">
    <span class="cm-kg p-0">분</span>
    </div>
  </div>
  </div>
  <div class="col-12 fw-bold mx-auto">
      <label for="change-gram" class="col-form-label">중량</label>
      <div class="input-group row">
    <div class="col-11 pe-0">
    <input type="number" class="form-control" placeholder="ex)500" name="gram" id="gram" autocomplete="off" max="5000" min="1" oninput="validity.valid||(value='');">
    </div>
    <div class="col-1 text-start p-0 only-center">
    <span class="cm-kg p-0">g</span>
    </div>
    </div>
    


      <div class="col-12 content-center mt-4">
      <button type="button" class="btn btn-warning fw-bold class123" style="width:70%; color:white;">수정하기</button>
      </div>
    </div>
  </div>
</div>
</div>
`;

// 에러나서 고쳐야함 0430 + 제이쿼리로 바꾼다면? 해결
// document.body.innerHTML += modalMarkup1;
// let modal1 = document.getElementById('modal123');
// let modalBtn1 = document.getElementById('modal-btn');
// let closeModal1 = document.getElementById('closeModal');
// let closeModal2 = document.getElementById('btn-close');

$("body").append(modalMarkup1);
let modal1 = $("#modal123");
let modalBtn1 = $("#modal-btn");
let closeModal1 = $("#closeModal");
let closeModal2 = $("#btn-close");
let class123 = $(".class123");


modalBtn1.on("click", function() {
console.log("수정클릭");
modal1.css("display", "block");
});
closeModal2.on("click", function() {
console.log("닫기클릭");
modal1.css("display", "none");
});

class123.on("click",function(){
console.log("수정완료클릭");
var hourVal = $('#gram').val();
var minVal = $('#min').val();
var gramVal = $('#hour').val();
if (hourVal === "" || minVal === "" || gramVal === "") {
alert("입력안함");
}
console.log(hourVal);
console.log(minVal);
console.log(gramVal);
// ajax로 보내면됨0430
})
// 원형프로그래스바 계산기 0430
// 맨처음 .percentage 클래스 텍스트에 총 칼로리를 'ㅇㅇㅇㅇKcal' 형식으로 넣어줘야 계산시작가능
// 받아온 칼로리값
let kcal1="1000"
//형 변환
let kcalValue=parseInt(kcal1);
console.log(kcalValue)
// 원형프로그래스바 총 칼로리 가져오기
let textElement = document.querySelector('.percentage');
let tc = textElement.textContent;
// 칼로리 전처리
let textValue= tc.replace("Kcal","")
console.log(textValue); 
//circle클래스 가져와서 칼로리 퍼센트값으로 변경해서 다시 집어넣기
let path = document.querySelector('.circle');
let aPercent = Math.round((kcalValue / textValue) * 100);
console.log(aPercent)
path.setAttribute('stroke-dasharray', `${aPercent}, ${textValue}`);

// 칼로리값을 어떻게 기억하고 계속더할지 고민

