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

        // if(position.소재지도로명주소 != null && position.소재지도로명주소.toString().includes( $("#addr").val() )) {
        var marker =  new kakao.maps.Marker({
            position : new kakao.maps.LatLng(position.위도, position.경도),
            clickable : true
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
            removable : true
        });

        kakao.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map, marker);
        });

        return marker;
        // }
    });

    // 맵 중심좌표 설정
    // map.setCenter(markers[0].getPosition());

    // 클러스터러에 마커들을 추가합니다
    clusterer.addMarkers(markers);
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