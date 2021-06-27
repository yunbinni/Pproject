<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="main">
    <!-- 구글 리캡챠 -->
    <script src="https://www.google.com/recaptcha/api.js"></script>

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
            <li class="breadcrumb-item active">
                <button type="button" disabled class="btn btn-primary">
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
        <h2>회원정보 입력</h2>
        <small class="text-muted">
            회원정보는 개인정보 취급방침에 따라 안전하게 보호되며, 회원님의 명백한 동의없이 공개 또는 제 3자에게 제공되지 않습니다.
        </small>
        <hr>
    </div>

    <!-- 회원정보 입력 폼 -->
    <div class="card card-body bg-light">
        <h3>내 정보</h3>
        <form name="joinmefrm" id="joinmefrm">
            <div class="row">
                <div class="col-11 offset-1">
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-primary text-right"
                               for="name"><span class="text-danger"> * </span>이름</label>
                        <input type="text" name="name" id="name" class="border-primary form-control col-2"
                               readonly value="${param.name}">
                    </div> <!-- 이름 -->
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-primary text-right" for="jumin1">
                            <span class="text-danger"> * </span>주민번호</label>
                        <input type="text" name="jumin1" id="jumin1" class="border-primary form-control col-2"
                               readonly value="${param.jumin1}">
                        <span class="col-form-label">&nbsp; &mdash; &nbsp;</span>
                        <input type="password" name="jumin2" id="jumin2" class="border-primary form-control col-2"
                               readonly value="${param.jumin2}">
                        <span class="col-form-label" id="jmmsg"></span>
                    </div> <!-- 주민번호 -->
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-primary text-right" for="userid">
                            <span class="text-danger"> * </span>아이디</label>
                        <input type="text" name="userid" id="userid" class="border-primary form-control col-3">
                        <span class="col-form-label" id="uidmsg">
                            <small>&nbsp;&nbsp;&nbsp;4~16자의 영문 소문자와 숫자, 특수기호(_)로 첫자는 영문만 사용가능합니다.</small></span>
                    </div> <!-- 아이디 -->
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-primary text-right" for="passwd">
                            <span class="text-danger"> * </span>비밀번호</label>
                        <input type="password" name="passwd" id="passwd" class="border-primary form-control col-3">
                        <span id="pwdmsg" class="col-form-label">
                            <small>&nbsp;&nbsp;&nbsp;8자이상 영문 소문자와 숫자, 특수기호(!,@,^,*,_)만 사용하며 각 문자가 1자이상씩 포함되어야 합니다.</small></span>
                    </div> <!-- 비번 -->
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-primary text-right" for="repasswd">
                            <span class="text-danger"> * </span>비밀번호 확인</label>
                        <input type="password" name="repasswd" id="repasswd" class="border-primary form-control col-3">
                        <span id="repwdmsg" class="col-form-label">
                            <small>&nbsp;&nbsp;&nbsp;비밀번호를 한 번 더 입력해주세요.</small></span>
                    </div> <!-- 비번확인 -->
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-primary text-right" for="zip1">
                            <span class="text-danger"> * </span>우편번호</label>
                        <input type="text" name="zip1" id="zip1" class="border-primary form-control col-1" readonly>
                        <span class="col-form-label">&nbsp; &mdash; &nbsp;</span>
                        <input type="text" name="zip2" id="zip2" class="border-primary form-control col-1" readonly>
                        &nbsp;
                        <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#zipmodal">
                            <i class="fas fa-search"></i>
                            우편번호 찾기</button>
                    </div> <!-- 우편번호 -->
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-primary text-right" for="addr1">
                            <span class="text-danger"> * </span>주소</label>
                        <input type="text" name="addr1" id="addr1" class="border-primary form-control col-4">
                        &nbsp;&nbsp;
                        <input type="text" name="addr2" id="addr2" class="border-primary form-control col-4">
                    </div> <!-- 주소 -->
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-primary text-right" for="email1">
                            <span class="text-danger"> * </span>전자우편 주소</label>
                        <input type="text" name="email1" id="email1"
                               class="border-primary form-control col-2" readonly value="${param.email1}">
                        <span class="col-form-label">&nbsp;<i class="fas fa-at"></i>&nbsp;</span>
                        <input type="text" name="email2" id="email2"
                               class="border-primary form-control col-2" readonly value="${param.email2}">
                        &nbsp;
                        <select class="form-control border-primary col-2" id="email3">
                            <option value="emoff">-선택하세요-</option>
                            <option value="emoff">직접 입력</option>
                            <option value="emoff">naver.com</option>
                            <option value="emoff">gmail.com</option>
                            <option value="emoff">hanmail.net</option>
                            <option value="emoff">daum.net</option>
                            <option value="emoff">hotmail.com</option>
                        </select>
                        &nbsp;<span class="col-form-label" id="emmsg"></span>
<%--                        <button type="button" id="emailbtn" class="btn btn-dark">--%>
<%--                            <i class="fas fa-paper-plane"></i> 메일 인증하기</button>--%>
                    </div> <!-- 이메일 -->
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-primary text-right" for="tel1">
                            <span class="text-danger"> * </span>휴대폰번호</label>
                        <input type="text" name="tel1" id="tel1"
                               class="border-primary form-control col-1 text-center" value="010" readonly>
                        <span class="col-form-label">&nbsp; &mdash; &nbsp;</span>
                        <input type="text" name="tel2" id="tel2" class="border-primary form-control col-2">
                        <span class="col-form-label">&nbsp; &mdash; &nbsp;</span>
                        <input type="text" name="tel3" id="tel3" class="border-primary form-control col-2">
                    </div> <!-- 휴대폰번호-->
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-primary text-right" for="htel1">
                            전화번호</label>
                        <select class="form-control border-primary col-2" name="htel1" id="htel1">
                            <option>-지역번호-</option>
                            <option>02</option>
                            <option>031</option>
                            <option>032</option>
                            <option>032</option>
                            <option>041</option>
                            <option>042</option>
                            <option>043</option>
                            <option>044</option>
                            <option>051</option>
                            <option>052</option>
                            <option>053</option>
                            <option>054</option>
                            <option>055</option>
                            <option>061</option>
                            <option>062</option>
                            <option>063</option>
                            <option>064</option>
                        </select>
                        <span class="col-form-label">&nbsp; &mdash; &nbsp;</span>
                        <input type="text" name="htel2" id="htel2" class="border-primary form-control col-2">
                        <span class="col-form-label">&nbsp; &mdash; &nbsp;</span>
                        <input type="text" name="htel3" id="htel3" class="border-primary form-control col-2">
                    </div> <!-- 전화번호-->
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-primary text-right" >
                            주차장 선호도</label>
                        <div class="custom-control custom-checkbox custom-control-inline">
                            <input type="checkbox" name="pref" class="custom-control-input" id="pdist" value="pdist">
                            <label for="pdist" class="custom-control-label">
                                 거리</label>
                        </div>
                        <div class="custom-control custom-checkbox custom-control-inline">
                            <input type="checkbox" name="pref" class="custom-control-input" id="pfee" value="pfee">
                            <label for="pfee" class="custom-control-label">
                                요금</label>
                        </div>
                        <div class="custom-control custom-checkbox custom-control-inline">
                            <input type="checkbox" name="pref" class="custom-control-input" id="pvalet" value="pvalet">
                            <label for="pvalet" class="custom-control-label">
                                발렛여부</label>
                        </div>
                        <div class="custom-control custom-checkbox custom-control-inline">
                            <input type="checkbox" name="pref" class="custom-control-input" id="pday" value="pday">
                            <label for="pday" class="custom-control-label">
                                요일</label>
                        </div>
                        <div class="custom-control custom-checkbox custom-control-inline">
                            <input type="checkbox" name="pref" class="custom-control-input" id="pgrd" value="pgrd">
                            <label for="pgrd" class="custom-control-label">
                                지상</label>
                        </div>
                        <div class="custom-control custom-checkbox custom-control-inline">
                            <input type="checkbox" name="pref" class="custom-control-input" id="pund" value="pund">
                            <label for="pund" class="custom-control-label">
                                지하</label>
                        </div>
                    </div> <!-- 주차장 선호도 -->

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-primary text-right">
                            <span class="text-danger"> * </span>자동가입방지</label>
                        <div class="g-recaptcha"
                             data-sitekey="6LdlIwgbAAAAAK942RrLAG9Oo4FlNuie0lN3EUKM"></div>
                        <input type="hidden" id="g-recaptcha" name="g-recaptcha" />
                    </div> <!-- 캡차 -->

                    <div class="form-group row">
                        <label class="col-form-label col-2"> </label>
                        <span class="col-form-label col-10 text-danger">
                            <small>(*) 표시가 있는 항목은 필수 입력항목으로 미입력시 회원가입을 하실 수 없습니다.</small></span>
                    </div>
                </div>
            </div>  <!-- 정보입력 -->
            <div class="row">
                <div class="col-12 text-center">
                    <hr>
                    <button type="button" class="btn btn-success" id="joinokbtn">
                        <i class="fas fa-check"></i> 입력완료</button>
                    <button type="button" class="btn btn-danger" id="joincancbtn">
                        <i class="fas fa-times"></i> 입력취소</button>
                </div>
            </div>  <!-- 버튼들-->

            <input type="hidden" name="jumin" id="jumin">
            <input type="hidden" name="zipcode" id="zipcode">
            <input type="hidden" name="email" id="email">
            <input type="hidden" name="cellphone" id="cellphone">
            <input type="hidden" name="hphone2" id="hphone">
            <input type="hidden" name="pref" id="pref">

        </form>
    </div>

    <hr class="hrnone">

    <!-- 우편번호 폼 모달 -->
    <div id="zipmodal" class="modal" role="dialog" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">우편번호 찾기</h3>
                    <button type="button" data-dismiss="modal" class="close">&times;</button>
                </div>
                <div class="modal-body">
                    <form name="zipfrm" id="zipfrm">
                        <div class="form-inline row justify-content-center">
                            <label class="col-form-label text-success text-right" for="dong">
                                검색하실 주소의<br> 동이름을 입력하세요</label>
                            &nbsp;&nbsp;
                            <input type="text" name="dong" id="dong" class="border-success form-control col-4">
                            &nbsp;&nbsp;
                            <button type="button" class="btn btn-success" id="findzipbtn">
                                <i class="fas fa-search"></i> 검색하기</button>
                        </div>
                        <div class="form-group row">
                            <hr class="col-9">
                            <p class="col-12 text-danger text-center">
                                지역의 읍/면/동의 이름을 공백없이 입력하신 후, [검색하기] 버튼을 클릭하세요</p>
                            <select class="col-8 offset-2 form-control" size="10" id="addrlist" name="addrlist">
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" id="sendzip">
                        <i class="bi bi-check-square"></i> 선택하고 닫기</button>
                </div>
            </div>
        </div>
    </div>

</div>
