<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="row">
    <!-- 로고 이미지 -->
    <div class="col">
        <img src="/img/logo.png" alt="로고 이미지입니다." />
    </div>

    <!-- 검색 박스 -->
    <div class="col m-3">
        <div class="input-group">
            <div class="form-outline">
                <input type="search" class="form-control" placeholder="빠른 주차장 찾기"/>
            </div>
            <button type="button" class="btn btn-primary">
                <i class="fas fa-search"></i>검색
            </button>
        </div>
    </div>

    <!-- 로그인 / 로그아웃 버튼 !!! 후에 섹션 개체 생성 필요 -->
    <div class="col text-right m-3">
        <c:if test="${empty UID}">
            <h1><button type="button"
                        class="btn btn-danger"
                        data-toggle="modal"
                        data-target="#loginmodal">로그인</button>
        </c:if>
        <c:if test="${not empty UID}">
            <h1><button type="button"
                        id="logoutbtn"
                        class="btn btn-dark">로그아웃</button></h1>
        </c:if>
    </div>
</header>

<!-- 네비게이션 바 -->
<nav class="navbar navbar-expand navbar-dark bg-primary">
    <ul class="navbar-nav nav-fill w-100">
        <li class="nav-item"><a class="nav-link" href="/notice">공지사항</a></li>
        <c:if test="${empty UID}"><li class="nav-item"><a class="nav-link" href="/join/agree">회원가입</a></li></c:if>
        <c:if test="${not empty UID}"><li class="nav-item"><a class="nav-link disabled" href="/join/agree">회원가입</a></li></c:if>
        <li class="nav-item"><a class="nav-link" href="/board/list?cp=1">커뮤니티</a></li>
        <li class="nav-item"><a class="nav-link" href="/Park/list">주차장찾기</a></li>
        <li class="nav-item"><a class="nav-link" href="/review/list">리뷰</a></li>
        <c:if test="${not empty UID}"><li class="nav-item"><a class="nav-link" href="/join/myinfo">내 정보</a></li></c:if>
        <c:if test="${empty UID}"><li class="nav-item"><a class="nav-link disabled" href="/join/myinfo">내 정보</a></li></c:if>
        <li class="nav-item"><a class="nav-link" href="/QNA/QnAlist">문의사항</a></li>
    </ul>
</nav>