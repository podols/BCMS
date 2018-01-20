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
		//공유명함 커뮤니케이션 리스트화면
		function sharNmeCardComnctnSelectForm() {
			location.href="/sharNmeCardComnctnSelectForm.do"
		}
		
		//공유명함 커뮤니케이션  수정화면
		function sharComnctnUpdateForm() {
			document.update.action = "/sharNmeCardComnctnUpdateForm.do";
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
		<input type="hidden" name="comnctnSeq" value="${selectSharNmeCardComnctnView.comnctnSeq}">
		<input type="hidden" id="cretrSeq" name="comnctnCretrSeq" value="comnctnCretrSeq ${selectSharNmeCardComnctnView.comnctnCretrSeq}">
		<input type="hidden" id="memseq" name="memSeq" value="memSeq ${selectSharNmeCardComnctnView.memSeq}">
		<form name="update" method="post">
			<div class="wrapper" style="width:600px;">
				<table class="table table-bordered" border=1>
					<tr>
						<th style="text-align:center;width:104px">제목</th>
						<td><input class="form-control" type="text" value="${selectSharNmeCardComnctnView.comnctnTitl}" readonly></td>
					</tr>
					<tr>
						<th style="text-align:center">구분</th>
						<td><input class="form-control" id="t" type="text"  value="${selectSharNmeCardComnctnView.comnctnType}" readonly></td>
					</tr>
				</table>	
				<div id="papa" style="display:block">
					<table class="table table-bordered" border=1 style="margin-top:-20px;">
						<tr>
							<th rowspan=2 style="text-align:center;width:104px">참석자</th>				
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
									없음
								</c:otherwise>
							</c:choose>			
							</td>
						</tr>
						<tr>
							<td>
							<input class="form-control" type="text" value="${selectSharNmeCardComnctnView.comnctnNoAtnd}" readonly></td>
						</tr>
					</table>
				</div>
				<table class="table table-bordered" border=1 style="margin-top:-20px;">
					<tr>
						<th style="text-align:center">내용</th>
					</tr>
					<tr>
						<td colspan=2><textarea rows="15" cols="79" disabled>${selectSharNmeCardComnctnView.comnctnContn}</textarea></td>
					</tr>
				</table>
			</div>
			<input type="hidden" name="comnctnSeq" value="${selectSharNmeCardComnctnView.comnctnSeq}">
			<input type="hidden" id="cretrSeq" name="comnctnCretrSeq" value="${selectSharNmeCardComnctnView.comnctnCretrSeq}">
			<input type="hidden" id="memseq" name="memSeq" value="${selectSharNmeCardComnctnView.memSeq}">
			<div style="text-align:right">
				<c:if test="${selectSharNmeCardComnctnView.memSeq == selectSharNmeCardComnctnView.comnctnCretrSeq}">
<!-- 					<input class="btn btn-default" type="button" name="updateBu" value="수정" onclick="javascript:sharComnctnUpdateForm()" target="iframe_a" ID="sharNmeCardComnctnUpdateForm"> -->
				</c:if>
				<input class="btn btn-white" type="button" value="돌아가기" onclick="javascript:sharNmeCardComnctnSelectForm()" target="iframe_a" ID="sharNmeCardComnctnUpdateForm">
			</div>
		</form>
	</body>
</html>