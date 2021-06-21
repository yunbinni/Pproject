<%@ page contentType="text/html;charset=UTF-8" %>

<%-- 지도 부분(kakao) --%>
<div id="map" class="row m-3" style="height:500px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5de2f58e2eedf30ed86a815506ae35e"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>

<%-- 검색박스 부분(서치박스, search box) --%>
<div class="row m-3 input-group rounded" id="schbox" name="schbox">
    <div class="row form-group">
        <select>
            <option>--상세조건--</option>
            <option>주소</option>
        </select>
    </div>

    <div class="col d-flex justify-content-center form-outline">
        <input type="search" class="form-control w-75" placeholder="상세조건을 선택후 검색하십시오." id="prksch" name="prksch">
        <button type="button" class="btn btn-primary"><i class="fas fa-search"></i></button>
    </div>
</div>

<%-- 아이템 리스트 부분(Item List) => Bootstrap의 scrollspy 사용 --%>
<div id="list" class="row border-right border-bottom">

    <%-- 간단한 아이템들, brief items --%>
    <div id="list-example" class="col-3 d-inline list-group" style="display: inline-block">
        <a class="list-group-item list-group-item-action" href="#list-item-1">산뜻한 주차장</a>
        <a class="list-group-item list-group-item-action" href="#list-item-2">산뜻한 주차장</a>
        <a class="list-group-item list-group-item-action" href="#list-item-3">산뜻한 주차장</a>
    </div>

    <%-- 자세한 아이템들, detail items --%>
    <div data-bs-spy="scroll" data-bs-target="#list-example" data-bs-offset="0" class="col-9 d-inline scrollspy-example" tabindex="0" style="overflow: auto; display: inline-block; width: 300px; height: 500px">

        <div class="pt-1" id="list-item-1" style="height: 40%">
            <div class="row">
                <div class="col"><h2>산뜻한 주차장</h2></div>
                <div class="col text-right m-2"><span>주차구획수 : 3</span></div>
            </div>

            <h5>경기도 의정부시 백제금동대향로 (080-500-4949)</h5>

            <div class="row">
                <%-- (평일, 토요일, 공휴일 운영여부를 보고 표기하기!) --%>
                <div class="col">
                    평일 : 09:00 ~ 18:00 <br>
                    토요일 : 09:00 ~ 17:00 <br>
                    공휴일 : (운영안함)
                </div>

                <div class="col d-flex justify-content-end pt-5">
                    <button class="btn btn-sm btn-danger m-1" style="height: 30px">요일제</button>
                    <button class="btn btn-sm btn-success m-1" style="height: 30px">지금가능!</button>
                </div>
            </div><hr><br>
        </div> <%-- 아이템 반복 --%>

        <div class="pt-1" id="list-item-2" style="height: 40%">
            <div class="row">
                <div class="col"><h2>산뜻한 주차장</h2></div>
                <div class="col text-right m-2"><span>주차구획수 : 3</span></div>
            </div>

            <h5>경기도 의정부시 백제금동대향로 (080-500-4949)</h5>

            <div class="row">
                <%-- (평일, 토요일, 공휴일 운영여부를 보고 표기하기!) --%>
                <div class="col">
                    평일 : 09:00 ~ 18:00 <br>
                    토요일 : 09:00 ~ 17:00 <br>
                    공휴일 : (운영안함)
                </div>

                <div class="col d-flex justify-content-end pt-5">
                    <button class="btn btn-sm btn-danger m-1" style="height: 30px">요일제</button>
                    <button class="btn btn-sm btn-success m-1" style="height: 30px">지금가능!</button>
                </div>
            </div><hr><br>
        </div> <%-- 아이템 반복 --%>

        <div class="pt-1" id="list-item-3" style="height: 40%">
                <div class="row">
                    <div class="col"><h2>산뜻한 주차장</h2></div>
                    <div class="col text-right m-2"><span>주차구획수 : 3</span></div>
                </div>

                <h5>경기도 의정부시 백제금동대향로 (080-500-4949)</h5>

                <div class="row">
                    <%-- (평일, 토요일, 공휴일 운영여부를 보고 표기하기!) --%>
                    <div class="col">
                        평일 : 09:00 ~ 18:00 <br>
                        토요일 : 09:00 ~ 17:00 <br>
                        공휴일 : (운영안함)
                    </div>

                    <div class="col d-flex justify-content-end pt-5">
                        <button class="btn btn-sm btn-danger m-1" style="height: 30px">요일제</button>
                        <button class="btn btn-sm btn-success m-1" style="height: 30px">지금가능!</button>
                    </div>
                </div><hr><br>
            </div> <%-- 아이템 반복 --%>

    </div>
</div>