<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${param.rvno eq 'null' or empty param.rvno}" >
      <script> alert('요청한 페이지가 존재하지 않습니다'); location.href='/review/list?cp=1'</script>
</c:if>

<c:set var="fnames" value="${fn:split(rv.fnames,'/')}" />
<c:set var="fsizes" value="${fn:split(rv.fsizes,'/')}" />
<c:set var="baseURL" value="http://localhost/cdn2/" />

<c:set var="newChar" value="
" scope="application" /> <!-- enter key -->

<div id="main">

    <div class="text-left">
        <h2><a class="lcol" href="/review/list">Review </a></h2>
        <small class="text mute; font-family:">
            사용하신 주차장에 관한 솔직한 이용후기를 남겨주세요.
            고객님의 소중한 리뷰가 많은 분들의 도움이 됩니다. <br>
            자세한 이용문의는 공지사항을 확인해주세요.</small>
    </div> <!-- page title -->
    <hr>

    <div>
        <div class="row" >
            <div class="col-10 offset-1">
                <button type="button" id="prevbtn"
                        class="btn btn-light btn-sm">
                    <i class="fas fa-chevron-left"></i> 이전</button>

                    <button type="button" id="nextbtn"
                            class="float-right btn btn-light btn-sm">다음
                        <i class="fas fa-chevron-right"></i></button>
            </div>

        </div> <!-- prev,next btn -->

        <div class="row">
            <table class="table col-10 offset-1">
                <tr class="tbbg1 hdset text-left">
                    <th colspan="2">
                        <h2>[${rv.loc}] &nbsp; ${rv.title}</h2>
                    </th>
                </tr>

                <tr class="tbbg2">
                    <div>
                        <td  class="width: 50%" style="font-weight: bold">${rv.userid}</td>
                        <td class="text-right">
                            <i class="far fa-eye"></i> ${rv.views} |
                            <i class="fas fa-heart"></i>  ${rv.likes}<br>
                            ${rv.regdate}</td>
                    </div>
                </tr>

                <tr class="tbbg3 bdcset">
                    <td colspan="2">
                        <div>${fn:replace(rv.contents, newChar, "<br>")}</div>

                        <c:forEach var="f" items="${fnames}">

                            <c:if test="${f ne '-' or f ne ''}">
                                <c:set var="pos" value="${fn:indexOf(f,'.')}" />
                                <c:set var="fname" value="${fn:substring(f,0,pos)}" />
                                <c:set var="fext" value="${fn:substring(f,pos+1, fn:length(f))}" />

                                <div>
                                    <img src="${baseURL}${fname}${rv.uuid}.${fext}"
                                         class="img-fluid">
                                </div>
                            </c:if>
                        </c:forEach>
                        <br>
                        <br>
                        <br>
                    </td>
                </tr>

                        <tr>
                            <td colspan="2" class="likescol">
                                <div class="wrapper">
                                    <div class="text-center">
                                        <button id="likes"
                                                type="button" data-toggle="tooltip"
                                                data-placement="bottom" title="추천: ${rv.likes}"
                                                class="btn btn-outline-danger btn-sm">
                                            <i class="fas fa-heart"></i>&nbsp;좋아요
                                        </button>

                                        <button id="nlikes"
                                                type="button" data-toggle="tooltip"
                                                data-placement="bottom" title="비추천: ${rv.nlikes}"
                                                class="btn btn-outline-dark btn-sm">
                                            <i class="fas fa-heart-broken"></i>&nbsp;싫어요</button>
                                    </div>
                                </div>
                            </td>
                        </tr>

            </table>
        </div> <!-- body -->

        <div class="row">
            <div class="col-5 offset-1">
                <button type="button" class="btn btn-success btn-sm"
                        id="editbtn" name="editbtn" style="color: white">
                    <i class="fas fa-edit"></i> 수정</button>
                <button type="button" class="btn btn-primary btn-sm"
                        id="rmvbtn" name="rmvbtn">
                    <i class="fas fa-trash"></i> 삭제</button>
            </div>

            <div class="col-5 text-right">
                <button type="button" class="btn btn-light btn-sm"
                    id="go2list" name="go2list">
                    <i class="fas fa-list"></i> 목록</button>
            </div>
        </div><!-- buttons -->
        <input type="hidden" id="rvno" value="${param.rvno}" />

    </div><!-- whole body -->
</div> <!-- main -->

