<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="fname" value="${fn:split(rv.fnames, '/')}" />
<!-- to show file name -->

<div id="main">
    <script src="https://www.google.com/recaptcha/api.js"></script>

    <div class="text-left">
        <h2 style="font-family: '.AppleSystemUIFont'">리뷰 작성하기 </h2>
        <small> 리뷰 작성시 주차장 지역과 이름을 확실히 명시해주시기 바랍니다. </small>
    </div> <!-- page title -->
    <hr>

    <div class="row" >
        <div class="col-10 offset-1 text-right">
            <button type="button" data-toggle="modal"
                    data-target="#chkNoticeModal"
                    class="text-white btn btn-warning btn-sm ">
                <i class="fas fa-exclamation-circle"></i> 유의사항 확인하기</button>

            <button type="button" id="go2rvlist" name="go2rvlist"
                    class="btn btn-secondary btn-sm">
                <i class="fas fa-list"></i> 목록</button>
        </div>

    </div> <!-- notice & list btn -->

    <div class="card card-body bg-light col-10 offset-1">
        <form name="updatervfrm" id="updatervfrm">

            <div class="form-group row">
                <label for="loc"
                       class="col-form-label text-right col-2">지역</label>
                <select class="form-control col-2"
                        name="loc" id="loc" value="${rv.loc}">
                    <option value="">- 지역선택 -</option>
                    <option value="서울특별시">서울특별시</option>
                    <option value="인천광역시">인천광역시</option>
                    <option value="대전광역시">대전광역시</option>
                    <option value="광주광역시">광주광역시</option>
                    <option value="대구광역시">대구광역시</option>
                    <option value="울산광역시">울산광역시</option>
                    <option value="부산광역시">부산광역시</option>
                </select> <!-- attribute -->
            </div>

            <div class="form-group row">
                <label for="title"
                       class="col-form-label text-right col-2">제목</label>
                <input type="text" id="title" name="title" value="${rv.title}"
                       class="border-primary form-control col-9">
            </div> <!-- title -->

            <div class="form-group row">
                <label for="userid"
                       class=" col-form-label text-right col-2">작성자</label>
                <input type="text" id="userid" name="userid"
                       class="border-primary form-control col-9" readonly>
            </div> <!-- author -->

            <div class="form-group row">
                <label for="contents" class="text-right col-form-label col-2">본문내용</label>
                <textarea id="contents" name="contents" rows="15"
                          class="border-primary form-control col-9">
                    ${rv.contents}
                </textarea>
            </div> <!-- contents -->

            <!-- google maps -->
            <%--            <div class="form-group row">--%>
            <%--                <label for="map" class="col-form-label col-2 text-right">--%>
            <%--                    위치--%>
            <%--                </label>--%>
            <%--                <div id="map"></div>--%>

            <%--            </div> <!-- location tag -->--%>

            <!-- attachments -->
            <div class="form-group row">
                <label for="file1" class="col-form-label col-2 text-right">
                    사진첨부</label>

                <div class="custom-control custom-checkbox">
                    <input type="checkbox" id="die1" class="custom-control-input">
                    <label for="die1" class="custom-control-label"></label>
                </div>
                <div class="custom-file col-8">
                    <input type="file" name="img" id="file1"
                           class="custom-file-input" disabled>
                    <label class="custom-file-label">${fname[0]}</label>
                </div>
            </div>
            <div class="form-group row">
                <div class="custom-control custom-checkbox offset-2">
                    <input type="checkbox" id="die2" class="custom-control-input">
                    <label for="die2" class="custom-control-label"></label>
                </div>
                <div class="custom-file col-8">
                    <input type="file" name="img" id="file2"
                           class="custom-file-input" disabled>
                    <label class="custom-file-label">${fname[1]}</label>
                </div>
            </div>

            <div class="form-group row">
                <div class="custom-control custom-checkbox offset-2">
                    <input type="checkbox" id="die3" class="custom-control-input">
                    <label for="die3" class="custom-control-label"></label>
                </div>
                <div class="custom-file col-8">
                    <input type="file" name="img" id="file3"
                           class="custom-file-input" disabled>
                    <label class="custom-file-label">${fname[2]}</label>
                </div>
            </div>

            <!-- 수정여부 저장하기 위한 변수 -->
            <input type="hidden" name="todie" id="todie">
            <!-- uuid 저장하기 위한 변수 -->
            <input type="hidden" name="uuid" value="${rv.uuid}">
            <input type="hidden" name="rvno" value="${rv.rvno}">

            <div class="form-group row">
                <label class="col-form-label col-2 text-right ">
                    자동입력 방지</label>
                <div class="g-recaptcha"
                     data-sitekey="6LdjIwgbAAAAADR_OcUJETHsPvtg6PB5ycg6Z9Zz"></div>
                <input type="hidden" id="g-recaptcha" name="g-recaptcha"/>
            </div> <!-- captcha -->

            <hr class="col-10">
            <div class="col-12 text-center">
                <button type="button" id="updaterv"
                        class="btn btn-primary btn-sm">
                    <i class="fas fa-check"></i> 입력완료</button>
                <button type="reset" class="btn btn-danger btn-sm">
                    <i class="fas fa-times"></i> 다시입력</button>
            </div><!-- buttons -->

        </form> <!-- form -->
    </div> <!-- card body -->

</div> <!-- main -->

<!-- check notice button modal -->
<div class="modal fade" id="chkNoticeModal" tabindex="-1"
     aria-labelledby="chkNoticeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="chkNoticeModalLabel">
                    <i class="fas fa-exclamation-circle"></i> 글 작성시 유의할 점</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                300만 (이름) 회원이 함께하는 공간입니다. <br>
                리뷰 글 작성시 주차장 지역과 이름을 확실히 명시해 주시기 바랍니다. <br>
                <br>
                ① 광고 게시글 작성 금지<br>
                ② 타 회원을 비방하는 글 작성 금지 <br>
                ③ 논란 조장 글 작성 금지 <br>
                ④ 게시판 목적에 맞는 글 작성 <br>
                <br>
                ※ 위 사항에 해당하는 게시글은 예고없이 삭제됩니다.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary"
                        data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>