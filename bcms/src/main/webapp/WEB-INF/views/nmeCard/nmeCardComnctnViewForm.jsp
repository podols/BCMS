<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="/resources/dist/css/ui.css" type="text/css">
    	<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">
    	<link rel="stylesheet" href="/resources/dist/css/css/normalize.css">
		<link rel="stylesheet" href="/resources/dist/css/css/default.css">
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="/resources/dist/js/selectize/selectize.js"></script>
	</head>
	<script>
		function nmeCardComnctnSelectForm() {
			location.href="/nmeCardComnctnSelectForm.do"
		}
		function nmeCardComnctnUpdateForm() {
			document.update.action = "/nmeCardComnctnUpdateForm.do";
			document.update.submit();
		}
		// 구분으로 숨기기
		function gogo() {
			var c = document.getElementById("t").value;
		 if (c == "meeting") {
			 document.getElementById("papa").style.display = "block";
	        }
	        else {
	        	document.getElementById("papa").style.display = "none";
	        }
		}
	</script>
	<body onLoad="javascript:gogo();">
	<form name="update" method="post">
		<input type="hidden" name="comnctnSeq" value="${selectNmeCardComnctnView.comnctnSeq}">
		<input type="hidden" id="cretrSeq" name="comnctnCretrSeq" value="${selectNmeCardComnctnView.comnctnCretrSeq}">
		<input type="hidden" id="memseq" name="memSeq" value="${selectNmeCardComnctnView.memSeq}">
		<input type="hidden" value="${loginSeq}">
		<div class="wrapper" style="width:599px; margin-left:1px">
			<table class="table table-bordered" border=1>				
				<tr>
					<th style="text-align:center; width:104px">제목</th>
					<td><input class="form-control" type="text" value="${selectNmeCardComnctnView.comnctnTitl}" readonly></td>
				</tr>
				<tr>
					<th style="text-align:center">구분</th>
					<td>
	            		<input class="form-control" id="t" type="text"  value="${selectNmeCardComnctnView.comnctnType}" readonly>
	            	</td>
				</tr>
			</table>
			<div id="papa" style="display:block">
				<table class="table table-bordered" border=1 style=" margin-top:-20px;">
					<tr>
						<th rowspan=2 style="text-align:center; vertical-align:middle;width:104px">참석자</th>				
						<td>
						<!-- 참석자 입력란 -->			
						<c:choose>
							<c:when test="${selectAtndList.size() != 0}">																					
							<div style="float:left">										
								<select id="licnsSeq" name="licnsSeq" multiple class="demo-default" style="width:480px;" disabled>
									<c:forEach items="${selectAtndList}" var="item">
										<option value="${item.memSeq}" selected>${item.memNme}</option>
									</c:forEach>
								</select>
								<script>
									$('#licnsSeq').selectize({
										
									});
								</script>
							</div>
							</c:when>
							<c:otherwise>
								<input class="form-control" type="text" value=" " readonly>
							</c:otherwise>
						</c:choose>			
						</td>
					</tr>
					<tr>
						<td><input class="form-control" type="text" name="comnctnNoAtnd" value="${selectNmeCardComnctnView.comnctnNoAtnd}" readonly></td>
					</tr>
				</table>
			</div>
				<table class="table table-bordered" border=1 style=" margin-top:-20px;">
					<tr>
						<th style="text-align:center">내용</th>
					</tr>
					<tr>
						<td colspan=2><textarea rows="15" cols="79" disabled>${selectNmeCardComnctnView.comnctnContn}</textarea></td>
					</tr>
				</table>
			<div style="text-align:right;">
<%-- 			<c:if test="${loginSeq == selectNmeCardComnctnView.comnctnCretrSeq}"> --%>
<!-- 				<input class="btn btn-default" type="button" name="updateBu" value="수정" onclick="javascript:nmeCardComnctnUpdateForm()" target="iframe_a" ID="nmeCardComnctnViewForm"> -->
<%-- 			</c:if> --%>
				<input class="btn btn-white" type="button" value="돌아가기" onclick="javascript:nmeCardComnctnSelectForm()" target="iframe_a" ID="nmeCardComnctnViewForm">
			</div>
		</div>
	</form>
	</body>
</html>