// loginbtn
$('#loginbtn').on('click', function () {
    if($('#userid').val() == '') alert('아이디를 입력하세요!');
    else if($('#passwd').val() == '') alert('비밀번호를 입력하세요!');
    else {
        const frm = $('#loginfrm');
        frm.attr('method', 'post');
        frm.attr('action', '/join/login');
        frm.submit();
    }

});


// close login modal lgmbtn
$('#lgmbtn').on('click', function () {
    $('#loginmodal').modal('hide');
});


// logoutbtn
$('#logoutbtn').on('click', function () {
    location.href = '/join/logout';
});