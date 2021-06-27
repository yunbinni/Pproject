<%@ page pageEncoding="UTF-8"%>

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
            <li class="breadcrumb-item active">
                <button type="button" disabled class="btn btn-primary">
                    실명확인</button>
            </li>
            <li class="breadcrumb-item">
                <button type="button" disabled class="btn btn-light">
                    정보입력</button>
            </li>
            <li class="breadcrumb-item">
                <button type="button" disabled class="btn btn-light">
                    가입완료</button>
            </li>
        </ul>
    </nav>

    <!--섹션 타이틀-->
    <div>
        <h2>실명확인을 위한 본인인증</h2>
        <small class="text-muted">
            실명확인을 위한 본인인증 단계입니다. <br>
            이메일 혹은 주민등록번호로 실명인증 가능하며, 해당 인증 이후 다음 단계로의 이동이 가능합니다.
        </small>
        <hr>
    </div>

    <!-- 이메일 실명확인 폼 -->
    <div class="card card-body bg-light">
        <h3>이메일 본인확인</h3>
        <form name="checkmefrm1" id="checkmefrm1">
            <div class="row">
                <div class="col-5 offset-1">
                    <div class="form-group row">
                        <label class="col-3 col-form-label text-primary text-right"
                            for="name">이름</label>
                        <input type="text" name="name" id="name"
                               class="border-primary form-control col-6">
                    </div>
                    <div class="form-group row">
                        <label class="col-3 col-form-label text-primary text-right"
                               for="email1">이메일</label>
                        <input type="text" name="email1" id="email1"
                            class="border-primary form-control col-3">
                        <span class="col-form-label">&nbsp;<i class="fas fa-at"></i>&nbsp;</span>
                        <input type="text" name="email2" id="email2" class="border-primary
                            form-control col-4" readonly>
                    </div>
                    <div class="form-group row">
                        <label class="col-6"></label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <select class="form-control border-primary col-4" id="email3">
                            <option>-선택하세요-</option>
                            <option>직접 입력</option>
                            <option>naver.com</option>
                            <option>gmail.com</option>
                            <option>hanmail.net</option>
                            <option>daum.net</option>
                            <option>hotmail.com</option>
                        </select>
                    </div>
                    <div class="form-group row">
                        <label class="col-3 col-form-label text-primary text-right"
                               for="emchkinput">인증코드</label>
                        <input type="text" name="emchkinput" id="emchkinput"
                               class="border-primary form-control col-3">
                        &nbsp;
                        <button type="button" id="emsendbtn" class="btn btn-dark">
                            <i class="fas fa-paper-plane"></i> 코드발송</button>
                        &nbsp;
                        <button type="button" id="emchkbtn" class="btn btn-primary">
                            <i class="fas fa-key"></i> 확인</button>
                        <input type="hidden" id="emchkYN" value="false">
                        <input type="hidden" id="inputYN" value="false">
                    </div>

                </div>
                <div class="col-4">
                    <ul>
                        <li>주민번호 입력 없이 이메일 인증으로 회원가입이 가능합니다.</li>
                        <li>이름과 이메일 주소는 <span class="text-danger">추후 변경할 수 없습니다.</span></li>
                        <li><span class="text-danger">발송된 이메일로 가입인증</span>을 하셔야 공개 게시판 이용이 가능합니다.</li>
                    </ul>
                </div>
            </div>

            <!-- 확인/취소 버튼 -->
            <div class="row">
                <div class="col text-center">
                    <hr class="hrwid">
                    <button type="button" id="chkok1btn" class="btn btn-success">
                        <i class="fas fa-check"></i> 확인하기</button>
                    <button type="button" id="chkcanc1btn" class="btn btn-danger">
                        <i class="fas fa-times"></i> 취소하기</button>
                </div>
            </div>

        </form>
    </div>

    <hr class="hrnone">

    <!-- 주민등록번호 실명확인 폼 -->
    <div class="card card-body bg-light">
        <h3>주민등록번호 실명확인</h3>
        <form name="checkmefrm2" id="checkmefrm2">
            <div class="row">
                <div class="col-5 offset-1"
                     style="margin-top: 60px">
                    <div class="form-group row">
                        <label class="col-4 col-form-label text-primary text-right"
                               for="name2">이름</label>
                        <input type="text" name="name" id="name2" class="border-primary form-control col-6">
                    </div>

                    <div class="form-group row">
                        <label class="col-4 col-form-label text-primary text-right" for="jumin1">
                            주민번호</label>
                        <input type="text" name="jumin1" id="jumin1" size="12" maxlength="6"
                               class="border-primary form-control col-3">
                        <span class="col-form-label">&nbsp;<i class="fas fa-minus"></i>&nbsp;</span>
                        <input type="password" name="jumin2" id="jumin2" size="12" maxlength="7"
                               class="border-primary form-control col-3">
                    </div>

                    <div class="form-group row">
                        <label class="col-4"></label>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" id="chkjumin" name="chkjumin" class="custom-control-input" value="y">
                            <label for="chkjumin" class="custom-control-label text-danger">
                                주민등록번호 처리에 동의합니다.</label>
                        </div>
                    </div>

                </div>

                <div class="col-4">
                    <ul>
                        <li>실명확인 회원가입시 공개 게시판 이용이 가능합니다.</li>
                        <li>타인의 주민등록번호를 임의로 사용하면 <span class="text-danger">'주민등록법'에 의해 3년 이하의 징역 또는 1천만원 이하의 벌금</span>이 부과될 수 있습니다.</li>
                        <li>입력하신 주민등록번호는 <span class="text-danger">별도 저장되지 않으며, 신용평가기관을 통한 실명확인용</span>으로만 이용됩니다.</li>
                        <li>개인정보보호법에 따라 <span>이용동의</span>를 받습니다.</li>
                    </ul>
                </div>
            </div>

            <!-- 확인/취소 버튼 -->
            <div class="row">
                <div class="col text-center">
                    <hr class="hrwid">
                    <button type="button" id="chkok2btn" class="btn btn-success">
                        <i class="fas fa-check"></i> 확인하기</button>
                    <button type="button" id="chkcanc2btn" class="btn btn-danger">
                        <i class="fas fa-times"></i> 취소하기</button>
                </div>
            </div>
        </form>
    </div>

    <hr class="hrnone">

</div>
