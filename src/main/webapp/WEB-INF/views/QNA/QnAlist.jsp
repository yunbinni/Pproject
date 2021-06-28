<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- cp = currentpage --%>
<fmt:parseNumber var = "cp" value="${param.cp}" />
<fmt:parseNumber var = "sp" value="${(cp - 1) / 10}" integerOnly="true"/>
<fmt:parseNumber var = "sp" value="${sp * 10 + 1}"/>
<fmt:parseNumber var = "ep" value="${sp + 9}" />

<%-- 총 게시물 수를 / 페이지당 게시물수로 나눔 -> 총 페이지수(tp)임 --%>
<fmt:parseNumber var = "tp" value="${QnAcnt / 30}" integerOnly="true" />
<c:if test="${(QnAcnt % 30) > 0}" >
    <fmt:parseNumber var = "tp" value="${tp + 1}" />
</c:if>

<%-- 글번호 계산하는법 --%>
<fmt:parseNumber var="snum" value="${QnAcnt - (cp - 1) * 30}" />

<%-- 페이지 링크 : 검색 기능 x  --%>
<c:set var="pglink" value="/QNA/QnAlist?cp=" />


<%-- 페이지 링크: 검색 기능 o, 예를들어 제목으로 빅데이터를 검색하면
http://localhost:8080/board/find?findtype=title&findkey=빅데이터&cp=1 이 검색창에 뜸  --%>
<c:if test="${not empty param.findkey}">
    <c:set var="pglink"
           value="/QNA/find?findtype=${param.findtype}&findkey=${param.findkey}&cp=" />
</c:if>
<div class= "QnApushdwn">
    <div class="row">
        <div class="col-5 offset-1">
            <i class="fas fa-question fa-2x">질의응답(Q&A)</i>
        </div>

        <div class= "col-5 text-right">
            <button type="button" class="btn btn-primary"
                    id="newFAQbtn">FAQ 페이지</button>
        </div>

    </div>
</div>
<div class= "QnApushdwn1">
    <div class="row ">
        <div class="col-5 offset-1">
            <div class="form-group row">
                <select class="form-control col-3 border-primary "
                        name="findtype" id="findtype">
                    <option value="title">제목</option>
                    <option value="titcont">제목+내용</option>
                    <option value="userid">작성자</option>
                    <option value="contents">내용</option>
                </select>&nbsp;
                <input type="text" name="findkey" id="findkey"
                       class="form-control col-4 border-primary"
                       value="${param.findkey}">&nbsp;
                <button type="button" id="findbtn"
                        class="btn btn-primary">
                    <i class="fas fa-search"></i> 검색</button>
            </div>
        </div>
        <div class="col-5 text-right">
            <button type="button" class="btn btn-light" id="newQnAbtn">
                <i class="fas fa-plus-circle"></i>새글쓰기</button>
        </div>
    </div><!-- 검색, 버튼 -->
</div>

<div class="row">
    <div class="col-10 offset-1">
        <table class="table table-striped text-center table-hover">
            <thead style="background: #dff0d8">
            <tr>
                <th style="width: 7%">번호</th>
                <th style="">제목</th>
                <th style="width: 12%">작성자</th>
                <th style="width: 10%">작성일</th>
                <th style="width: 7%">추천</th>
                <th style="width: 7%">조회</th>
            </tr>
            </thead>
            <tbody>
            <!-- <span class="badge badge-danger">Hot</span> -->
            <tr class="text-danger bg-warning"><th>공지</th>
                <th><i class="fas fa-question"></i>
                    주차장 민원사항
                </th>
                <th>운영자</th>
                <th>2021.06.30</th>
                <th>9</th>
                <th>100</th>
            </tr>

            <!-- QnAs : 여러 게시물 수 , 그중에 하나의 게시물(QnA) -->
            <c:forEach var="QnA" items="${QnAs}">
                <tr>
                    <td>${snum}</td>
                    <td>${QnA.title }</td>
                    <td>${QnA.userid}</td>
                    <td>${fn:substring(QnA.regdate,0,10)}</td>
                    <td>${QnA.thumbup}</td>
                    <td>${QnA.views}</td>
                    <c:set var="snum" value="${snum - 1}" />
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>
</div>

<!-- 페이지네이션  -->
<div class="row">
    <div class="col-12">
        <ul class="pagination justify-content-center">

            <%-- '이전'버튼이 작동되어야 할때는 sp가 11보다 클때 --%>
            <li class="page-item <c:if test="${sp lt 11}">disabled</c:if>">
                <a href="${pglink}${sp - 10}" class="page-link">이전</a></li>


            <%-- 반복문을 이용해서 페이지 링크 생성 --%>
            <c:forEach var="i" begin="${sp}" end="${ep}" step="1">
                <%-- 표시하는 페이지i가 총페이지수보다 작거나 같을 동안만 출력--%>
                <c:if test="${i le tp}">
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

            <%-- '다음'버튼이 작동되어야 할때는 ??? --%>
            <li class="page-item <c:if test="${ep gt tp}">disabled</c:if>">
                <a href="${pglink}${sp+10}" class="page-link">다음</a></li>
        </ul>
    </div>
</div>