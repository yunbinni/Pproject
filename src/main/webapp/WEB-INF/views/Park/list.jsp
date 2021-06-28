<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:parseNumber var="pcnt" value="${pcnt}" />

<%-- 지도 부분(kakao) --%>
<div id="map" class="row m-3" style="height:500px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5de2f58e2eedf30ed86a815506ae35e&libraries=clusterer"></script>

<%-- 검색박스 부분 --%>
<div>
    <%-- 주소 --%>
    <div class="form-group">
        주소
        <div class="row">
            <select class="form-control col-3" id="sido">
                <option value="no">시/도 선택</option>
                <option>서울특별시</option>
                <option>부산광역시</option>
                <option>대구광역시</option>
                <option>인천광역시</option>
                <option>광주광역시</option>
                <option>대전광역시</option>
                <option>울산광역시</option>
                <option>세종특별자치시</option>
                <option>경기도</option>
                <option>강원도</option>
                <option>충청북도</option>
                <option>충청남도</option>
                <option>전라북도</option>
                <option>전라남도</option>
                <option>경상북도</option>
                <option>경상남도</option>
                <option>제주특별자치도</option>
            </select>
            <input type="text" class="form-control col-9" id="addr" placeholder="시/도 이후의 도로명주소 또는 지번주소를 입력하여 주십시오.">
        </div>
    </div><hr>

    <%-- 운영시간 --%>
    <div class="form-group">
        <input class="form-check-input" type="checkbox" value="" id="chkbushour">
        <label for="chkbushour">운영시간</label>

        <%-- 평일 --%>
        <div class="d-flex justify-content-center">
            <div class="col-1">
                <input class="form-check-input" type="checkbox" id="chkweekday" name="chkday" value="평일" disabled>
                <label class="form-check-label" for="chkweekday"><h5>평일</h5></label>
            </div>
            <div class="col-1">
                <input class="form-check-input" type="checkbox" id="anytime1" name="chkanytime" disabled>
                <label class="form-check-label" for="anytime1">시간무관</label>
            </div>
            <select class="form-control col-1" id="ampmWeekday1" name="selectWeekday" disabled>
                <option value='am'>오전</option>
                <option value='pm'>오후</option>
            </select>
            <select class="form-control" name="selectWeekday" style="width: 100px" disabled>
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
            <select class="form-control col-1" id="ampmWeekday2" name="selectWeekday" disabled>
                <option value='am'>오전</option>
                <option value='pm'>오후</option>
            </select>
            <select class="form-control" name="selectWeekday" style="width: 100px" disabled>
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

        <%-- 토요일 --%>
        <div class="d-flex justify-content-center">
            <div class="col-1">
                <input class="form-check-input" type="checkbox" id="chksaturday" name="chkday" value="토요일" disabled>
                <label class="form-check-label" for="chksaturday"><h5>토요일</h5></label>
            </div>
            <div class="col-1">
                <input class="form-check-input" type="checkbox" id="anytime2" name="chkanytime" disabled>
                <label class="form-check-label" for="anytime2">시간무관</label>
            </div>
            <select class="form-control col-1" id="ampmSaturday1" name="selectSaturday" disabled>
                <option value='am'>오전</option>
                <option value='pm'>오후</option>
            </select>
            <select class="form-control" name="selectSaturday" style="width: 100px" disabled>
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
            <select class="form-control col-1" id="ampmSaturday2" name="selectSaturday" disabled>
                <option value='am'>오전</option>
                <option value='pm'>오후</option>
            </select>
            <select class="form-control" name="selectSaturday" style="width: 100px" disabled>
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

        <%-- 공휴일 --%>
        <div class="d-flex justify-content-center">
            <div class="col-1">
                <input class="form-check-input" type="checkbox" id="chkholiday" name="chkday" value="공휴일" disabled>
                <label class="form-check-label" for="chkholiday"><h5>공휴일</h5></label>
            </div>
            <div class="col-1">
                <input class="form-check-input" type="checkbox" id="anytime3" name="chkanytime" disabled>
                <label class="form-check-label" for="anytime3">시간무관</label>
            </div>
            <select class="form-control col-1" id="ampmHoliday1" name="selectHoliday" disabled>
                <option value='am'>오전</option>
                <option value='pm'>오후</option>
            </select>
            <select class="form-control" name="selectHoliday" style="width: 100px" disabled>
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
            <select class="form-control col-1" id="ampmHoliday2" name="selectHoliday" disabled>
                <option value='am'>오전</option>
                <option value='pm'>오후</option>
            </select>
            <select class="form-control" style="width: 100px" name="selectHoliday" disabled>
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
    </div><hr>

    <%-- 공영/민영 구분 --%>
    <div class="form-group">
        <input class="form-check-input" type="checkbox" value="" id="chkgubun">
        <label class="form-check-label" for="chkgubun">구분</label>

        <div class="row d-flex justify-content-center">
            <div class="col-1">
                <input class="form-check-input" type="checkbox" value="gubunthis" id="chkpublic" name="gubunthis" disabled>
                <label class="form-check-label" for="chkpublic"><h5>공영</h5></label>
            </div>
            <div class="col-1">
                <input class="form-check-input" type="checkbox" value="gubunthis" id="chkprivate" name="gubunthis" disabled>
                <label class="form-check-label" for="chkprivate"><h5>민영</h5></label>
            </div>
        </div>
    </div><hr>

    <%-- 요일제/미시행 구분 --%>
    <div class="form-group">
        <input class="form-check-input" type="checkbox" value="" id="chkbuze">
        <label class="form-check-label" for="chkbuze">요일제</label>

        <div class="row d-flex justify-content-center">
            <div class="col-1">
                <input class="form-check-input" type="checkbox" value="gubunthis" id="chkyes" name="buzethis" disabled>
                <label class="form-check-label" for="chkyes"><h5>시행</h5></label>
            </div>
            <div class="col-1">
                <input class="form-check-input" type="checkbox" value="gubunthis" id="chkno" name="buzethis" disabled>
                <label class="form-check-label" for="chkno"><h5>미시행</h5></label>
            </div>
        </div>
    </div><hr>

    <%-- 정기권 유무 --%>
    <div class="form-group">
        <input class="form-check-input" type="checkbox" value="" id="chkpass">
        <label class="form-check-label" for="chkpass">정기권</label>

        <div class="row d-flex justify-content-center">
            <div class="col-1">
                <input class="form-check-input" type="checkbox" id="chkonedaypass" name="passthis" disabled>
                <label class="form-check-label" for="chkonedaypass"><h5>1일정기권 발행</h5></label>
            </div>
            <div class="col-1">
                <input class="form-check-input" type="checkbox" id="chkmonthpass" name="passthis" disabled>
                <label class="form-check-label" for="chkmonthpass"><h5>월정기권 발행</h5></label>
            </div>
        </div>
    </div><hr>

    <%-- 결제방법 --%>
    <div class="form-group">
        <input class="form-check-input" type="checkbox" value="" id="chkpayment">
        <label class="form-check-label" for="chkpayment">결제방법</label>

        <div class="row d-flex justify-content-center">
            <div class="col-1">
                <input class="form-check-input" type="checkbox" id="chkcash" name="paythis" disabled>
                <label class="form-check-label" for="chkcash"><h5>현금가능</h5></label>
            </div>
            <div class="col-1">
                <input class="form-check-input" type="checkbox" id="chkcard" name="paythis" disabled>
                <label class="form-check-label" for="chkcard"><h5>카드가능</h5></label>
            </div>
            <div class="col-1">
                <input class="form-check-input" type="checkbox" id="chkothers" name="paythis" disabled>
                <label class="form-check-label" for="chkothers"><h5>기타</h5></label>
            </div>
        </div>
    </div><hr>

    <%-- 검색버튼 --%>
    <div class="row justify-content-end">
        <button type="button" class="btn btn-primary" id="schbtn"><i class="fas fa-search"></i>검색하기</button>
    </div>
</div>

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
                    <div class="col-4">
                        평일 : ${p.shour} ~ ${p.ehour} <br>
                        토요일 : ${p.satshour} ~ ${p.satehour} <br>
                        공휴일 : ${p.holshour} ~ ${p.holehour}
                    </div>

                    <div class="col d-flex justify-content-end pt-5">
                        <c:if test="${p.buze eq '요일제'}">
                            <button class="btn btn-sm btn-danger m-1" style="height: 30px">${p.buze}</button>
                        </c:if>
                        <c:if test="${p.gubun eq '공영'}">
                            <button class="btn btn-sm btn-success m-1" style="height: 30px">공영</button>
                        </c:if>
                        <c:if test="${p.gubun eq '민영'}">
                            <button class="btn btn-sm btn-primary m-1" style="height: 30px">민영</button>
                        </c:if>
                        <c:if test="${p.onedaypassfee ne null}">
                            <button class="btn btn-sm btn-info m-1" style="height: 30px">1일 : ₩${p.onedaypassfee}</button>
                        </c:if>
                        <c:if test="${p.monthpassfee ne null}">
                            <button class="btn btn-sm btn-info m-1" style="height: 30px">월 : ₩${p.monthpassfee}</button>
                        </c:if>
                        <c:if test="${p.payment ne null}">
                            <button class="btn btn-sm btn-warning m-1" style="height: 30px">결제방법 : ${p.payment}</button>
                        </c:if>
                    </div>
                </div><hr>
            </div> <%-- 아이템 반복 --%>
        </c:forEach>
    </div>
</div>