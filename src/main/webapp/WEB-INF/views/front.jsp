<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>(가제)easyPark에 오신 것을 환영합니다!</title>
    <style>
        #wrap {
            width: 1150px;
            margin: 0 auto;
        }
        #menu {
            width: 600px;
            height: 600px;
            margin: 50px auto;
            justify-content: center;
            text-align: center;

            background-color: yellow;
            border: 1px solid red;
        }
        #menu > div {
            background-color: blue;
            width: 250px;
            height: 250px;
            margin: 10px;
            padding: 10px;
            border: 1px solid red;
            display: inline-block;
            font-size: 30pt;
            line-height: 250px;
        }

        #home {
            background-color: blue;
            width: 250px;
            height: 50px;
            margin: 0 auto;
            border: 1px solid red;
            font-size: 30pt;
            text-align: center;
            justify-content: center;
        }
    </style>
</head>
<body>
    <div id="wrap">
        <div>
            <h1 style="text-align: center;">(가제)easyPark</h1>
        </div>

        <div id="menu">
            <div id="info"><a href="/info/info">공지사항</a></div>
            <div id="join"><a href="#">회원가입</a></div>
            <div id="comm"><a href="#">커뮤니티</a></div>
            <div id="find"><a href="#">주차장 찾기</a></div>
            
        </div>

        <div id="home"><a href="main">홈으로</a></div>
    </div>
</body>
</html>