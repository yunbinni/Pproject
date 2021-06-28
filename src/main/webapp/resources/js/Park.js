// 지도
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.570176, 126.9810083), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨(숫자가 작을수록 확대)
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

///////////////////////////////////////////////////////////////////////////////////////////////
// 마커 클러스터러
var clusterer = new kakao.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
    minLevel: 4, // 클러스터 할 최소 지도 레벨
    minClusterSize: 4 // 클러스터링할 최소 개수
});

// 마커와 인포윈도 생성
// 데이터를 가져오기 위해 jQuery를 사용합니다
// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
$.get("/data/Park.json", function(data) {
    // 데이터에서 좌표 값을 가지고 마커를 표시합니다
    // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
    var markers = $(data.positions).map(function(i, position) {

        if(position.소재지도로명주소 != null && position.소재지도로명주소.toString().includes( $("#sido").val() + $("#addr").val() )) {
            var marker = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(position.위도, position.경도),
                clickable: true
            });

            // 인포윈도 생성
            var infowindow = new kakao.maps.InfoWindow({
                content:
                    '<div className="iwContent" style="border: 1px solid black; width: 254px; height: 112px">' +
                    '<div className="iwTitle" style="font-size: 22px; text-align: center; height: 65px; line-height: 65px; border-bottom: 1px solid black">' +
                    '<a href="https://map.kakao.com/link/search/' + position.주차장명.toString() + '" target="_blank">' + position.주차장명.toString() + '</a>' +
                    '</div>' +
                    '<div className="addfav" style="height: 48px; text-align: center; line-height: 48px"><a href="#">관심지역추가</a></div>' +
                    '</div>',
                removable: true
            });

            kakao.maps.event.addListener(marker, 'click', function () {
                infowindow.open(map, marker);
            });

            return marker;
        }

    });

    // 클러스터러에 마커들을 추가합니다
    clusterer.addMarkers(markers);

    // 지도의 중심좌표 재설정
    // map.setCenter(markers[0].getPosition());
});

///////////////////////////////////////////////////////////////////////////////////////////////
// 컨트롤러
// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

///////////////////////////////////////////////////////////////////////////////////////////////
// 폼에서 체크여부에 따라 변경가능여부 바꾸기
// 운영시간 체크박스
$("#chkbushour").on('change', function() {
    if( $("#chkbushour").is(":checked") == true ) {
        $("input[name=chkday]").prop("disabled", false);
    }
    else {
        $("input[name=chkday]").prop("disabled", true);
        $("input[name=chkday]").prop("checked", false);
        $("input[name=chkanytime]").prop("disabled", true);
        $("input[name=chkanytime]").prop("checked", false);
        $("select").prop("disabled", true);
    }
})
$("#chkweekday").on('change', function () {
    if ($("#chkweekday").is(":checked") == true) {
        $("#anytime1").prop("disabled", false);
        $("select[name=selectWeekday]").prop("disabled", false);
    }
    else {
        $("#anytime1").prop("disabled", true);
        $("select[name=selectWeekday]").prop("disabled", true);
    }
})
$("#anytime1").on('change', function() {
    if ( $("#anytime1").is(":checked") == true ) $("select[name=selectWeekday]").prop("disabled", true);
    else $("select[name=selectWeekday]").prop("disabled", false);
})
$("#chksaturday").on('click', function() {
    if ($("#chksaturday").is(":checked") == true) {
        $("#anytime2").prop("disabled", false);
        $("select[name=selectSaturday]").prop("disabled", false);
    }
    else {
        $("#anytime2").prop("disabled", true);
        $("select[name=selectSaturday]").prop("disabled", true);
    }
})
$("#anytime2").on('change', function() {
    if ( $("#anytime2").is(":checked") == true ) $("select[name=selectSaturday]").prop("disabled", true);
    else $("select[name=selectSaturday]").prop("disabled", false);
})
$("#chkholiday").on('click', function() {
    if ($("#chkholiday").is(":checked") == true) {
        $("#anytime3").prop("disabled", false);
        $("select[name=selectHoliday]").prop("disabled", false);
    }
    else {
        $("#anytime3").prop("disabled", true);
        $("select[name=selectHoliday]").prop("disabled", true);
    }
})
$("#anytime3").on('change', function() {
    if ( $("#anytime3").is(":checked") == true ) $("select[name=selectHoliday]").prop("disabled", true);
    else $("select[name=selectHoliday]").prop("disabled", false);
})

// 구분 체크박스
$("#chkgubun").on('change', function() {
    if($("#chkgubun").is(":checked") == true) {
        $("input[name=gubunthis]").prop("disabled", false);
        $("#chkpublic").prop("checked", true);
    }
    else {
        $("input[name=gubunthis]").prop("checked", false);
        $("input[name=gubunthis]").prop("disabled", true);
    }
})
// 부제(요일제) 체크박스
$("#chkbuze").on('change', function() {
    if($("#chkbuze").is(":checked")) {
        $("input[name=buzethis]").prop("disabled", false);
        $("#chkyes").prop("checked", true);
    }
    else {
        $("input[name=buzethis]").prop("checked", false);
        $("input[name=buzethis]").prop("disabled", true);
    }
})

// 정기권 체크박스
$("#chkpass").on('change', function() {
    if($("#chkpass").is(":checked")) {
        $("input[name=passthis]").prop("disabled", false);
        $("#chkonedaypass").prop("checked", true);
    }
    else {
        $("input[name=passthis]").prop("checked", false);
        $("input[name=passthis]").prop("disabled", true);
    }
})

// 결제방법 체크박스
$("#chkpayment").on('change', function() {
    if($("#chkpayment").is(":checked")) {
        $("input[name=paythis]").prop("disabled", false);
        $("#chkcash").prop("checked", true);
    }
    else {
        $("input[name=paythis]").prop("checked", false);
        $("input[name=paythis]").prop("disabled", true);
    }
})

// 운영시간에서 오전/오후 바뀌면 그에 따라 드롭다운 리스트 변경
$("#ampmWeekday1").on('change', function() {
    var amhour =
        "<select className='form-control' name='selectWeekday' style='width: 100px'>" +
        "<option value='00:00'>00:00</option>" +
        "<option value='01:00'>01:00</option>" +
        "<option value='02:00'>02:00</option>" +
        "<option value='03:00'>03:00</option>" +
        "<option value='04:00'>04:00</option>" +
        "<option value='05:00'>05:00</option>" +
        "<option value='06:00'>06:00</option>" +
        "<option value='07:00'>07:00</option>" +
        "<option value='08:00'>08:00</option>" +
        "<option value='09:00'>09:00</option>" +
        "<option value='10:00'>10:00</option>" +
        "<option value='11:00'>11:00</option>" +
        "</select>";

    var pmhour =
        "<select className='form-control' name='selectWeekday' style='width: 100px'>" +
        "<option value='12:00'>12:00</option>" +
        "<option value='13:00'>13:00</option>" +
        "<option value='14:00'>14:00</option>" +
        "<option value='15:00'>15:00</option>" +
        "<option value='16:00'>16:00</option>" +
        "<option value='17:00'>17:00</option>" +
        "<option value='18:00'>18:00</option>" +
        "<option value='19:00'>19:00</option>" +
        "<option value='20:00'>20:00</option>" +
        "<option value='21:00'>21:00</option>" +
        "<option value='22:00'>22:00</option>" +
        "<option value='23:00'>23:00</option>" +
        "</select>";

    if($("#ampmWeekday1").val() == 'pm') $("#ampmWeekday1").next().replaceWith(pmhour);
    else $("#ampmWeekday1").next().replaceWith(amhour);
})
$("#ampmWeekday2").on('change', function() {
    var amhour =
        "<select className='form-control' name='selectWeekday' style='width: 100px'>" +
        "<option value='00:00'>00:00</option>" +
        "<option value='01:00'>01:00</option>" +
        "<option value='02:00'>02:00</option>" +
        "<option value='03:00'>03:00</option>" +
        "<option value='04:00'>04:00</option>" +
        "<option value='05:00'>05:00</option>" +
        "<option value='06:00'>06:00</option>" +
        "<option value='07:00'>07:00</option>" +
        "<option value='08:00'>08:00</option>" +
        "<option value='09:00'>09:00</option>" +
        "<option value='10:00'>10:00</option>" +
        "<option value='11:00'>11:00</option>" +
        "</select>";

    var pmhour =
        "<select className='form-control' name='selectWeekday' style='width: 100px'>" +
        "<option value='12:00'>12:00</option>" +
        "<option value='13:00'>13:00</option>" +
        "<option value='14:00'>14:00</option>" +
        "<option value='15:00'>15:00</option>" +
        "<option value='16:00'>16:00</option>" +
        "<option value='17:00'>17:00</option>" +
        "<option value='18:00'>18:00</option>" +
        "<option value='19:00'>19:00</option>" +
        "<option value='20:00'>20:00</option>" +
        "<option value='21:00'>21:00</option>" +
        "<option value='22:00'>22:00</option>" +
        "<option value='23:00'>23:00</option>" +
        "</select>";

    if($("#ampmWeekday2").val() == 'pm') $("#ampmWeekday2").next().replaceWith(pmhour);
    else $("#ampmWeekday2").next().replaceWith(amhour);
})
$("#ampmSaturday1").on('change', function() {
    var amhour =
        "<select className='form-control' name='selectSaturday' style='width: 100px'>" +
        "<option value='00:00'>00:00</option>" +
        "<option value='01:00'>01:00</option>" +
        "<option value='02:00'>02:00</option>" +
        "<option value='03:00'>03:00</option>" +
        "<option value='04:00'>04:00</option>" +
        "<option value='05:00'>05:00</option>" +
        "<option value='06:00'>06:00</option>" +
        "<option value='07:00'>07:00</option>" +
        "<option value='08:00'>08:00</option>" +
        "<option value='09:00'>09:00</option>" +
        "<option value='10:00'>10:00</option>" +
        "<option value='11:00'>11:00</option>" +
        "</select>";

    var pmhour =
        "<select className='form-control' name='selectSaturday' style='width: 100px'>" +
        "<option value='12:00'>12:00</option>" +
        "<option value='13:00'>13:00</option>" +
        "<option value='14:00'>14:00</option>" +
        "<option value='15:00'>15:00</option>" +
        "<option value='16:00'>16:00</option>" +
        "<option value='17:00'>17:00</option>" +
        "<option value='18:00'>18:00</option>" +
        "<option value='19:00'>19:00</option>" +
        "<option value='20:00'>20:00</option>" +
        "<option value='21:00'>21:00</option>" +
        "<option value='22:00'>22:00</option>" +
        "<option value='23:00'>23:00</option>" +
        "</select>";

    if($("#ampmSaturday1").val() == 'pm') $("#ampmSaturday1").next().replaceWith(pmhour);
    else $("#ampmSaturday1").next().replaceWith(amhour);
})
$("#ampmSaturday2").on('change', function() {
    var amhour =
        "<select className='form-control' name='selectSaturday' style='width: 100px'>" +
        "<option value='00:00'>00:00</option>" +
        "<option value='01:00'>01:00</option>" +
        "<option value='02:00'>02:00</option>" +
        "<option value='03:00'>03:00</option>" +
        "<option value='04:00'>04:00</option>" +
        "<option value='05:00'>05:00</option>" +
        "<option value='06:00'>06:00</option>" +
        "<option value='07:00'>07:00</option>" +
        "<option value='08:00'>08:00</option>" +
        "<option value='09:00'>09:00</option>" +
        "<option value='10:00'>10:00</option>" +
        "<option value='11:00'>11:00</option>" +
        "</select>";

    var pmhour =
        "<select className='form-control' name='selectSaturday' style='width: 100px'>" +
        "<option value='12:00'>12:00</option>" +
        "<option value='13:00'>13:00</option>" +
        "<option value='14:00'>14:00</option>" +
        "<option value='15:00'>15:00</option>" +
        "<option value='16:00'>16:00</option>" +
        "<option value='17:00'>17:00</option>" +
        "<option value='18:00'>18:00</option>" +
        "<option value='19:00'>19:00</option>" +
        "<option value='20:00'>20:00</option>" +
        "<option value='21:00'>21:00</option>" +
        "<option value='22:00'>22:00</option>" +
        "<option value='23:00'>23:00</option>" +
        "</select>";

    if($("#ampmSaturday2").val() == 'pm') $("#ampmSaturday2").next().replaceWith(pmhour);
    else $("#ampmSaturday2").next().replaceWith(amhour);
})
$("#ampmHoliday1").on('change', function() {
    var amhour =
        "<select className='form-control' name='selectHoliday' style='width: 100px'>" +
        "<option value='00:00'>00:00</option>" +
        "<option value='01:00'>01:00</option>" +
        "<option value='02:00'>02:00</option>" +
        "<option value='03:00'>03:00</option>" +
        "<option value='04:00'>04:00</option>" +
        "<option value='05:00'>05:00</option>" +
        "<option value='06:00'>06:00</option>" +
        "<option value='07:00'>07:00</option>" +
        "<option value='08:00'>08:00</option>" +
        "<option value='09:00'>09:00</option>" +
        "<option value='10:00'>10:00</option>" +
        "<option value='11:00'>11:00</option>" +
        "</select>";

    var pmhour =
        "<select className='form-control' name='selectHoliday' style='width: 100px'>" +
        "<option value='12:00'>12:00</option>" +
        "<option value='13:00'>13:00</option>" +
        "<option value='14:00'>14:00</option>" +
        "<option value='15:00'>15:00</option>" +
        "<option value='16:00'>16:00</option>" +
        "<option value='17:00'>17:00</option>" +
        "<option value='18:00'>18:00</option>" +
        "<option value='19:00'>19:00</option>" +
        "<option value='20:00'>20:00</option>" +
        "<option value='21:00'>21:00</option>" +
        "<option value='22:00'>22:00</option>" +
        "<option value='23:00'>23:00</option>" +
        "</select>";

    if($("#ampmHoliday1").val() == 'pm') $("#ampmHoliday1").next().replaceWith(pmhour);
    else $("#ampmHoliday1").next().replaceWith(amhour);
})
$("#ampmHoliday2").on('change', function() {
    var amhour =
        "<select className='form-control' name='selectHoliday' style='width: 100px'>" +
        "<option value='00:00'>00:00</option>" +
        "<option value='01:00'>01:00</option>" +
        "<option value='02:00'>02:00</option>" +
        "<option value='03:00'>03:00</option>" +
        "<option value='04:00'>04:00</option>" +
        "<option value='05:00'>05:00</option>" +
        "<option value='06:00'>06:00</option>" +
        "<option value='07:00'>07:00</option>" +
        "<option value='08:00'>08:00</option>" +
        "<option value='09:00'>09:00</option>" +
        "<option value='10:00'>10:00</option>" +
        "<option value='11:00'>11:00</option>" +
        "</select>";

    var pmhour =
        "<select className='form-control' name='selectHoliday' style='width: 100px'>" +
        "<option value='12:00'>12:00</option>" +
        "<option value='13:00'>13:00</option>" +
        "<option value='14:00'>14:00</option>" +
        "<option value='15:00'>15:00</option>" +
        "<option value='16:00'>16:00</option>" +
        "<option value='17:00'>17:00</option>" +
        "<option value='18:00'>18:00</option>" +
        "<option value='19:00'>19:00</option>" +
        "<option value='20:00'>20:00</option>" +
        "<option value='21:00'>21:00</option>" +
        "<option value='22:00'>22:00</option>" +
        "<option value='23:00'>23:00</option>" +
        "</select>";

    if($("#ampmHoliday2").val() == 'pm') $("#ampmHoliday2").next().replaceWith(pmhour);
    else $("#ampmHoliday2").next().replaceWith(amhour);
})

// 구분에서 공영, 민영 모두 체크못하도록 방지
$("#chkpublic").on('change', function() {
    if($("#chkprivate").is(":checked")) {
        $("#chkprivate").prop("checked", false);
        $("#chkpublic").prop("checked", true);
    }
})
$("#chkprivate").on('change', function() {
    if($("#chkpublic").is(":checked")) {
        $("#chkpublic").prop("checked", false);
        $("#chkprivate").prop("checked", true);
    }
})

// 부제(요일제)에서 시행, 미시행 모두 체크못하도록 방지
$("#chkyes").on('change', function() {
    if($("#chkno").is(":checked")) {
        $("#chkno").prop("checked", false);
        $("#chkyes").prop("checked", true);
    }
})
$("#chkno").on('change', function() {
    if($("#chkyes").is(":checked")) {
        $("#chkyes").prop("checked", false);
        $("#chkno").prop("checked", true);
    }
})

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 다른 파일로 값을 보낼 땐 함수화
$("#schbtn").on('click', function() {

    var chkbushour = $("#chkbushour");
    var chkgubun = $("#chkgubun");
    var chkbuze = $("#chkbuze");
    var chkpass = $("#chkpass");

    // 검색조건이 모순이지 않게 필터링
    if(
        $("#sido").val() == 'no' &&
        (chkbushour.is(":checked") == false &&
            chkgubun.is(":checked") == false &&
            chkbuze.is(":checked") == false &&
            chkpass.is(":checked") == false)
    ) alert("최소 1개 이상의 조건을 선택하여 주시기 바랍니다.");

    else if ($("#chkweekday").is(":checked") == true && $("#anytime1").is(":checked") == false &&
        parseInt($("#ampmWeekday1").next().val().substr(0, 2)) >= parseInt($("#ampmWeekday2").next().val().substr(0, 2)))
        alert("시작시간이 종료시간보다 크거나 같을 수 없습니다 : (평일)");

    else if ($("#chksaturday").is(":checked") == true && $("#anytime2").is(":checked") == false &&
        parseInt($("#ampmSaturday1").next().val().substr(0, 2)) >= parseInt($("#ampmSaturday2").next().val().substr(0, 2)))
        alert("시작시간이 종료시간보다 크거나 같을 수 없습니다 : (토요일)");

    else if ($("#chkholiday").is(":checked") == true && $("#anytime3").is(":checked") == false &&
        parseInt($("#ampmHoliday1").next().val().substr(0, 2)) >= parseInt($("#ampmHoliday2").next().val().substr(0, 2)))
        alert("시작시간이 종료시간보다 크거나 같을 수 없습니다 : (공휴일)");


    else {
        var addr = $("#addr").val();

        var shour = ''; var ehour = ''; var satshour = ''; var satehour = ''; var holshour = ''; var holehour = '';
        if($("#chkweekday").is(":checked") == true && $("#anytime1").is(":checked") == false) {
            shour = $("#ampmWeekday1").next().val();
            ehour = $("#ampmWeekday2").next().val();
        }
        if($("#chksaturday").is(":checked") == true && $("#anytime2").is(":checked") == false) {
            satshour = $("#ampmSaturday1").next().val();
            satehour = $("#ampmSaturday2").next().val();
        }
        if($("#chkholiday").is(":checked") == true && $("#anytime3").is(":checked") == false) {
            holshour = $("#ampmHoliday1").next().val();
            holehour = $("#ampmHoliday2").next().val();
        }

        var weekday = ''; if($("#chkweekday").is(":checked")) weekday = "yes";
        var saturday = ''; if($("#chksaturday").is(":checked")) saturday = "yes";
        var holiday = ''; if($("#chkholiday").is(":checked")) holiday = "yes";

        var gubun = ''; if($("#chkgubun").is(":checked")) gubun = $("#chkpublic").is(":checked") ? "공영" : "민영";
        var buze = ''; if($("#chkbuze").is(":checked")) buze = $("#chkyes").is(":checked") ? "요일제" : "미시행";

        var onedaypass = ''; if($("#chkonedaypass").is(":checked")) onedaypass = "yes";
        var monthpass = ''; if($("#chkmonthpass").is(":checked")) monthpass = "yes";

        var cash = ''; if($("#chkcash").is(":checked")) cash = "yes";
        var card = ''; if($("#chkcard").is(":checked")) card = "yes";
        var others = ''; if($("#chkothers").is(":checked")) others = "yes";

        var qry = "/Park/find";

        qry += "?addr=" + $("#sido").val() + ' ' + addr;
        qry += "&shour=" + shour;
        qry += "&ehour=" + ehour;
        qry += "&satshour=" + satshour;
        qry += "&satehour=" + satehour;
        qry += "&holshour=" + holshour;
        qry += "&holehour=" + holehour;
        qry += "&weekday=" + weekday;
        qry += "&saturday=" + saturday;
        qry += "&holiday=" + holiday;
        qry += "&gubun=" + gubun;
        qry += "&buze=" + buze;
        qry += "&onedaypass=" + onedaypass;
        qry += "&monthpass=" + monthpass;
        qry += "&cash=" + cash;
        qry += "&card=" + card;
        qry += "&others" + others;

        location.replace(qry);
    }
})