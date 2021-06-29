// 카카오 지도 띄우는 코드
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
    center: new kakao.maps.LatLng(37.7578784, 127.0732659), //지도의 중심좌표.
    level: 4 //지도의 레벨(숫자가 커질수록 축소)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴