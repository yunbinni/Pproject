// find park
// 상세조건 선택시 readonly 풀기
$("#findtype").on('change', function() {
    if($("#findtype").val() != "--상세조건--")
        $("#findkey").prop("readonly", false);
    else
        $("#findkey").prop("readonly", true);
})

// 검색어를 2자 이상 받고 /Park/find로 넘기기
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