<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="newChar" value="
" scope="application" />

<!-- 세션 임의로 생성해서 테스트 -->


<div class="container mt-5">
    <div>
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
                    <div class="text-muted fst-italic mb-2">${bd.regdate}</div>
                    <!-- Post categories-->
                    <span class="text-muted fst-italic">작성자 ${bd.userid} / </span>
                    <span class="text-muted fst-italic">조회수 ${bd.views} / </span>
                    <span class="text-muted fst-italic">추천수 ${bd.likes} / </span>
                    <c:if test="${not empty UID and UID eq bd.userid}">
                        <span style="float: right">
                            <button type="button" class="btn btn-warning text-white">
                                <i class="fas fa-edit"></i> 수정하기</button>
                            <button type="button" class="btn btn-danger">
                                <i class="fas fa-trash-alt"></i> 삭제하기</button>
                        </span>
                    </c:if>
                </header>
                <!-- Preview image figure-->
                <figure class="mb-4"><img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." /></figure>
                <!-- Post content-->
                <section class="mb-5">
                    <p class="fs-5 mb-4">${fn:replace(bd.contents, newChar, "<br>")}</p>
                </section>
            </article>
            <!-- Comments section-->
            <section class="mb-5">
                <div class="card bg-light">
                    <div class="card-body">
                        <!-- Comment form-->
                        <form class="mb-4" name="replefrm" id="replefrm">
                            <textarea class="form-control" name="contents" id="contents" rows="3" placeholder="댓글을 달아보세요!"></textarea>
                            <button type="button" id="newbrbtn">작성완료</button>
                            <input type="hidden" name="userid" value="${UID}">
                            <input type="hidden" name="bdno" value="${param.bdno}">
                        </form>
                        <!-- Comment with nested comments-->
                        <div class="d-flex mb-4">
                            <c:forEach var="r" items="${rps}">
                                <c:if test="${r.rno eq r.rpno}">
                                    <!-- Parent comment-->
                                    <span><i class="fas fa-comment"></i></span>&nbsp;&nbsp;
                                    <div class="ms-3">
                                        <div class="fw-bold">${r.userid} / ${r.regdate}
                                            <span style="float: right">
                                                <c:if test="${not empty UID}"><a href="javascript:addReply('${r.rno}')"> [추가]</a> </c:if>
                                                <c:if test="${UID eq r.userid}">[수정] [삭제]</c:if></span></div>
                                        </div>
                                    <p>${r.contents}</p>
                                </c:if>
                                <c:if test="${r.rno ne r.rpno}">
                                    <!-- Child comment 1-->
                                    <div class="d-flex mt-4 offset-1">
                                        <span><i class="far fa-comments"></i></span>&nbsp;&nbsp;
                                        <div class="ms-3">
                                            <div class="fw-bold">${r.userid} / ${r.regdate}
                                                <span style="float: right">
                                                <c:if test="${UID eq r.userid}">[수정] [삭제]</c:if></span>
                                            </div>
                                            <p>${r.contents}</p>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
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
                        <input class="form-control" type="text" placeholder="Enter search term..." aria-label="Enter search term..." aria-describedby="button-search" />
                        <button class="btn btn-primary" id="button-search" type="button">Go!</button>
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
                                <li><a href="#!">Web Design</a></li>
                                <li><a href="#!">HTML</a></li>
                                <li><a href="#!">Freebies</a></li>
                            </ul>
                        </div>
                        <div class="col-sm-6">
                            <ul class="list-unstyled mb-0">
                                <li><a href="#!">JavaScript</a></li>
                                <li><a href="#!">CSS</a></li>
                                <li><a href="#!">Tutorials</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Side widget-->
            <div class="card mb-4">
                <div class="card-header">Side Widget</div>
                <div class="card-body">You can put anything you want inside of these side widgets. They are easy to use, and feature the Bootstrap 5 card component!</div>
            </div>
        </div>
    </div>
</div>

<!-- 대댓글 작성을 위한 모달 대화상자 -->
<div class="modal hide" id="repleModal" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">대댓글 쓰기</h3>
            </div>
            <div class="modal-body">
                <form name="rpfrm" id="rpfrm" class="well form-inline">
					<textarea name="reple" id="rreple" rows="8"
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
