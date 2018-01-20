<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript">
	function login() {
		alert("로그인");
		document.loginForm.action = "/login.do";
		document.loginForm.submit();
	}
	function onEnterSubmit(){
		var keyCode = window.event.keyCode;
		if(keyCode==13) loginForm.submit();
		document.loginForm.action = "/login.do";
	}
	function memInsertForm(){
		location.href="/memInsertForm.do";
	}
	function main(){
		location.href="/loginForm.do";
	}
</script>

</head>
	<body>
		<div align="center" style="margin-top:12%">
			<a href="javascript:main()"><img src="/resources/img/BCMS.png" style="min-width:300px; width:15%; height:15%"></a>
		</div>
		<div class="container" style="margin-top:20px; max-width:1200px">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="login-panel panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">로그인</h3>
						</div>
						<div class="panel-body">
							<fieldset>
								<form method="post" name="loginForm">
									<div class="form-group">
										<input class="form-control" placeholder="ID" name="memId" type="text" maxlength="12" autofocus required onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,.]/g,'');">
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="Password" name="memPw" type="password"  maxlength="12" onkeydown='javascript:onEnterSubmit()' required>
									</div>
									<c:if test="${errorMsg!=null}">
										<p style="color: red">${errorMsg}</p>
									</c:if>
								</form>
								<input type="button" class="btn btn-lg btn-primary btn-block" value="로그인" onclick="javascript:login()">
								<br>
								<div style="text-align:center">
									<font size="3"><a href="javascript:memInsertForm()">【회원가입】</a></font>
								</div>
							</fieldset>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>