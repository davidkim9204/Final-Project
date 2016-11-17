<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/ad.js?ver=1"></script>
<script type="text/javascript" src="js/month.js?ver=1"></script>
<link rel="stylesheet" type="text/css" href="css/calendar.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/month.css?ver=1" />

</head>
<body>
<div class="ad" id="ad" >
	<a class="ad_show" id="ad_show" href="#" >
	<img src="img/Koala.jpg" height = "50" width="97%">
	</a>
	
	<a class="ad_close" id="ad_close" href="#">
	<img src="img/x.jpg" height="50" width="2%" >
	</a>
</div>


<form name="city" method="get">
<fieldset>
<p>지역 								　
<input type="checkbox" name="seoul" />서울
<input type="checkbox" name="gyeonggi" />경기
<input type="checkbox" name="incheon" />인천
<input type="checkbox" name="kangwon" />강원
<input type="checkbox" name="gyeongsang" />경상
<input type="checkbox" name="chungcheong" />충청
<input type="checkbox" name="jeonlado" />전라
<input type="checkbox" name="jeju" />제주
</p>
</fieldset>
</form>

<form name="theme" method="get">
<fieldset>
<p>테마 								　
<input type="checkbox" name="family" />가족
<input type="checkbox" name="couple" />연인
<input type="checkbox" name="friend" />친구
<input type="checkbox" name="alone" />혼자
</p>
</fieldset>
</form>
	<div class='button' id='button'>
	<button id='prev_btn'>prev</button>
	<button id='today_btn'>today</button>
	<button id='next_btn'>next</button>
	</div>
	<div class="cal"></div>
</body>
</html>