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
        </select>
    </div>

    <div class="col d-flex justify-content-center form-outline">
        <input type="search" class="form-control w-75" placeholder="상세조건을 선택후 검색하여 주십시오." id="findkey" name="findkey" value="${param.findkey}" readonly>
        <button type="button" class="btn btn-primary" id="findbtn"><i class="fas fa-search"></i></button>
    </div>
</div>

<%-- 아이템 리스트 부분(Item List) => Bootstrap의 scrollspy 사용 --%>
<div id="list" class="row border-right border-bottom">

    <%-- 간단한 아이템들, brief items --%>
    <div id="list-example" class="col-3 d-inline list-group" style="display: inline-block">
        <c:forEach var="p" items="${parks}">
            <a class="list-group-item list-group-item-action" href="#list-item-${p.name}">${p.name}</a>
        </c:forEach>
    </div>


    <%-- 자세한 아이템들, detail items --%>
    <div data-bs-spy="scroll" data-bs-target="#list-example" data-bs-offset="0" class="col-9 d-inline scrollspy-example" tabindex="0" style="overflow: auto; display: inline-block; width: 300px; height: 960px">
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