<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:parseNumber var="cp" value="${param.cp}" />
<fmt:parseNumber var="sp" value="${(cp - 1) / 10}" integerOnly="true" />
<fmt:parseNumber var="sp" value="${sp * 10 + 1}" />
<fmt:parseNumber var="ep" value="${sp + 9}" />

<!-- total page -->
<fmt:parseNumber var="tp" value="${rvcnt / 30}" integerOnly="true" />
<c:if test="${(rvcnt % 30) > 0}">
    <fmt:parseNumber var="tp" value="${tp + 1}" />
</c:if>

<!-- review number -->
<fmt:parseNumber var="snum" value="${rvcnt - (cp - 1) * 30}" />

<!-- cp setting: no filter/searching -->
<c:set var="pglink" value="/review/list?cp=" />
<!-- cp setting with filter/searching -->
<c:if test="${not empty param.findkey}">
    <c:set var="pglink"
           value="/review/find?findloc=${param.findloc}&findtype=${param.findtype}&findkey=${param.findkey}&cp=" />
</c:if>

<div id="main">

    <div class="text-left">
        <h2 style="font-family:'.AppleSystemUIFont'" > Review </h2>
        <small class="text mute">
            사용하신 주차장에 관한 솔직한 이용후기를 남겨주세요.
            고객님의 소중한 리뷰가 많은 분들의 도움이 됩니다. <br>
            자세한 이용문의는 공지사항을 확인해주세요.</small>
    </div> <!-- page title -->
    <hr>

    <div class="row">

        <div class="offset-1">
            <div class="form-group row">
                <select class="form-control col-3 row"
                    name="findloc" id="findloc">
                    <option value="location">- 지역선택 -</option>
                    <option value="서울특별시">서울특별시</option>
                    <option value="인천광역시">인천광역시</option>
                    <option value="대전광역시">대전광역시</option>
                    <option value="광주광역시">광주광역시</option>
                    <option value="대구광역시">대구광역시</option>
                    <option value="울산광역시">울산광역시</option>
                    <option value="부산광역시">부산광역시</option>
                </select> <!-- location filter -->

                &nbsp;&nbsp;&nbsp;&nbsp;
                <select class="form-control col-3"
                        name="findtype" id="findtype">
                    <option value="title">제목</option>
                    <option value="ttlcon">제목+내용</option>
                    <option value="userid">작성자</option>
                    <option value="contents">내용</option>
                </select> &nbsp;
                <input type="text" name="findkey" id="findkey"
                    class="form-control col-4" value="${param.findkey}">
                <button type="button" id="findbtn"
                        class="btn btn-sm btn-secondary">
                    <i class="fas fa-search"></i> 검색</button>
            </div>
        </div> <!-- to search -->

        <div class="col-6 text-right">
            <button type="button" name="newrvbtn" id="newrvbtn"
                    class="btn btn-sm btn-secondary"> 리뷰 작성</button>
        </div> <!-- write a new review -->

    </div> <!-- serching/write & buttons -->


    <div class="row">
        <div class="col-10 offset-1">
            <table class="table table-hover text-center">
                <thead>
                    <tr>
                        <th style="width: 10%">번호</th>
                        <th style="width: 12%">지역</th>
                        <th>제목</th>
                        <th style="width: 12%">작성자</th>
                        <th style="width: 15%">작성일</th>
                        <th style="width: 10%">조회수</th>
                        <th style="width: 10%"><i class="fas fa-heart"></i></th>
                    </tr>
                </thead> <!-- board header -->

                <tbody>
                    <tr class="text-danger">
                        <th scope="row">공지</th>
                        <th scope="row">-지역 선택-</th>
                        <th><i class="bi bi-megaphone"></i> &nbsp;업데이트 관련 안내 공지</th>
                        <th>운영자</th>
                        <th>2021.06.18</th>
                        <th>384</th>
                        <th>197</th>
                    </tr> <!-- notice -->

                    <c:forEach var="rv" items="${rvs}">
                    <tr class="result">
                        <td>${snum}</td>
                        <td class="locf">${rv.loc}</td>
                        <td><a class="lcol"
                               href="/review/view?rvno=${rv.rvno}">${rv.title}</a></td>
                        <td>${rv.userid}</td>
                        <td>${fn:substring(rv.regdate,0,10)}</td>
                        <td>${rv.views}</td>
                        <td>${rv.likes}</td>
                        <c:set var="snum" value="${snum-1}" />
                    </tr>
                    </c:forEach>

                </tbody> <!-- reviews -->
            </table>
        </div>

    </div> <!-- contents -->

    <div class="row">
        <div class="col-12">
            <ul class="pagination justify-content-center">

                <li class="page-item <c:if test="${sp lt 11}">disabled</c:if>" >
                    <a href="${pglink}${sp-10}" class="page-link">이전</a></li>

                <c:forEach var="i" begin="${sp}" end="${ep}" step="1">
                    <c:if test="${i le tp}"> <!-- i should be less than or equal tp -->
                        <c:if test="${i eq cp}">
                            <li class="page-item active">
                                <a href="${pglink}${i}" class="page-link">${i}</a></li>
                        </c:if>

                        <c:if test="${i ne cp}">
                            <li class="page-item">
                                <a href="${pglink}${i}" class="page-link">${i}</a></li>
                        </c:if>
                    </c:if>
                </c:forEach>

                <li class="page-item <c:if test="${ep gt tp}">disabled</c:if>">
                    <a href="${pglink}${sp+10}" class="page-link">다음</a></li>
            </ul>
        </div>
    </div><!-- pagination -->

</div> <!-- main -->

