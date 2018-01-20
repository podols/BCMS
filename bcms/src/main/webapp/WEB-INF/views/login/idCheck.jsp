<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
<head>
	<meta charset="UTF-8">
	<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<title>bcms</title>
	<script type="text/javascript">
		function popupClose() {
			//window.opener.location.reload();
			if(document.idCheck.idResult.value!=0) {
				window.opener.frm.memId.value = "";
				window.opener.frm.idCheckResult.value = "1";
			}
			else {
				window.opener.frm.idCheckResult.value = "0";
			}
			window.close();
		}
	</script>
</head>
<body>
	<form name="idCheck" method="post">
		<input type="hidden" name="idResult" value="${idResult}">
		<div class="col-lg-12">
			<h4 class="page-header">✴  아이디 중복확인</h4>
		</div>
		<div style="width:310px; margin-left:20px; margin-right:20px;">
			<div align="center">
				<div>
					<c:if test="${idResult==0}">
						<b><c:out value="${memId}"/></b> 는(은) <font color="#0054FF"><b>사용 가능</b></font>한 아이디입니다.
					</c:if>
					<c:if test="${idResult!=0}">
						<b><c:out value="${memId}"/></b> 는(은) <font color="#FF3636"><b>이미 사용 중</b></font>인 아이디입니다.
					</c:if>
				</div>
				<div style="float:right; margin-top:20px;">
					<input type="button" class="btn btn-warning" value="확인" onclick="javascript:popupClose()">
				</div>
			</div>
		</div>
	</form>
</body>
</html>