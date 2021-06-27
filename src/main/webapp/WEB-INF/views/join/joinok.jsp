<%@ page pageEncoding="utf-8" %>

<div id="main">
    <!-- 메인 타이틀 -->
    <div>
        <i class="fas fa-users fa-2x"> 회원가입</i>
        <hr>
    </div>

    <!--브레드크럼 -->
    <nav>
        <ul class="breadcrumb">
            <li class="breadcrumb-item">
                <button type="button" disabled class="btn btn-light">
                    이용약관</button>
            </li>
            <li class="breadcrumb-item">
                <button type="button" disabled class="btn btn-light">
                    실명확인</button>
            </li>
            <li class="breadcrumb-item">
                <button type="button" disabled class="btn btn-light">
                    정보입력</button>
            </li>
            <li class="breadcrumb-item active">
                <button type="button" disabled class="btn btn-primary">
                    가입완료</button>
            </li>
        </ul>
    </nav>

    <!--섹션 타이틀-->
    <div>
        <h2>회원가입이 완료되었습니다.</h2>
        <small class="text-muted">
            반갑습니다. 저희 더조은주차장의 회원으로 가입해주셔서 진심으로 감사드립니다. <br>
        </small>
        <hr>
    </div>

    <!-- 감사인사 폼 -->
    <div class="card card-body bg-light">
        <form name="joinokfrm" id="joinokfrm">
            <div class="row">
                <div class="col-11 offset-1">
                    <div class="form-group row">
                        <span class="col text-center">
                            당사는 회원님 최적화 주차장을 찾아드리는 서비스를 하고 있습니다. <br>
                            앞으로 많은 관심과 이용 바랍니다. 감사합니다. <br>
                        </span>
                    </div>
                    <div class="form-group row">
                        <img src="/img/newMemberCP.png"
                             class="col-8 offset-2 img-fluid">
                    </div>
                    <div class="form-group row">
                        <button type="button" id="newcoupon"
                                class="btn btn-primary col-8 offset-2 text-center">
                            <i class="fas fa-download"></i> 쿠폰 다운받기</button>
                        <hr>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <hr class="hrnone">

    <!-- 회원가입 완료 버튼-->
    <div class="text-center">
        <button type="button" id="compljoin" class="btn btn-success">
            메인 페이지로 이동</button>
        <hr>
    </div>

</div>

