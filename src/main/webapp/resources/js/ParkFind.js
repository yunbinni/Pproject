// find park
// 상세조건 선택시 readonly 풀기
$("#findtype").on('change', function() {
    if($("#findtype").val() != "--상세조건--") {
        $("#findkey").prop("readonly", false);
        $("#findkey").prop("placeholder", "");
    }
    else {
        $("#findkey").prop("readonly", true);
        $("#findkey").prop("placeholder", "상세조건을 선택후 검색하여 주십시오.");
    }
})

// 주소로 검색받기 -> 검색어를 2자 이상 받고 /Park/find로 넘기기
$("#findbtn").on('click', function() {
    if( $('#findkey').val().length < 2 ) {
        alert("검색어를 2자 이상 작성하여 주시기 바랍니다.");
        $("#findkey").focus();
    } else {
        location.href =
            '/Park/find' +
            '?findtype=' + $("#findtype").val() +
            '&findkey=' + $("#findkey").val();
    }
})

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// 폼에서 체크여부에 따라 변경가능여부 바꾸기
$("#chkaddr").on('change', function () {
    if($("#chkaddr").is(":checked") == true) $("#addr").prop("readonly", false);
    else $("#addr").prop("readonly", true);
})
$("#chkbushour").on('change', function() {
    if($("#chkbushour").is(":checked") == true) {
        $("#shour").prop("disabled", false);
        $("#shour").next().prop("disabled", false);
        $("#ehour").prop("disabled", false);
        $("#ehour").next().prop("disabled", false);
    } else {
        $("#shour").prop("disabled", true);
        $("#shour").next().prop("disabled", true);
        $("#ehour").prop("disabled", true);
        $("#ehour").next().prop("disabled", true);
    }
})
$("#chkbusday").on('change', function() {
    if($("#chkbusday").is(":checked") == true) $("input[value=daythis]").prop("disabled", false);
    else $("input[value=daythis]").prop("disabled", true);
})
$("#chkgubun").on('change', function() {
    if($("#chkgubun").is(":checked") == true) $("input[value=gubunthis").prop("disabled", false);
    else $("input[value=gubunthis]").prop("disabled", true)
})

// 운영시간에서 오전/오후 바뀌면 그에 따라 드롭다운 리스트 변경
$("#shour").on('change', function() {
    var samhour =
        "<select class='form-control' id='samhour' style='width: 100px'>" +
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

    var spmhour =
        "<select class='form-control' id='spmhour' style='width: 100px'>" +
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

    if($("#shour").val() == 'pm') $("#samhour").replaceWith(spmhour);
    else $("#spmhour").replaceWith(samhour);
})
$("#ehour").on('change', function() {
    var eamhour =
        "<select class='form-control' id='eamhour' style='width: 100px'>" +
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

    var epmhour =
        "<select class='form-control' id='epmhour' style='width: 100px'>" +
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

    if($("#ehour").val() == 'pm') $("#eamhour").replaceWith(epmhour);
    else $("#epmhour").replaceWith(eamhour);
})