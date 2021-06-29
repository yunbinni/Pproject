<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="newChar" value="
" scope="application" />

<!-- 세션 임의로 생성해서 테스트 -->
<%--<%--%>
<%--    HttpSession sess = request.getSession();--%>

<%--    sess.setAttribute("UID", "anrdl3294");--%>
<%--%>--%>

<div class="container mt-5">
    <div class="mt-5">
        <h2><i class="fas fa-list"> 자유 게시판</i></h2>
        <hr>
    </div><!-- 페이지 타이틀 -->

    <div class="row">
        <div class="col-lg-8">
            <!-- Post content-->
            <article>
                <!-- Post header-->
                <header class="mb-4">
                    <!-- Post title-->
                    <h1 class="fw-bolder mb-1">${bd.title}</h1>
                    <!-- Post meta content-->
                    <div class="text-muted fst-italic mb-2">${fn:substring(bd.regdate, 0, 19)}</div>
                    <!-- Post categories-->
                    <span class="text-muted fst-italic">작성자 ${bd.userid} / </span>
                    <span class="text-muted fst-italic">조회수 ${bd.views} / </span>
                    <span class="text-muted fst-italic">추천수 ${bd.likes}</span>
                    <c:if test="${not empty UID and UID eq bd.userid}">
                        <span style="float: right">
                            <button type="button" class="btn btn-warning text-white" id="modbdbtn">
                                <i class="fas fa-edit"></i> 수정하기</button>
                            <button type="button" class="btn btn-danger" id="rmvbdbtn">
                                <i class="fas fa-trash-alt"></i> 삭제하기</button>
                        </span>
                    </c:if>
                </header>
                <!-- Post content-->
                <section class="mb-5" style="min-height:300px">
                    <p class="fs-5 mb-4" s>${fn:replace(bd.contents, newChar, "<br>")}</p>
                    <input type="hidden" id="bdno" value="${param.bdno}">
                </section>
                <c:if test="${not empty UID}">
                    <div style="float: right" class="mb-3">
                        <button type="button" class="btn btn-danger" id="thumbbtn">
                            <i class="far fa-thumbs-up"></i> 추천하기</button>
                    </div>
                </c:if>
            </article>
            <!-- Comments section-->
            <section class="mb-5" style="clear: both">
                <div class="card bg-light">
                    <div class="card-body">
                        <!-- Comment form-->
                        <form class="mb-5" name="replefrm" id="replefrm">
                            <textarea class="form-control" name="contents" id="contents" rows="3"
                                      <c:if test="${not empty sessionScope.UID}">
                                        placeholder="댓글을 달아보세요!"
                                      </c:if>
                                      <c:if test="${empty sessionScope.UID}">
                                        placeholder="로그인 후 이용해주세요!!" disabled
                                      </c:if>></textarea>
                            <button type="button" id="newbrbtn" class="btn btn-outline-dark btn-sm mt-1">작성완료</button>
                            <input type="hidden" name="userid" value="${UID}">
                            <input type="hidden" name="bdno" value="${param.bdno}">
                        </form>
                        <!-- Comment with nested comments-->
                        <c:forEach var="r" items="${rps}">
                            <div class="d-flex mb-4 col-mid-5">
                                <c:if test="${r.rno eq r.rpno}">
                                    <!-- Parent comment-->
                                    <div class="ms-3" style="width: 600px; margin-top: 10px;">
                                        <span><i class="fas fa-comment"></i></span>&nbsp;&nbsp;
                                        <span class="fw-bold">${r.userid} / <span class="text-muted">${fn:substring(r.regdate, 0, 19)}</span>
                                            <span style= "float: right; text-align: right">
                                                <c:if test="${not empty UID}"><a href="javascript:addReply('${r.rno}')"> [추가]</a> </c:if>
                                                <c:if test="${UID eq r.userid}"><a href="javascript:modReple('${r.rno}')">[수정]</a> <a href="javascript:delReple('${r.rno}','${r.bdno}')">[삭제]</a></c:if>
                                            </span>
                                        </span>
                                        <p>${r.contents}</p>
                                    </div>
                                </c:if>
                                <c:if test="${r.rno ne r.rpno}">
                                    <!-- Child comment 1-->
                                    <div class="d-flex offset-1">
                                        <div class="ms-3" style="width: 600px">
                                            <span><i class="far fa-comments"></i></span>&nbsp;&nbsp;
                                            <span class="fw-bold">${r.userid} / <span class="text-muted">${fn:substring(r.regdate, 0, 19)}</span>
                                                <span style="float: right; text-align: right">
                                                    <c:if test="${UID eq r.userid}"><a href="javascript:modReple('${r.rno}')">[수정]</a> <a href="javascript:delReple('${r.rno}','${r.bdno}')">[삭제]</a></c:if></span>
                                            </span>
                                            <p>${r.contents}</p>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </div>
        <!-- Side widgets-->
        <div class="col-lg-4">
            <!-- Search widget-->
            <div class="card mb-4">
                <div class="card-header">Search</div>
                <div class="card-body">
                    <div class="input-group">
                        <input class="form-control" type="text" placeholder="검색할 내용을 입력하세요" aria-label="Enter search term..." name="findkey" id="findkey"/>
                        <button class="btn btn-primary" id="findbtn2" type="button">검색</button>
                    </div>
                </div>
            </div>
            <!-- Categories widget-->
            <div class="card mb-4">
                <div class="card-header">Categories</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <ul class="list-unstyled mb-0">
                                <li><a href="/">홈으로</a></li>
                                <li><a href="/">공지사항</a></li>
                            </ul>
                        </div>
                        <div class="col-sm-6">
                            <ul class="list-unstyled mb-0">
                                <li><a href="/board/list?cp=1">자유게시판</a></li>
                                <li><a href="/board/write">새글작성</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Side widget-->
            <div class="card mb-4">
                <div class="card-header">Side Widget</div>
                <div class="card-body">광고이미지</div>
            </div>
        </div>
    </div>
</div>

<!-- 대댓글 작성을 위한 모달 대화상자 -->
<div class="modal hide" id="repleModal" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">추가댓글 쓰기</h3>
            </div>
            <div class="modal-body">
                <form name="rpfrm" id="rpfrm" class="well form-inline">
					<textarea name="contents" id="rreple" rows="8"
                              cols="75" class=""></textarea>
                    <input type="hidden" name="userid" value="${UID}">
                    <input type="hidden" name="bdno" value="${param.bdno}">
                    <input type="hidden" name="rpno" id="rpno">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="newrrpbtn"
                        class="btn btn-warning">대댓글 작성</button>
            </div>
        </div>
    </div>

</div>

<!-- 대댓글 수정을 위한 모달 대화상자 -->
<div class="modal hide" id="modRepleModal" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">댓글 수정하기</h3>
            </div>
            <div class="modal-body">
                <form name="modrpfrm" id="modrpfrm" class="well form-inline">
					<textarea name="contents" id="modreple" rows="8"
                              cols="75" class=""></textarea>
                    <input type="hidden" name="bdno" value="${param.bdno}">
                    <input type="hidden" name="rno" id="rno">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="modrpbtn"
                        class="btn btn-warning">수정</button>
            </div>
        </div>
    </div>

</div>

