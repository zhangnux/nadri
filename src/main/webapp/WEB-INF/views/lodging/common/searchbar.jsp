<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../../common/tags.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/smoothness/jquery-ui.css">
<style>
.testLogo {
    height: 20px !important;
    width: 20px !important;
    padding: 0px !important; 
}

body {
  margin: 0;
}

* {
  box-sizing: border-box;
}

.s002 {
  display: -ms-flexbox;
  display: flex;
  -ms-flex-pack: center;
      justify-content: center;
  -ms-flex-align: center;
      align-items: center;
  font-family: 'Poppins', sans-serif;
  background-size: cover;
  background-position: center center;
  padding: 0px;
}

.s002 form {
  width: 100%;
  max-width: 1296px;
}

.s002 form legend {
  font-size: 60px;
  line-height: 1;
  color: #fff;
  margin-bottom: 60px;
  font-weight: 400;
  text-align: center;
}

.s002 form .inner-form {
  background: #007aff;
  padding: 16px;
  display: -ms-flexbox;
  display: flex;
  width: 100%;
  -ms-flex-pack: justify;
      justify-content: space-between;
  -ms-flex-align: center;
      align-items: center;
}

.s002 form .inner-form .input-field {
  position: relative;
  border-right: 1px solid #ddd;
}

.s002 form .inner-form .input-field .icon-wrap {
  position: absolute;
  top: 0;
  left: 0;
  width: 40px;
  height: 100%;
  display: -ms-flexbox;
  display: flex;
  -ms-flex-pack: end;
      justify-content: flex-end;
  -ms-flex-align: center;
      align-items: center;
  z-index: 1;
}

.s002 form .inner-form .input-field .icon-wrap svg {
  fill: #555;
  width: 14px;
  height: 14px;
}

.s002 form .inner-form .input-field input {
  height: 70px;
  background: #fff;
  border-radius: 0;
  border: 0;
  display: block;
  width: 100%;
  padding: 10px 20px 10px 45px;
  font-size: 13px;
  color: #555;
  font-weight: 400;
  font-family: 'Poppins', sans-serif;
}

.s002 form .inner-form .input-field input.placeholder {
  color: #9a9a9a;
  font-size: 16px;
  font-weight: 400;
  text-transform: uppercase;
}

.s002 form .inner-form .input-field input:-moz-placeholder {
  color: #9a9a9a;
  font-size: 16px;
  font-weight: 400;
  text-transform: uppercase;
}

.s002 form .inner-form .input-field input::-webkit-input-placeholder {
  color: #9a9a9a;
  font-size: 16px;
  font-weight: 400;
  text-transform: uppercase;
}

.s002 form .inner-form .input-field input:hover, .s002 form .inner-form .input-field input:focus {
  box-shadow: none;
  outline: 0;
}

.s002 form .inner-form .input-field.first-wrap {
  -ms-flex-positive: 1;
      flex-grow: 1;
}

.s002 form .inner-form .input-field.second-wrap {
  min-width: 190px;
  max-width: 190px;
}

.s002 form .inner-form .input-field.third-wrap {
  min-width: 190px;
  max-width: 190px;
}

.s002 form .inner-form .input-field.fouth-wrap {
  min-width: 252px;
  max-width: 252px;
  border-right: 0;
}

.s002 form .inner-form .input-field.fouth-wrap .choices__inner {
  background: #fff;
  border-radius: 0;
  border: 0;
  height: 70px;
  color: #666;
  display: -ms-flexbox;
  display: flex;
  -ms-flex-align: center;
      align-items: center;
  padding: 10px 32px 10px 45px;
  border-radius: 0;
}

.s002 form .inner-form .input-field.fouth-wrap .choices__inner .choices__list.choices__list--single {
  display: -ms-flexbox;
  display: flex;
  padding: 0;
  -ms-flex-align: center;
      align-items: center;
  height: 100%;
  font-size: 16px;
}

.s002 form .inner-form .input-field.fouth-wrap .choices__inner .choices__item.choices__item--selectable.choices__placeholder {
  display: -ms-flexbox;
  display: flex;
  -ms-flex-align: center;
      align-items: center;
  height: 100%;
  opacity: 1;
  color: #9a9a9a;
  text-transform: uppercase;
}

.s002 form .inner-form .input-field.fouth-wrap .choices__inner .choices__list--single .choices__item {
  display: -ms-flexbox;
  display: flex;
  -ms-flex-align: center;
      align-items: center;
  height: 100%;
  color: #666;
}

.s002 form .inner-form .input-field.fouth-wrap .choices[data-type*="select-one"]:after {
  right: 30px;
  border-color: #e5e5e5 transparent transparent transparent;
}

.s002 form .inner-form .input-field.fouth-wrap .choices__list.choices__list--dropdown {
  border: 0;
  background: #fff;
  padding: 10px 15px;
  border-radius: 0;
  box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
}

.s002 form .inner-form .input-field.fouth-wrap .choices__list.choices__list--dropdown .choices__item--selectable {
  padding-right: 0;
}

.s002 form .inner-form .input-field.fouth-wrap .choices__list--dropdown .choices__item--selectable.is-highlighted {
  background: #fff;
  color: #b78a62;
}

.s002 form .inner-form .input-field.fouth-wrap .choices__list--dropdown .choices__item {
  color: #555;
  min-height: 24px;
  font-size: 16px;
}

.s002 form .inner-form .input-field.fifth-wrap {
  min-width: 190px;
  max-width: 190px;
  padding-left: 10px;
  border-right: 0;
}

.s002 form .inner-form .input-field.fifth-wrap .btn-search {
  height: 70px;
  width: 100%;
  white-space: nowrap;
  border-radius: .5px;
  font-size: 20px;
  transition: all .2s ease-out, color .2s ease-out;
  border: 0;
  cursor: pointer;
  font-weight: 400;
  font-family: 'Poppins', sans-serif;
  background-color: #e7f4fd;
}

.s002 form .inner-form .input-field.fifth-wrap .btn-search:hover {
   background-color: #cbe7fd;
   box-shadow: 0 1px 3px 0 rgb(43 150 237 / 20%);
   color: #2b96ed;
}

@media screen and (max-width: 992px) {
  .s002 form legend {
    font-size: 50px;
    text-align: center;
    margin-bottom: 50px;
  }
  .s002 form .inner-form {
    -ms-flex-wrap: wrap;
        flex-wrap: wrap;
    -ms-flex-pack: justify;
        justify-content: space-between;
  }
  .s002 form .inner-form .input-field {
    margin-bottom: 15px;
  }
  .s002 form .inner-form .input-field.first-wrap {
    width: 100%;
  }
  .s002 form .inner-form .input-field.second-wrap {
    width: calc(50% - 7.5px);
    max-width: none;
  }
  .s002 form .inner-form .input-field.third-wrap {
    width: calc(50% - 7.5px);
    max-width: none;
  }
  .s002 form .inner-form .input-field.fouth-wrap {
    width: calc(50% - 7.5px);
    max-width: none;
    margin-bottom: 0;
  }
  .s002 form .inner-form .input-field.fifth-wrap {
    width: calc(50% - 7.5px);
    max-width: none;
    padding-left: 0;
    margin-bottom: 0;
  }
}

@media screen and (max-width: 767px) {
  .s002 form legend {
    font-size: 40px;
    margin-bottom: 40px;
  }
  .s002 form .inner-form .input-field.second-wrap, .s002 form .inner-form .input-field.third-wrap, .s002 form .inner-form .input-field.fouth-wrap, .s002 form .inner-form .input-field.fifth-wrap {
    width: 100%;
    margin-bottom: 15px;
  }
  .s002 form .inner-form .input-field.fifth-wrap {
    margin-bottom: 0;
  }
}

/* ==========================================================================
   dropdown
   ========================================================================== */
.quantity {
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  float: right;
}

@media (max-width: 575px) {
  .quantity {
    float: none;
    margin-top: 10px;
  }
}

.quantity > input {
  -webkit-appearance: none;
  width: 93px !important;
  height: 30px !important;
  text-align: center;
  font-size: 18px;
  color: #555;
  font-weight: 700;
}



.dropdown-select {
  display: none;
  position: absolute;
  left: 0;
  right: 0;
  top: -webkit-calc(100% + 2px);
  top: -moz-calc(100% + 2px);
  top: calc(100% + 2px);
  background: #fff;
  z-index: 999;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  border-radius: 10px;
  -webkit-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  padding: 0px;
}

.dropdown-select.show {
  display: block;
}

.minus,
.plus {
  display: inline-block;
  width: 32px;
  height: 32px;
  line-height: 28px;
  text-align: center;
  border: 2px solid #ccc;
  font-size: 24px;
  color: #ccc;
  -webkit-border-radius: 50%;
  -moz-border-radius: 50%;
  border-radius: 50%;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  -webkit-transition: all 0.4s ease;
  -o-transition: all 0.4s ease;
  -moz-transition: all 0.4s ease;
  transition: all 0.4s ease;
}

.minus:hover,
.plus:hover {
  background: #ccc;
  color: #fff;
}

.list-room {
  list-style: none;
  max-height: 324px;
  overflow-y: auto;
  padding-right: 20px;
}

.list-room__item {
  margin-bottom: 20px;
}

.list-room__footer {
  padding-top: 22px;
  border-top: 1px solid #e5e5e5;
}

.list-room__name {
  display: block;
  font-weight: 700;
  color: #999;
  padding-top: 3%;
}

.list-person {
  list-style: none;
}

.list-person .list-person__item:last-child {
  margin-bottom: 0;
}

.list-person__item {
  margin-bottom: 34px;
}

.list-person__item::after {
  content: "";
  clear: both;
  display: table;
}

.list-person__item .name {
  font-size: 18px;
  color: #555;
  font-weight: 700;
  display: inline-block;
  margin-top: 5px;
}

</style>

    <div class="s002">
      <form>
        <div class="inner-form">
          <div class="input-field first-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"></path>
              </svg>
            </div>
            <input id="search" type="text" placeholder="어디로 떠나세요?" class="ui-widget ui-widget-content"/>
          </div>
          
          <div class="input-field second-wrap">
            <input class="datepicker" id="fromDate" type="date" placeholder="29 Aug 2018" />
          </div>
          
          <div class="input-field third-wrap">
            <input class="datepicker" id="toDate" type="date" placeholder="30 Aug 2018" />
          </div>
          
          <div id="selectArea" class="input-field fouth-wrap">
            <div class="icon-wrap">
              <img class="css-xz2ryw--TravelerForm-style--icon" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_person_sm_filled_gray_700.svg" alt="icon">
            </div>
            <input id="peopleCnt" type="text" placeholder="" readonly="readonly" value="1 명"/>
			
			<div class="dropdown-select">
				<ul class="list-room">
					<li class="list-room__item"><span class="list-room__name">인원 선택</span>
						<ul class="list-person">
							<li class="list-person__item"><span class="name">성인</span>
								<div class="quantity quantity1">
									<span class="minus" onclick="f_CalcurateCnt(this);" data-type1="-" data-type2="a">-</span> 
										<input class="inputQty" id="aCnt" name="aCnt" type="number" min="1" value="1" readonly="readonly"> 
									<span class="plus" onclick="f_CalcurateCnt(this);" data-type1="+" data-type2="a">+</span>
								</div></li>
							<li class="list-person__item"><span class="name">어린이</span>
								<div class="quantity quantity2">
									<span class="minus" onclick="f_CalcurateCnt(this);" data-type1="-" data-type2="c">-</span> 
										<input class="inputQty" id="cCnt" name="cCnt" type="number" min="0" value="0" readonly="readonly"> 
									<span class="plus" onclick="f_CalcurateCnt(this);" data-type1="+" data-type2="c">+</span>
								</div></li>
						</ul></li>
				</ul>
			</div>
          </div>
          
          <div class="input-field fifth-wrap">
            <button class="btn-search" type="button">검색</button>
          </div>
        </div>
      </form>
    </div>
<script>
$(document).ready(function (){
	f_init();
	f_dropDown();
});

function f_init(){
	var city = ["제주도","가평","강릉","여수","경주","속초"];
	var icon =	[
        {
            label: "jQuery",
            logo: "http://jquery.com/favicon.ico",
        },
        {
            label: "jQuery UI",
            logo: "http://jqueryui.com/favicon.ico"
        },
        {
            label: "Backbone",
            logo: "http://backbonejs.org/docs/images/favicon.ico"
        },
        {
            label: "Lodash",
            logo: "http://lodash.com/favicon.ico"
        }
    ];
	
    $("#search").autocomplete({  //오토 컴플릿트 시작
        source : icon,    // source 는 자동 완성 대상
        select : function(event, ui) {    //아이템 선택시
//             console.log(ui.item);
        },
        focus : function(event, ui) {    //포커스 가면
            return false;//한글 에러 잡기용도로 사용됨
        },
        minLength: 1,// 최소 글자수
        autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
        classes: {    
            "ui-autocomplete": "highlight"
        },
        delay: 500,    //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
//        disabled: true, //자동완성 기능 끄기
        close : function(event){    //자동완성창 닫아질때 호출
//             console.log(event);
        }
    });
    
    $("#search").autocomplete("instance")._renderItem = function( ul, item ) {
    	var image = "";
    	
    	if(item["logo"]){
    		image =   "<img src='https://dffoxz5he03rp.cloudfront.net/icons/ic_location_sm_filled_blue_500.svg' class='testLogo' >";	
    	}
    	
    		
        return $( "<li>" ).attr( "data-value", item.value ).append( image + item.label ).appendTo( ul );	
    };
    
    var date = new Date();
    var fromDate,toDate;
    	fromDate = date.getFullYear() + "-" + ("0" + (1 + date.getMonth())).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
    	toDate = date.getFullYear() + "-" + ("0" + (1 + date.getMonth())).slice(-2) + "-" + ("0" + (date.getDate() + 1)).slice(-2);
    
    $("#fromDate").val(fromDate);
    $("#toDate").val(toDate);
    
    
}

function f_dropDown(){
	var $selectArea = $("#selectArea");
	var $dropDownSelect = $(".dropdown-select");
	var $body = $("body,html"); 
	
	$selectArea.on("click",function(ev){
		ev.stopPropagation();
		$(this).toggleClass("open");
		$dropDownSelect.toggleClass("show");
	});
	
	$dropDownSelect.on("click",function(ev){
		ev.stopPropagation();	
	});
	
	$body.on("click",function(ev){
		$selectArea.removeClass("open");
		$dropDownSelect.removeClass("show");
	});
}

function f_CalcurateCnt(el){
	var type1 = $(el).attr("data-type1");
	var type2 = $(el).attr("data-type2");
	var $peopleCnt = $("#peopleCnt");
	var $currectCnt =  $("#" + type2 + "Cnt"); 
	var currectVal = Number($peopleCnt.val().trim().replace("명","")); 
		
	if(type1 == "-" && currectVal == 1){
		return false;
	}
	
	if(type2 == "c" && type1 == "-" && $currectCnt.val() == 0){
		return false;
	}
	
	if(type1 == "+"){
		$peopleCnt.val(currectVal + 1 + " 명");
		$currectCnt.val(Number($currectCnt.val()) + 1);
	}else if(type1 == "-"){
		$peopleCnt.val(currectVal - 1 + " 명");
		$currectCnt.val(Number($currectCnt.val()) - 1);
	}
	
	
	
	
}

</script>
