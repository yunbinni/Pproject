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
        <form name="myinfofrm" id="myinfofrm">
            <div class="row">
                <div class="col-11 offset-1">
                    <div class="form-group row">
                        <span class="col text-center">
                            <h2>회원정보</h2>
                        <div id="myinfo">

                            <div><span class="label">아이디</span>
                                <span>${muid.userid}</span></div>
                            <div><span class="label">이름</span>
                                <span>${muid.name}</span></div>
                            <div><span class="label">이메일</span>
                                <span>${muid.email}</span></div>
                            <div><span class="label">가입일</span>
                                <span>${muid.regdate}</span></div>
                        </div>
                        </span>
                    </div>

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