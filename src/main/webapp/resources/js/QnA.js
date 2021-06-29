$('#newQnAbtn').on('click', function () {
    alert('로그인 후 이용가능합니다.');
});


// search board
$('#findbtn').on('click', function(){
    if ($('#findkey').val() == '') alert('검색할 내용을 작성하세요!');
    else {
        let qry = '?findtype=' + $('#findtype').val();
        qry += "&findkey=" + $('#findkey').val() + "&cp=1";
        let url = '/QNA/find' + qry;
        location.href = url;
    }
});

$('#newFAQbtn').on('click', function () {
    location.href = '/FAQ/FAQlist';


});

$('#newQnAPagebtn').on('click', function () {
    location.href = '/QNA/QnAlist';
});
