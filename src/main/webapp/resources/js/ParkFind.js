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

// 운영시간으로 검색받기
$("#findtype").on('change', function () {
    var findkey = $("#findbox").children()[0];
    var findbtn = $("#findbox").children()[1];

    if($("#findtype option:selected").val() == "bushour") {

        var shour = $(
            "<select>" +
                "<option value='am'>오전</option>" +
                "<option value='pm'>오후</option>" +
            "</select>");

        var samhour = $(
            "<select>" +
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
            "</select>"
        );

        var spmhour = $(
            "<select>" +
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
            "</select>"
        );

        var ehour = $(
            "<select>" +
                "<option value='am'>오전</option>" +
                "<option value='pm'>오후</option>" +
            "</select>");

        var eamhour = $(
            "<select>" +
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
            "</select>"
        );

        var epmhour = $(
            "<select>" +
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
            "</select>"
        );
        $("#findbox").children().remove();

        $("#findbox").append(shour);
        $("#findbox").append(samhour);
        $("#findbox").append($("<p>부터 </p>"));
        $("#findbox").append(ehour);
        $("#findbox").append(eamhour);
        $("#findbox").append($("<p>까지</p>"));

        $("#findbox").append(findbtn);

        shour.on('change', function() {
             if(shour.val() == "pm") samhour.replaceWith(spmhour);
             else spmhour.replaceWith(samhour);
        });

        ehour.on('change', function() {
            if(ehour.val() == "pm") eamhour.replaceWith(epmhour);
            else epmhour.replaceWith(eamhour);
        });
    }
    // 운영시간에서 다른 옵션으로 갈 때
    else {
        $("#findbox").children().remove();
    }
})