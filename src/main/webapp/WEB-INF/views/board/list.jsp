<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:parseNumber var="cp" value="${param.cp}" />
<fmt:parseNumber var="sp" value="${(cp-1) / 10}" integerOnly="true" />
<fmt:parseNumber var="sp" value="${sp * 10 + 1}" integerOnly="true" />
<fmt:parseNumber var="ep" value="${sp + 9}"/>

<%-- 총 게시물 수를 페이지당 게시물 수로 나눔 : 총 페이지수 --%>
<fmt:parseNumber var="tp" value="${bdcnt / 20}" integerOnly="true"/>
<c:if test="${(bdcnt % 20) > 0}">
    <fmt:parseNumber var="tp" value="${tp + 1}" />
</c:if>

<%-- 글번호 --%>
<fmt:parseNumber var="snum" value="${bdcnt - (cp - 1) * 20}" />

<%-- 페이지 링크 : 검색 기능 x--%>
<c:set var="pglink" value="/board/list?cp=" />

<%-- 페이지 링크 : 검색 기능 o --%>
<c:if test="${not empty param.findkey}">
    <c:set var="pglink" value="/board/find?findtype=${param.findtype}&findkey=${param.findkey}&cp=" />
</c:if>

<div id="main">
    <div class="row mt-5">
        <div class="col-10 offset-1">
            <h2><i class="fas fa-list"> 자유 게시판</i></h2>
            <hr>
        </div><!-- 페이지 타이틀 -->
    </div>

    <div class="row mb-3">
        <div class="col-5 offset-1">
            <div>
                <button type="button" class="btn btn-light" id="newbdbtn">
                    <i class="fas fa-plus-circle"></i> 글 작성</button>
            </div>
        </div>
        <div class="col-5 text-right">
            <button type="button" id="listThumbbtn" class="btn btn-primary">추천순으로 보기</button>
            <button type="button" id="listViewbtn" class="btn btn-primary">조회순으로 보기</button>
        </div>
    </div>

    <div class="row">
        <div class="col-10 offset-1">
            <table class="table table-striped text-center table-hover table-ellipsis">
                <thead style="background: #CCEEFF">
                <tr>
                    <th style="width: 7%">번호</th>
                    <th style="">제목</th>
                    <th style="width: 12%">작성자</th>
                    <th style="width: 15%">작성일</th>
                    <th style="width: 7%">추천</th>
                    <th style="width: 7%">조회</th>
                </tr>
                </thead>
                <tbody>
                <tr class="text-danger bg-warning">
                    <th>공지</th>
                    <th><span class="badge badge-danger">Notice</span>
                        공지사항입니다(필독)
                    </th>
                    <th>운영자</th>
                    <th>2021.05.21</th>
                    <th>10</th>
                    <th>521</th>
                </tr>

                <c:forEach var="bd" items="${bds}">
                    <tr>
                        <td>${snum}</td>
                        <td><a href="/board/view?bdno=${bd.bdno}">${bd.title}</a></td>
                        <td>${bd.userid}</td>
                        <td>${fn:substring(bd.regdate, 0, 10)}</td>
                        <td>${bd.likes}</td>
                        <td>${bd.views}</td>
                        <c:set var="snum" value="${snum - 1}" />
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <ul class="pagination justify-content-center">

                <%-- '이전' 버튼이 작동되어야 할때는 sp가 11보다 클 때 --%>
                <li class="page-item <c:if test="${sp lt 11}">disabled</c:if>">
                    <a href="${pglink}${sp-10}" class="page-link">이전</a></li>

                <%-- 반복문을 이용해서 페이지링크 생성 --%>
                <c:forEach var="i" begin="${sp}" end="${ep}" step="1">
                    <%-- 표시되는 페이지 i 가 총페이지 수보다 작거나 같을 동안만 출력 --%>
                    <c:if test="${i le tp}">
                        <c:if test="${i eq cp}">
                            <li class="page-item active"><a href="${pglink}${i}" class="page-link">${i}</a></li>
                        </c:if>

                        <c:if test="${i ne cp}">
                            <li class="page-item"><a href="${pglink}${i}" class="page-link">${i}</a></li>
                        </c:if>
                    </c:if>
                </c:forEach>

                <%-- '다음' 버튼이 작동되어야 할때는 sp가 11보다 클 때 --%>
                <li class="page-item <c:if test="${ep gt tp}">disabled</c:if>">
                    <a href="${pglink}${sp+10}" class="page-link">다음</a></li>
            </ul>
        </div>
    </div><!-- 페이지네이션 -->

    <div class="row">
        <div class="col-5 offset-4">
            <div class="form-group row">
                <select class="form-control col-3 border-primary" name="findtype" id="findtype">
                    <option value="title">제목</option>
                    <option value="titcont">제목+내용</option>
                    <option value="userid">작성자</option>
                    <option value="contents">내용</option>
                </select>&nbsp;
                <input type="text" name="findkey" id="findkey"
                       class="form-control col-5 border-primary" value="${param.findkey}">&nbsp;
                <button type="button" id="findbtn" class="btn btn-primary">
                    <i class="fas fa-search"></i> 검색</button>
            </div>
        </div>
    </div>

</div>
