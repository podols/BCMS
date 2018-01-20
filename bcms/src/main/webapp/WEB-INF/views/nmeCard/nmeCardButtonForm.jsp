<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>IFrame 틀 화면</title>
		<link rel="stylesheet" href="/resources/dist/css/tabs.css" type="text/css">
	</head>
	<body>
		<div class="wrapper" style="width:600px; float:left;margin-top: 63px;">
			<div id="css_tabs">
			    <input id="tab1" type="radio" name="tab" checked="checked" />
			    <input id="tab2" type="radio" name="tab" />
			    <label for="tab1" style="margin-left: 0px;">커뮤니케이션</label>
			    <label for="tab2">변경내역</label>
			    <div class="tab1_content"><iframe src="/nmeCardComnctnSelectForm.do?nmeCardSeq=${NmeCardSeq}" width="600px" height="1300px" name="iframe_a" frameborder=0 scrolling=no></iframe></div>
			    <div class="tab2_content"><iframe src="/nmeCardHistrSelectForm.do?nmeCardSeq=${NmeCardSeq}" width="600px" height="1300px" name="iframe_a" frameborder=0 scrolling=no></iframe></div>
			</div>
		</div>		
	</body>
</html>
