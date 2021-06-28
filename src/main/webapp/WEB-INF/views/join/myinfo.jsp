<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div id="main">
    <!-- 메인 타이틀 -->
    <div>
        <i class="fas fa-info-circle fa-2x"> 내 정보</i>
        <hr>
    </div>


    <!-- 마이페이지 폼 -->
    <div class="card card-body bg-light">
        <h3>마이페이지</h3>
        <form name="myinfofrm" id="myinfofrm">
            <div class="row">
                <div class="col-11 offset-1">
                        <div class="form-group row">
                            <label class="col-4 col-form-label text-primary text-right">
                                아이디 </label>
                            <input type="text" class="border-primary form-control col-4"
                                value="${sessionScope.userid}" readonly>
                        </div> <!-- 아이디 -->

                        <div class="form-group row">
                            <label class="col-4 col-form-label text-primary text-right">
                                이름 </label>
                            <input type="text" class="border-primary form-control col-4"
                                   value="${m.name}" readonly>
                        </div> <!-- 이름 -->

                        <div class="form-group row">
                            <label class="col-4 col-form-label text-primary text-right">
                                이메일 </label>
                            <input type="text" class="border-primary form-control col-4"
                                   value="${m.email}" readonly>
                        </div> <!-- 이메일 -->

                        <div class="form-group row">
                            <label class="col-4 col-form-label text-primary text-right">
                                휴대폰번호 </label>
                            <input type="text" class="border-primary form-control col-4"
                                   value="${m.cellphone}" readonly>
                        </div> <!-- 핸드폰번호 -->

                        <div class="form-group row">
                            <label class="col-4 col-form-label text-primary text-right">
                                가입일 </label>
                            <input type="text" class="border-primary form-control col-4"
                                   value="${m.regdate}" readonly>
                        </div> <!-- 가입일 -->

                </div>
            </div>

            <!-- 수정/탈퇴 버튼-->
            <div class="row">
                <div class="col-11 offset-1">
                    <div class="text-center">
                        <hr>
                        <button type="button" id="modimyifbtn" class="btn btn-success">
                            회원정보 수정하기</button>
                        <button type="button" id="delmyifbtn" class="btn btn-danger">
                            회원 탈퇴하기</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

</div>