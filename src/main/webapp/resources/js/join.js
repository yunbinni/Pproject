// agree.jsp
// checked button (page move)
$('#okagree').on('click', function () {
    if( !$('#agree1').is(':checked') )
        alert('이용약관 동의가 필요합니다');
    else if( !$('#agree2').is(':checked') )
        alert('개인정보 수집 동의가 필요합니다');
    else
        location.href = '/join/checkme';
});

$('#noagree').on('click', function () {
    alert('이용약관에 모두 동의하지 않아 메인페이지로 이동합니다.');
    location.href = '/';
});

// ---------------------------------------------------<<<agree.jsp

let isCertification = false;

// email 인증 취소 btn
$('#chkcanc1btn').on('click', function () {
    alert('본인인증 취소로 메인페이지로 이동합니다.');
    location.href = '/';
});

// email send button
$('#emsendbtn').on('click', function () {
    sendEmail();
});

// email option:selected -> send email2
$('#email3').on('change', function () {
    let val = $('#email3 option:selected').text();
    if (val == '직접 입력') {
        $('#email2').attr('readonly', false);
        $('#email2').val('');
    }
    else {
        $('#email2').attr('readonly', true);
        $('#email2').val(val);
    }
});

// email send btn
function sendEmail() {
    let clientEmail = $('#email1').val() + '@' + $('#email2').val();
    let emailYN = isEmail(clientEmail);
    let keycode = "";
    // let isCertification = false;

    console.log('입력이메일 :' + clientEmail);

    if(emailYN == true) {
        // alert('이메일 형식입니다');

        $.ajax({
            type:"POST",
            url:"/join/email",
            data:{userEmail:clientEmail, key:keycode},
            dataType :'json',
            async: 'false',
            success : function (data) {
                console.log(data.key);
                keycode = data.key;
            },error : function (e){
                alert('오류가 발생하였습니다. 잠시 후에 다시 시도해주세요.');
            }
        });
        alert('인증코드가 전송되었습니다. 메일을 확인해주세요.');
        isCertification = true;
    }else {
        alert('이메일 형식이 잘못되었습니다. 다시 알맞게 입력해주세요.');
    }


    $('#emchkbtn').on('click', function () {
        let inputval = document.getElementById('emchkinput').value;
        document.getElementById('inputYN').innerText = inputval;

        console.log(inputval);
        console.log(keycode);

        if( inputval == keycode) {
            alert('인증 성공!');
            isCertification = true;
        } else {
            alert('코드번호 불일치');
            isCertification = false;
        }

        console.log(isCertification);

    });


}

$('#chkok1btn').on('click', function () {
    checkEmail();
});

function checkEmail() {
    if ( $('#name').val() == '' ) {
        alert('이름을 입력하세요!');
    } else if ( $('#email1').val() == '' || $('#email2').val() == '') {
        alert('이메일 주소를 입력하세요!');
    } else if (isCertification == false) {
        alert('메일 인증이 완료되지 않았습니다. 인증코드를 다시 확인해주세요.');
        return false;
    }else {
        const frm = $('#checkmefrm1');
        frm.attr('action', '/join/joinme');
        frm.attr('method', 'post');
        frm.submit();
    }
}


// email 정규식 check
function isEmail(asValue) {
    var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    return regExp.test(asValue);    // 형식에 맞는 경우 true 리턴
}


// jumin checked button (page move)
$('#chkok2btn').on('click', function () {
    jmValidate();
});

$('#chkcanc2btn').on('click', function () {
    alert('본인인증 취소로 메인페이지로 이동합니다.');
    location.href = '/';
});

// checkme_name 정규식 적용
$('#name').on('blur', function () {
    let chkName = $('#name').val();
    let nameYN = isName(chkName);

    if(chkName == '') {
    }
    else if(nameYN == false) {
        alert('2자이상 한글만 입력이 가능합니다. 내용을 확인하여 다시 입력해주세요.')
        $('#name').val('');
    }
});

$('#name2').on('blur', function () {
    let chkName = $('#name2').val();
    let nameYN = isName(chkName);

    if(chkName == '') {
    }
    else if(nameYN == false) {
        alert('2자이상 한글만 입력이 가능합니다. 내용을 확인하여 다시 입력해주세요.')
        $('#name2').val('');
    }
});


// jumin validation_checkme
function jmValidate() {
    var num1 = document.getElementById("jumin1");
    var num2 = document.getElementById("jumin2");

    var arrNum1 = new Array();  // 주민 앞 6 숫자 담을 배열
    var arrNum2 = new Array();  // 주민 뒷 7 숫자 담을 배열

    for (var i = 0; i < num1.value.length; i++) {
        arrNum1[i] = num1.value.charAt(i);
    } // 앞자리 배열에 순서대로 담음

    for (var i = 0; i < num2.value.length; i++) {
        arrNum2[i] = num2.value.charAt(i);
    } // 뒷자리 배열에 순서대로 담음

    var tempSum = 0;

    for (var i = 0; i < num1.value.length; i++) {
        tempSum += arrNum1[i] * (2 + i);
    }   // 주민번호 유효성검사 방법을 적용하여 앞 번호를 모두 계산하여 더함

    for (var i = 0; i < num2.value.length - 1; i++) {
        if (i >= 2) {
            tempSum += arrNum2[i] * i;
        } else {
            tempSum += arrNum2[i] * (8 + i);
        }
    }   // 같은 방식으로 앞 번호 계산값에 뒷번호 계산값을 모두 더함

    if ( $('#name2').val() == '' ) {
        alert('이름을 입력하세요!');
    } else if ( $('#jumin1').val() == '' || $('#jumin2').val() == '') {
        alert('주민번호를 입력하세요!');
    } else if ((11 - (tempSum % 11)) % 10 != arrNum2[6]) {
        alert('올바르지 않은 주민등록 번호입니다. 다시 입력해주시기 바랍니다.');
        num1.value = "";
        num2.value = "";
        num1.focus();
        return false;
    } else if (!$('#chkjumin').is(':checked')) {
        alert('주민번호 처리에 동의하세요!');
    } else {
        const frm = $('#checkmefrm2');
        frm.attr('action', '/join/joinme');
        frm.attr('method', 'post');
        frm.submit();
    }

}

// ---------------------------------------------------<<<checkme.jsp

// joinme.jsp
// checked button (page move)
$('#joincancbtn').on('click', function () {
    alert('개인정보 입력 취소로 메인페이지로 이동합니다.');
    location.href = '/';
});

// userid check
$('#userid').on('blur', function (){
    checkuserid();
});
$('#userid').on('focus', function (){
    $('#uidmsg').text(' 4~16자의 영문 소문자와 숫자, 특수기호(_)로 첫자는 영문만 사용가능합니다.');
    $('#uidmsg').attr('style', 'color:black !important');
});

// ajax check userid
function checkuserid() {
    let uid = $('#userid').val();
    if ( uid == '') {
        $('#uidmsg').text(' 4~16자의 영문 소문자와 숫자, 특수기호(_)로 첫자는 영문만 사용가능합니다.');
        $('#uidmsg').attr('style', 'color:black !important');
        return;
    }
    $.ajax({
        url: '/join/checkuid',
        type: 'GET',
        data: { 'uid': uid }
    })
        .done(function (data) {
            let msg = '이미 존재하는 아이디입니다. 다른 아이디를 입력해주세요.';
            $('#uidmsg').attr('style', 'color:red !important');

            let chkUserid = $('#userid').val();
            let useridYN = isUserid(chkUserid);

            if (data.trim() == '0') {
                if(useridYN == true) {
                    msg = '사용가능 아이디입니다.';
                    $('#uidmsg').attr('style', 'color:blue !important');
                }
                else if(useridYN == false) {
                    msg = '아이디로 사용 가능한 문자와 글자수에 알맞게 다시 입력해주세요.';
                    $('#uidmsg').attr('style', 'color:red !important');
                    $('#userid').val('');
                }
            }
            $('#uidmsg').text( msg );
        })

        .fail(function (xhr, status, error){
            alert(xhr.status + '/' + error);
        });
}


// passwd check
$('#passwd').on('blur', function (){
    checkpasswd();
});
$('#passwd').on('focus', function (){
    $('#pwdmsg').text(' 8자이상 영문 소문자와 숫자, 특수기호(!,@,^,*,_)만 사용하며 각 문자가 1자이상씩 포함되어야 합니다.');
    $('#pwdmsg').attr('style', 'color:black !important');
});

// reg check passwd
function checkpasswd() {
    let chkPasswd = $('#passwd').val();
    let passwdYN = isPasswd(chkPasswd);

    if ( chkPasswd == '') {
        $('#pwdmsg').text(' 8자이상 영문 소문자와 숫자, 특수기호(!,@,^,*,_)만 사용하며 각 문자가 1자이상씩 포함되어야 합니다.');
        $('#pwdmsg').attr('style', 'color:black !important');
        return;
    } else if(passwdYN == false) {
        $('#pwdmsg').text('비밀번호로 사용 가능한 문자와 글자수에 알맞게 다시 입력해주세요.');
        $('#pwdmsg').attr('style', 'color:red !important');
        $('#passwd').val('');
    } else {
        $('#pwdmsg').text('사용가능한 비밀번호입니다.');
        $('#pwdmsg').attr('style', 'color:blue !important');
    }
}

// check equal passwd
$('#repasswd').on('blur', function (){
    if ($('#repasswd').val() == '') {
        $('#repwdmsg').text(' 비밀번호를 한 번 더 입력해주세요.');
        $('#repwdmsg').attr('style', 'color:black !important');
    } else if( $('#passwd').val() != $('#repasswd').val()) {
        $('#repwdmsg').text(' 비밀번호가 일치하지 않습니다.');
        $('#repwdmsg').attr('style', 'color:red !important');
    } else {
        $('#repwdmsg').text(' 비밀번호가 일치합니다.');
        $('#repwdmsg').attr('style', 'color:blue !important');
    }
});


// jumin check
$('#jumin2').on('change', function (){
    checkjumin();
});

function checkjumin() {
    var num1 = document.getElementById("jumin1");
    var num2 = document.getElementById("jumin2");

    var arrNum1 = new Array();  // 주민 앞 6 숫자 담을 배열
    var arrNum2 = new Array();  // 주민 뒷 7 숫자 담을 배열

    for (var i = 0; i < num1.value.length; i++) {
        arrNum1[i] = num1.value.charAt(i);
    } // 앞자리 배열에 순서대로 담음

    for (var i = 0; i < num2.value.length; i++) {
        arrNum2[i] = num2.value.charAt(i);
    } // 뒷자리 배열에 순서대로 담음

    var tempSum = 0;

    for (var i = 0; i < num1.value.length; i++) {
        tempSum += arrNum1[i] * (2 + i);
    }   // 주민번호 유효성검사 방법을 적용하여 앞 번호를 모두 계산하여 더함

    for (var i = 0; i < num2.value.length - 1; i++) {
        if (i >= 2) {
            tempSum += arrNum2[i] * i;
        } else {
            tempSum += arrNum2[i] * (8 + i);
        }
    }   // 같은 방식으로 앞 번호 계산값에 뒷번호 계산값을 모두 더함

    if ( $('#jumin1').val() == '' || $('#jumin2').val() == '') {
        $('#jmmsg').text(' ');
    } else if ((11 - (tempSum % 11)) % 10 != arrNum2[6]) {
        $('#jmmsg').text('주민등록번호가 틀렸습니다. 다시 입력해주세요.');
        $('#jmmsg').attr('style', 'color:red !important');
        num1.value = "";
        num2.value = "";
        num1.focus();
        return false;
    } else {
        $('#jmmsg').text('주민등록번호가 확인되었습니다.');
        $('#jmmsg').attr('style', 'color:blue !important');
    }

}

// email check
$('#email2').on('change', function (){
    checkemail2();
});
$('#email3').on('change', function (){
    checkemail2();
});

// reg check email
function checkemail2() {
    let chkEmail;
    let val3 = $('#email3 option:selected').text();

    if ($('#email2').val() != '')
        chkEmail = $('#email1').val() + '@' + $('#email2').val();
    else if (val3 != '')
        chkEmail = $('#email1').val() + '@' + val3;

    let emailYN = isEmail(chkEmail);

    if ($('#email1').val() == '' || $('#email2').val() == '') {
        $('#emmsg').text(' ');
    } else if(emailYN == false) {
        $('#emmsg').text('이메일이 틀렸습니다. 다시 입력해주세요.');
        $('#emmsg').attr('style', 'color:red !important');
        $('#email1').val('');
        $('#email2').val('');
        $('#email1').focus();
    } else {
        $('#emmsg').text('이메일 확인되었습니다.');
        $('#emmsg').attr('style', 'color:blue !important');
    }
}

// reg phone1
$('#tel2').change('blur', function () {
    let chkTel = $('#tel2').val();
    let telYN = isTel3(chkTel);

    if(telYN == false) {
        alert('잘못입력하였습니다. 핸드폰 번호를 다시 입력해주세요.');
        $('#tel2').val('');
        $('#tel2').focus();
    }
});

$('#tel3').change('blur', function () {
    let chkTel = $('#tel3').val();
    let telYN = isTel3(chkTel);

    if(telYN == false) {
        alert('잘못입력하였습니다. 핸드폰 번호를 다시 입력해주세요.');
        $('#tel3').val('');
        $('#tel3').focus();
    }
});

// reg phone2 (home)
$('#htel2').change('blur', function () {
    let chkTel = $('#htel2').val();
    let telYN = isTel2(chkTel);

    if(telYN == false) {
        alert('잘못입력하였습니다. 핸드폰 번호를 다시 입력해주세요.');
        $('#htel2').val('');
        $('#htel2').focus();
    }
});
$('#htel3').change('blur', function () {
    let chkTel = $('#htel3').val();
    let telYN = isTel3(chkTel);

    if(telYN == false) {
        alert('잘못입력하였습니다. 핸드폰 번호를 다시 입력해주세요.');
        $('#htel3').val('');
        $('#htel3').focus();
    }
});


window.onload = function onjuminE() {

    if ($('#jumin1').val() == '' && $('#jumin2').val() == '') {
        $('#jumin1').attr('readonly', false);
        $('#jumin2').attr('readonly', false);
        $('#jumin1').val('');
        $('#jumin2').val('');
        if ($('#email1').val() != '' && $('#email2').val() != '') {
            $("select[id*='email3']").prop('disabled', true);
            // $('#emailbtn').hide();
        }
    } else if ($('#email1').val() == '' && $('#email2').val() == '') {
        $('#email1').attr('readonly', false);
        $('#email2').attr('readonly', false);
        $('#email1').val('');
        $('#email2').val('');
        // $('#emailbtn').show();
        if ($('#jumin1').val() != '' && $('#jumin2').val() != '') {
            $('#jumin1').attr('readonly', true);
            $('#jumin2').attr('readonly', true);
        }
    }

}



// joinme
$('#joinokbtn').on('click', function () {
    if ( $('#userid').val() == '' ) alert('아이디를 입력하세요.');
    else if ( $('#passwd').val() == '' ) alert('비밀번호를 입력하세요.');
    else if ( $('#passwd').val() != $('#repasswd').val() )
        alert('비밀번호가 서로 일치하지 않습니다!');
    else if ( $('#zip1').val() == '' || $('#zip1').val() == '' )
         alert(' 우편번호를 입력하세요.');
    else if ( $('#addr1').val() == '' || $('#addr2').val() == '' )
        alert('주소를 입력하세요.');
    else if ( $('#email1').val() == '' || $('#email2').val() == '' )
        alert('이메일을 입력하세요.');
    else if ( $('#tel1').val() == '' || $('#tel2').val() == '' || $('#tel3').val() == '' )
        alert('전화번호를 입력하세요.');
    else if ( $('#htel2').val() != '' || $('#htel3').val() != '' ) {
        let val = $('#htel1 option:selected').text();

        if (val == '-지역번호-') {
            alert('지역번호를 선택하세요.');
        }
    }
    else if ( grecaptcha.getResponse() == '' )
        alert('자동입력 방지를 확인하세요.');
    else {
        $('#jumin').val($('#jumin1').val() + '-' + $('#jumin2').val() );
        $('#zipcode').val($('#zip1').val() + '-' + $('#zip2').val() );
        $('#email').val($('#email1').val() + '@' + $('#email2').val() );
        $('#cellphone').val($('#tel1').val() + '-' + $('#tel2').val() + '-' + $('#tel3').val() );
        $('#hphone').val($('#htel1').val() + '-' + $('#htel2').val() + '-' + $('#htel3').val() );

        const frm = $('#joinmefrm');
        frm.attr('action', '/join/joinok');
        frm.attr('method', 'post');
        frm.submit();

    }
});



// show zipcode
$('#findzipbtn').on('click', function () {
    $.ajax({
        url: '/join/zipcode',
        type: 'GET',
        data: { dong: $('#dong').val() }
    })
        .done(function (data) {
            let opts = "";
            $.each(data, function () {
                let zip = '';
                $.each(this, function (k,v) {
                    if( v != null ) zip += v + ' ';
                });
                opts += '<option>' + zip + '</option>';
            });
            $('#addrlist').find('option').remove();
            $('#addrlist').append(opts);
        })
        .fail(function (xhr, status, error) {
            alert(xhr.status + '/' + error);
        });
});

// zipcode dong prevent enter key
$('input[type="text"]').keydown(function () {
    if(event.keyCode === 13) {
        event.preventDefault();
    }
})

// send zipcode
$('#sendzip').on('click', function () {
    let addr = $('#addrlist option:selected').val();
    if (addr == undefined ) {
        alert('주소를 선택하세요!!');
        return;
    }

    let addrs = addr.split(' ');

    $('#zip1').val(addrs[0].split('-')[0]);
    $('#zip2').val(addrs[0].split('-')[1]);

    $('#addr1').val( addrs[1] + ' ' + addrs[2] + ' ' + addrs[3] );

    let index = addrs.length - 1;

    $('#addr2').val(addrs[index]);
    if ( index == 4)
        $('#addr2').val( addrs[4] );
    else if (index == 5)
        $('#addr2').val( addrs[4] + ' ' + addrs[5] );
    else if (index == 6)
        $('#addr2').val( addrs[4] + ' ' + addrs[5] + ' ' + addrs[6] );
    else if (index == 7)
        $('#addr2').val( addrs[4] + ' ' + addrs[5] + ' ' + addrs[6] + ' ' + addrs[7] );

    // 검색창 닫음
    $('#zipmodal').modal('hide');

});

// check 정규식
function isName(asName) {
    var reg = /^[가-힣]+$/;
    return reg.test(asName);
}

function isUserid(asName) {
    var reg = /^[a-z]{1}[a-z0-9_]{3,15}$/;
    return reg.test(asName);
}

function isPasswd(asName) {
    var reg = /^(?=.*[a-z])(?=.*\d)(?=.*[!@^*_])[a-z\d!@^*_]{8,}$/;
    return reg.test(asName);
}

function isJumin(asName) {
    var reg = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;
    return reg.test(asName);
}

function isEmail(asName) {
    var reg = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/;
    return reg.test(asName);
}

function isTel2(asName) {
    var reg = /^[0-9]{3,4}$/;
    return reg.test(asName);
}

function isTel3(asName) {
    var reg = /^[0-9]{4}$/;
    return reg.test(asName);
}


// ---------------------------------------------------<<<joinme.jsp

// joinok.jsp
// checked button (page move)
$('#compljoin').on('click', function () {
    location.href = '/';
});

// coupon down
$('#newcoupon').on('click', function () {
    alert('쿠폰이 다운로드되었습니다.');
});
