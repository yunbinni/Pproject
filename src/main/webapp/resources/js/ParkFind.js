// 폼에서 체크여부에 따라 변경가능여부 바꾸기
// 주소
$("#chkaddr").on('change', function () {
    if($("#chkaddr").is(":checked") == true) $("#addr").prop("readonly", false);
    else $("#addr").prop("readonly", true);
})

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
$("#schbtn").on('click', function() {
    var chkaddr = $("#chkaddr");
    var chkbushour = $("#chkbushour");
    var chkgubun = $("#chkgubun");
    var chkbuze = $("#chkbuze");
//
    // 검색조건이 모순이지 않게 필터링
    if(
        chkaddr.is(":checked") == false  &&
        chkbushour.is(":checked") == false &&
        chkgubun.is(":checked") == false &&
        chkbuze.is(":checked") == false
    ) alert("최소 1개 이상의 조건을 선택하여 주시기 바랍니다.");


    else if (chkaddr.is(":checked") == true && $("#addr").val().length < 2)
        alert("주소창에 2글자 이상 작성하여 주시기 바랍니다.");

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

        var qry = "/Park/find";

        qry += "?addr=" + addr;
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

        location.href = qry;
    }
})