// list.jsp
// write btn
$('#newrvbtn').on('click', function (){
   location.href="/review/write";
});

// findloc, findtype tag setting
$('#findloc').val('${param.findloc}')
    .prop('selected', true);
$('#findtype').val('${param.findtype}')
    .prop('selected', true);

//loc filter
$('#findloc').on('change', function() {
   const filtering = $(this).val();

   if(filtering === "0") return (".result").show();

   $(".result").hide().filter(function() {
      return filtering === $(this).find(".locf").text()
   }).show();
});

// search filter btn
$('#findbtn').on('click', function() {
   if ($('#findkey').val()=='') alert('검색할 내용을 작성하세요')
   else {
      let qry = '?findloc=' + $('#findloc').val();
      qry += '&findtype=' + $('#findtype').val();
      qry += "&findkey=" + $('#findkey').val() + "&cp=1";
      let url = '/review/find' + qry;
      location.href=url;
   }
});


//view.jsp
//go2list btn
$('#go2list').on('click', function (){
   location.href="/review/list";
});

//prev/next btn
$('#prevbtn').on('click', function(){
   location.href='/review/prev?rvno=' + $('#rvno').val();
   //console.log$('#rvno').val
});

$('#nextbtn').on('click', function(){
   location.href='/review/next?rvno=' + $('#rvno').val();
});

// editbtn, rmvbtn
$('#editbtn').on('click', function() {
   location.href='/review/update?rvno=' + $('#rvno').val();
   // console.log($('#rvno').val());
});

$('#rmvbtn').on('click', function (){
   var confrm = confirm("게시글을 삭제하시겠습니까?");
   if(confrm) {
      alert('게시글이 삭제되었습니다');
      location.href = "/review/rmvrv?rvno=" + $('#rvno').val();
   } else {
      alert('게시글이 삭제되지 않았습니다');
      location.href = "/review/view?rvno=" + $('#rvno').val();
   }

});

//likes & nlikes btn
$('#likes').on('click', function() {
   location.href='/review/likes?rvno=' + $('#rvno').val();
});

$('#nlikes').on('click', function () {
   location.href='/review/nlikes?rvno=' + $('#rvno').val();
});



// write.jsp
// list btn
$('#go2rvlist').on('click', function (){
   location.href="/review/list";
});

// post btn
$('#savervbtn').on('click', function() {
   if ($('#loc').val() == '') alert ('지역을 설정해주세요');
   else if ($('#title').val() == '') alert ('제목을 입력해주세요');
   else if ($('#contents').val() == '') alert ('내용을 입력해주세요');
   else if (grecaptcha.getResponse() == '') alert ('자동입력방지를 체크하세요');
   else {
      const frm = $('#rvform');
      frm.attr('method', 'post');
      frm.attr('action', '/review/write');
      frm.attr('enctype', 'multipart/form-data');
      frm.submit();
   }
});

//update.jsp
// show attached file name
$('#file1').on('change', function() {
   var fname = $(this).val();
   fname = fname.substring(fname.lastIndexOf("\\") + 1);
   $(this).next('.custom-file-label').html(fname);
});

$('#file2').on('change', function() {
   var fname = $(this).val();
   fname = fname.substring(fname.lastIndexOf("\\") + 1);
   $(this).next('.custom-file-label').html(fname);
});

$('#file3').on('change', function() {
   var fname = $(this).val();
   fname = fname.substring(fname.lastIndexOf("\\") + 1);
   $(this).next('.custom-file-label').html(fname);
});

//enabling file attachment
$('#die1').on('change', function() {
   if($('#die1').is(':checked')) {
      $('#file1').attr('disabled', false);
      $('#todie').val("1" + $('#todie').val());
      // 첨부파일 수정목록에 1추가
   } else if (!$('#die1').is(':checked')) {
      $('#file1').attr('disabled', true);
      $('#todie').val($('#todie').val().replace(/1/g, ''));
      // 첨부파일 수정목록에서 1제거
   }
});

$('#die2').on('change', function() {
   if ($('#die2').is(':checked')) { // 체크박스가 체크되면
      $('#file2').attr('disabled', false); // disabled를 해제
      $('#todie').val($('#todie').val() + "2"); // 첨부파일 수정목록에 1추가
   } else if (!$('#die2').is(':checked')) {
      $('#file2').attr('disabled', true);
      $('#todie').val($('#todie').val().replace(/2/g, ''));
   }
});

$('#die3').on('change', function() {
   if ($('#die3').is(':checked')) { // 체크박스가 체크되면
      $('#file3').attr('disabled', false); // disabled를 해제
      $('#todie').val($('#todie').val() + "3");
   } else if (!$('#die3').is(':checked')) {
      $('#file3').attr('disabled', true);
      $('#todie').val($('#todie').val().replace(/3/g, ''));
   }
});


// updated btn
$('#updaterv').on('click', function() {
   if (grecaptcha.getResponse() == '') alert('자동입력방지를 체크하세요');
   else {
      const frm = $('#updatervfrm');
      frm.attr('method', 'post');
      frm.attr('enctype', 'multipart/form-data');
      frm.attr('action', '/review/update');
      frm.submit();
   }

});

//tooltips
$(function () {
   $('[data-toggle="tooltip"]').tooltip({trigger:"hover"});
});

