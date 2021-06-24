<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:parseNumber var="pcnt" value="${pcnt}" />

<%-- 지도 부분(kakao) --%>
<div id="map" class="row m-3" style="height:500px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5de2f58e2eedf30ed86a815506ae35e&libraries=clusterer"></script>

<%-- 검색박스 부분(서치박스, search box) --%>
<div class="row m-3 input-group rounded" id="schbox" name="schbox">
    <div class="row form-group">
        <select id="findtype" name="findtype">
            <option>--상세조건--</option>
            <option value="addr">주소</option>
            <option value="bushour">운영시간</option>
        </select>
    </div>

    <div class="col d-flex justify-content-center form-outline" id="findbox" name="findbox">
        <input type="search" class="form-control" placeholder="상세조건을 선택후 검색하여 주십시오." id="findkey" name="findkey" value="${param.findkey}" style="width: 600px" readonly>
        <button type="button" class="btn btn-primary" id="findbtn"><i class="fas fa-search"></i></button>
    </div>
</div>

<%-- 검색박스 부분: 대안(alternative) --%>
<form>
    <%-- 주소 --%>
    <div class="form-group">
        <input class="form-check-input" type="checkbox" value="" id="chkaddr">
        <label class="form-check-label" for="chkaddr">주소</label>
        <input type="text" class="form-control" id="addr" readonly>
    </div>

    <%-- 운영시간 --%>
    <div class="form-group">
        <input class="form-check-input" type="checkbox" value="" id="chkbushour">
        <label for="chkbushour">운영시간</label>
        <div class="d-flex justify-content-center">
            <select class="form-control col-1" id="shour" disabled>
                <option value='am'>오전</option>
                <option value='pm'>오후</option>
            </select>
            <select class="form-control" id="samhour" style="width: 100px" disabled>
                <option value='00:00'>00:00</option>
                <option value='01:00'>01:00</option>
                <option value='02:00'>02:00</option>
                <option value='03:00'>03:00</option>
                <option value='04:00'>04:00</option>
                <option value='05:00'>05:00</option>
                <option value='06:00'>06:00</option>
                <option value='07:00'>07:00</option>
                <option value='08:00'>08:00</option>
                <option value='09:00'>09:00</option>
                <option value='10:00'>10:00</option>
                <option value='11:00'>11:00</option>
            </select>
            <p>부터 &nbsp;&nbsp;</p>
            <select class="form-control col-1" id="ehour" disabled>
                <option value='am'>오전</option>
                <option value='pm'>오후</option>
            </select>
            <select class="form-control" id="eamhour" style="width: 100px" disabled>
                <option value='00:00'>00:00</option>
                <option value='01:00'>01:00</option>
                <option value='02:00'>02:00</option>
                <option value='03:00'>03:00</option>
                <option value='04:00'>04:00</option>
                <option value='05:00'>05:00</option>
                <option value='06:00'>06:00</option>
                <option value='07:00'>07:00</option>
                <option value='08:00'>08:00</option>
                <option value='09:00'>09:00</option>
                <option value='10:00'>10:00</option>
                <option value='11:00'>11:00</option>
            </select>
            <p>까지 &nbsp;&nbsp;</p>
        </div>
    </div>

    <%-- 운영요일 --%>
    <div class="form-group">
        <input class="form-check-input" type="checkbox" value="super" id="chkbusday">
        <label class="form-check-label" for="chkbusday">운영요일</label>

        <div class="row d-flex justify-content-center">
            <div class="col-1">
                <input class="form-check-input" type="checkbox" value="daythis" id="chkweekday" disabled>
                <label class="form-check-label" for="chkweekday"><h5>평일</h5></label>
            </div>
            <div class="col-1">
                <input class="form-check-input" type="checkbox" value="daythis" id="chksaturday" disabled>
                <label class="form-check-label" for="chksaturday"><h5>토요일</h5></label>
            </div>
            <div class="col-1">
                <input class="form-check-input" type="checkbox" value="daythis" id="chkholiday" disabled>
                <label class="form-check-label" for="chkholiday"><h5>공휴일</h5></label>
            </div>
        </div>
    </div>

    <%-- 공영/민영 구분 --%>
    <div class="form-group">
        <input class="form-check-input" type="checkbox" value="" id="chkgubun">
        <label class="form-check-label" for="chkbusday">구분</label>

        <div class="row d-flex justify-content-center">
            <div class="col-1">
                <input class="form-check-input" type="checkbox" value="gubunthis" id="chkpublic" disabled>
                <label class="form-check-label" for="chkpublic"><h5>공영</h5></label>
            </div>
            <div class="col-1">
                <input class="form-check-input" type="checkbox" value="gubunthis" id="chkprivate" disabled>
                <label class="form-check-label" for="chkprivate"><h5>민영</h5></label>
            </div>
        </div>
    </div>
</form>

<%-- 검색결과 건수 표시 --%>
<div class="row justify-content-center mt-2"><p>총 <b>${pcnt}</b>건의 결과가 검색되었습니다.</p></div>

<%-- 아이템 리스트 부분(Item List) => Bootstrap의 scrollspy 사용 --%>
<div id="list" class="row border-right border-bottom">

    <%-- 간단한 아이템들, brief items --%>
    <div id="list-example" class="col-3 d-inline list-group" style="display: inline-block; overflow: auto; height: 720px;">
        <c:forEach var="p" items="${parks}">
            <a class="list-group-item list-group-item-action" href="#list-item-${p.name}">${p.name}</a>
        </c:forEach>
    </div>


    <%-- 자세한 아이템들, detail items --%>
    <div data-bs-spy="scroll" data-bs-target="#list-example" data-bs-offset="0" class="col-9 d-inline scrollspy-example" tabindex="0" style="overflow: auto; display: inline-block; width: 300px; height: 720px">
        <c:forEach var="p" items="${parks}">
            <div class="pt-1" id="list-item-${p.name}" style="height: 240px">
                <div class="row">
                    <div class="col"><h2>${p.name}</h2></div>
                    <div class="col text-right m-2"><span>주차구획수 : ${p.sections}</span></div>
                </div>

                <h5>${p.addr1} (${p.telephone})</h5>

                <div class="row">
                    <%-- (평일, 토요일, 공휴일 운영여부를 보고 표기하기!) --%>
                    <div class="col">
                        평일 : ${p.shour} ~ ${p.ehour} <br>
                        토요일 : ${p.satshour} ~ ${p.satehour} <br>
                        공휴일 : ${p.gongshour} ~ ${p.gongehour}
                    </div>

                    <div class="col d-flex justify-content-end pt-5">
                        <c:if test="${p.buze eq '요일제'}">
                            <button class="btn btn-sm btn-danger m-1" style="height: 30px">${p.buze}</button>
                        </c:if>
                        <button class="btn btn-sm btn-success m-1" style="height: 30px">지금가능!</button>
                    </div>
                </div><hr>
            </div> <%-- 아이템 반복 --%>
        </c:forEach>
    </div>
</div>