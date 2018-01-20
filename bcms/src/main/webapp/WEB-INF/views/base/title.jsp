<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="/resources/dist/css/bootstrap.css" rel="stylesheet">
		<link rel="stylesheet" href="/resources/dist/css/css/normalize.css">
		<link rel="stylesheet" href="/resources/dist/css/css/default.css">
		<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="/resources/dist/css/ui.css" rel="stylesheet" type="text/css">
		<script src="./resources/dist/js/jquery-ui.js"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="/resources/dist/js/selectize/selectize.js"></script>
		<script src="/resources/dist/js/bootstrap.min.js"></script>
		
		<script>
			function logout() {
				alert("로그아웃");
				location.href="/logout.do";
			}
			function nmeCardLogo() {
				location.href="/nmeCardSelectForm.do";
			}
			function recvNmeCard() {
				location.href="/recvNmeCardSelectForm.do";
			}

			function sharNmeCardSelectForm(){
				location.href="/sharNmeCardSelectForm.do";
			}
			
			function nmeCardSelectForm(){
				location.href="/nmeCardSelectForm.do";
			}
			
			function nmeCardBinSelectForm(){
				location.href="/nmeCardBinSelectForm.do";
			}
			function groupListForm(){
				location.href="/groupListForm.do";
			}
			function memSelectViewForm(){
				location.href="/memSelectViewForm.do";
			}
			function recvNmeCardBinSelectForm(){
				location.href="/recvNmeCardBinSelectForm.do";
			}
			function sharNmeCardBinSelectForm(){
				location.href="/sharNmeCardBinSelectForm.do";
			}
		</script>
	</head>
	<body>
		<div align="center" style="margin-top:15px;">
		   <a href="javascript:nmeCardLogo()"><img src="resources/img/BCMS.png"  id="logo"></a>
		</div>
		<div class="navbar-wrapper">
			<nav class="navbar navbar-inverse navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#"><font style="font-size:13pt; font-weight:bold; font-family:Times New Roman;">BCMS</font></a>
					</div>
					<div id="navbar" class="navbar-collapse">
						<ul class="nav navbar-nav" style="margin-top:6px">
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><font style="font-size:13pt; font-weight:bold;">【명함관리】</font></button>
								<ul class="dropdown-menu" role="menu" style="text-align:left;">
									<li><a href="javascript:nmeCardSelectForm()">- 나의 명함 리스트</a></li>
									<li><a href="javascript:sharNmeCardSelectForm()">- 공유 명함 리스트</a></li>
									<li><a href="javascript:recvNmeCard();">- 받은 명함 리스트</a></li>
								</ul>
							</div>
							<div class="btn-group">
								<button type="button" class="btn btn-default" onclick="javascript:groupListForm()"><font style="font-size:13pt; font-weight:bold;">【그룹관리】</font></button>
							</div>
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><font style="font-size:13pt; font-weight:bold;">【휴지통】</font></button>
								<ul class="dropdown-menu" role="menu" style="text-align:left;">
									<li><a href="javascript:nmeCardBinSelectForm()">- 나의 명함 리스트 휴지통</a></li>
									<li><a href="javascript:sharNmeCardBinSelectForm()">- 공유 명함 리스트 휴지통</a></li>
									<li><a href="javascript:recvNmeCardBinSelectForm()">- 받은 명함 리스트 휴지통</a></li>
								</ul>
							</div>
						</ul>
						
						<ul class="nav navbar-nav navbar-right">
							<li><a><font style="font-size:13pt;"><b style="color:white">${loginUser.memNme}</b>님 환영합니다.</font></a></li>
							<li><a href="javascript:memSelectViewForm();"><font style="font-size:13pt; font-weight:bold;">【정보관리】</font></a></li>
					        <li><a href="javascript:logout();"><font style="font-size:13pt; font-weight:bold;">【로그아웃】</font></a></li>
				        </ul>
					</div>
				</div>
			</nav>
		</div>		
	</body>
</html>
